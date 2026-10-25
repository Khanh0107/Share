# Thiet ke PS + PL cho KV260: R5F gui UART qua IP AXI UART Lite nam trong PL.
#
#   R5F #0 --M_AXI_HPM0_LPD--> AXI SmartConnect --> AXI UART Lite --tx--> PMOD J2 chan 1 -> RXD CH340
#                                                                <--rx--  PMOD J2 chan 3
#
# Chay: vivado -mode batch -source hw/create_hw.tcl  (hoac Tools > Run Tcl Script trong GUI)

set script_dir [file dirname [file normalize [info script]]]
set root_dir   [file normalize "$script_dir/.."]
set proj_dir   "$root_dir/build/vivado"
set proj_name  kv260_r5_uartlite
set xsa_file   "$root_dir/build/kv260_r5_uartlite.xsa"

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

# Rang buoc chan PMOD
add_files -fileset constrs_1 -norecurse $script_dir/pins.xdc

# --- Block design ---
create_bd_design "system"

# 1. Zynq UltraScale+ MPSoC voi preset KV260
set ps [create_bd_cell -type ip -vlnv xilinx.com:ip:zynq_ultra_ps_e zynq_ultra_ps_e_0]
apply_bd_automation -rule xilinx.com:bd_rule:zynq_ultra_ps_e \
    -config {apply_board_preset "1"} $ps

# Chi giu cong AXI HPM0 LPD (master tu mien LPD, gan RPU) de R5 truy cap AXI UART Lite.
# pl_clk0 = 100 MHz cap clock cho PL. UART1 (MIO 36/37) giu lai de in thong bao debug.
set_property -dict [list \
    CONFIG.PSU__USE__M_AXI_GP0 {0} \
    CONFIG.PSU__USE__M_AXI_GP1 {0} \
    CONFIG.PSU__USE__M_AXI_GP2 {1} \
    CONFIG.PSU__FPGA_PL0_ENABLE {1} \
    CONFIG.PSU__CRL_APB__PL0_REF_CTRL__FREQMHZ {100} \
    CONFIG.PSU__UART0__PERIPHERAL__ENABLE {0} \
    CONFIG.PSU__UART1__PERIPHERAL__ENABLE {1} \
    CONFIG.PSU__UART1__PERIPHERAL__IO {MIO 36 .. 37} \
] $ps

# 2. AXI UART Lite: 115200 8N1 (baud co dinh trong phan cung)
set uartlite [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite axi_uartlite_0]
set_property -dict [list CONFIG.C_BAUDRATE {115200} CONFIG.C_DATA_BITS {8} CONFIG.C_USE_PARITY {0}] $uartlite

# 3. Noi AXI: M_AXI_HPM0_LPD -> AXI SmartConnect -> axi_uartlite_0/S_AXI
#    (tu dong them Processor System Reset va noi clock pl_clk0)
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config [list \
    Clk_master {/zynq_ultra_ps_e_0/pl_clk0 (100 MHz)} \
    Clk_slave  {Auto} \
    Clk_xbar   {Auto} \
    Master     {/zynq_ultra_ps_e_0/M_AXI_HPM0_LPD} \
    Slave      {/axi_uartlite_0/S_AXI} \
    ddr_seg    {Auto} \
    intc_ip    {New AXI SmartConnect} \
    master_apm {0} \
] [get_bd_intf_pins axi_uartlite_0/S_AXI]

# 4. Chan tx/rx ra ngoai (ten phai trung voi pins.xdc)
create_bd_port -dir O uartlite_tx
create_bd_port -dir I uartlite_rx
connect_bd_net [get_bd_ports uartlite_tx] [get_bd_pins axi_uartlite_0/tx]
connect_bd_net [get_bd_ports uartlite_rx] [get_bd_pins axi_uartlite_0/rx]

assign_bd_address
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

# --- Xuat XSA co kem bitstream (dung cho Vitis, chua psu_init.tcl + file .bit) ---
write_hw_platform -fixed -include_bit -force -file $xsa_file
puts "INFO: Da tao $xsa_file"
