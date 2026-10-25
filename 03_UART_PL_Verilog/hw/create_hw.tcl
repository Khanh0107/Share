# Thiet ke PL cho KV260: khoi Verilog hello_pl tu gui "Hello World" ra PMOD J2 chan 1.
# PS chi cap clock (pl_clk0 = 100 MHz) va reset (pl_resetn0) cho PL, khong chay code.
# Chay: vivado -mode batch -source hw/create_hw.tcl  (hoac Tools > Run Tcl Script trong GUI)

set script_dir [file dirname [file normalize [info script]]]
set root_dir   [file normalize "$script_dir/.."]
set proj_dir   "$root_dir/build/vivado"
set proj_name  kv260_pl_uart
set xsa_file   "$root_dir/build/kv260_pl_uart.xsa"

# --- Board files KV260 (tai tu Xilinx Board Store neu chua co) ---
if {[llength [get_board_parts -quiet *kv260_som*]] == 0} {
    puts "INFO: Chua co board file KV260, dang tai tu Xilinx Board Store..."
    xhub::refresh_catalog [xhub::get_xstores xilinx_board_store]
    xhub::install [xhub::get_xitems -quiet *kv260_som*]
    xhub::install [xhub::get_xitems -quiet *kv260_carrier*]
}
set som_part [lindex [get_board_parts -latest_file_version *kv260_som*] 0]
if {$som_part eq ""} {
    error "Khong tim thay board part KV260. Cai board file bang Vivado: Tools > Vivado Store > Boards."
}
puts "INFO: Dung board part $som_part"

# --- Tao project ---
create_project $proj_name $proj_dir -part xck26-sfvc784-2LV-c -force
set_property board_part $som_part [current_project]
set carrier [lindex [get_board_parts -quiet -latest_file_version *kv260_carrier*] 0]
if {$carrier ne ""} {
    regsub {:part0:} $carrier {:som240_1_connector:} carrier_conn
    catch {set_property board_connections "som240_1_connector $carrier_conn" [current_project]}
}

# Khoi Verilog tu viet + rang buoc chan
add_files -norecurse $script_dir/hello_pl.v
add_files -fileset constrs_1 -norecurse $script_dir/pins.xdc
update_compile_order -fileset sources_1

# --- Block design ---
create_bd_design "system"

# 1. Zynq UltraScale+ MPSoC voi preset KV260: chi dung de cap clock + reset cho PL
set ps [create_bd_cell -type ip -vlnv xilinx.com:ip:zynq_ultra_ps_e zynq_ultra_ps_e_0]
apply_bd_automation -rule xilinx.com:bd_rule:zynq_ultra_ps_e \
    -config {apply_board_preset "1"} $ps

# Tat het cong AXI (PL khong noi chuyen voi CPU). Bat pl_clk0 = 100 MHz.
set_property -dict [list \
    CONFIG.PSU__USE__M_AXI_GP0 {0} \
    CONFIG.PSU__USE__M_AXI_GP1 {0} \
    CONFIG.PSU__USE__M_AXI_GP2 {0} \
    CONFIG.PSU__FPGA_PL0_ENABLE {1} \
    CONFIG.PSU__CRL_APB__PL0_REF_CTRL__FREQMHZ {100} \
] $ps

# 2. Processor System Reset: dong bo pl_resetn0 (tu PS) voi clock pl_clk0
set rst [create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset rst_pl_100M]
connect_bd_net [get_bd_pins zynq_ultra_ps_e_0/pl_clk0]    [get_bd_pins rst_pl_100M/slowest_sync_clk]
connect_bd_net [get_bd_pins zynq_ultra_ps_e_0/pl_resetn0] [get_bd_pins rst_pl_100M/ext_reset_in]

# 3. Khoi hello_pl (module reference tu hello_pl.v)
create_bd_cell -type module -reference hello_pl hello_pl_0
connect_bd_net [get_bd_pins zynq_ultra_ps_e_0/pl_clk0]          [get_bd_pins hello_pl_0/clk]
connect_bd_net [get_bd_pins rst_pl_100M/peripheral_aresetn]     [get_bd_pins hello_pl_0/resetn]
create_bd_port -dir O pl_hello_tx
connect_bd_net [get_bd_ports pl_hello_tx] [get_bd_pins hello_pl_0/tx]

validate_bd_design
save_bd_design

set bd_file [get_files system.bd]
generate_target all $bd_file
make_wrapper -files $bd_file -top
add_files -norecurse [glob $proj_dir/$proj_name.gen/sources_1/bd/system/hdl/system_wrapper.v]
set_property top system_wrapper [current_fileset]
update_compile_order -fileset sources_1

# --- Synthesis + Implementation + Bitstream ---
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
if {[get_property PROGRESS [get_runs impl_1]] ne "100%"} {
    error "Implementation/bitstream that bai, xem $proj_dir/$proj_name.runs/impl_1/runme.log"
}

# --- Xuat XSA co kem bitstream (chua psu_init.tcl + file .bit) ---
write_hw_platform -fixed -include_bit -force -file $xsa_file
puts "INFO: Da tao $xsa_file"
