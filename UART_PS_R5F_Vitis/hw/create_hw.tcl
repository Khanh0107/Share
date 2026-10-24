# Tao thiet ke phan cung chi gom PS (khong dung PL) cho KV260 va xuat file XSA.
# Chay: vivado -mode batch -source hw/create_hw.tcl

set script_dir [file dirname [file normalize [info script]]]
set root_dir   [file normalize "$script_dir/.."]
set proj_dir   "$root_dir/build/vivado"
set proj_name  kv260_ps
set xsa_file   "$root_dir/build/kv260_ps.xsa"

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

# --- Block design: chi co Zynq UltraScale+ MPSoC ---
create_bd_design "system"
set ps [create_bd_cell -type ip -vlnv xilinx.com:ip:zynq_ultra_ps_e zynq_ultra_ps_e_0]
apply_bd_automation -rule xilinx.com:bd_rule:zynq_ultra_ps_e \
    -config {apply_board_preset "1"} $ps

# Tat cac cong AXI sang PL (khong dung PL, tranh loi clock chua noi).
# UART1 tren MIO 36..37 noi voi chip FTDI -> /dev/ttyUSB1 tren PC.
set_property -dict [list \
    CONFIG.PSU__USE__M_AXI_GP0 {0} \
    CONFIG.PSU__USE__M_AXI_GP1 {0} \
    CONFIG.PSU__USE__M_AXI_GP2 {0} \
    CONFIG.PSU__UART0__PERIPHERAL__ENABLE {0} \
    CONFIG.PSU__UART1__PERIPHERAL__ENABLE {1} \
    CONFIG.PSU__UART1__PERIPHERAL__IO {MIO 36 .. 37} \
] $ps

validate_bd_design
save_bd_design

set bd_file [get_files system.bd]
generate_target all $bd_file
make_wrapper -files $bd_file -top
add_files -norecurse [glob $proj_dir/$proj_name.gen/sources_1/bd/system/hdl/system_wrapper.v]
set_property top system_wrapper [current_fileset]
update_compile_order -fileset sources_1

# --- Xuat XSA (khong co bitstream vi khong dung PL) ---
write_hw_platform -fixed -force -file $xsa_file
puts "INFO: Da tao $xsa_file"

# Khong can sinh hw_config.h nhu ban thanh ghi: Vitis doc XSA va tu sinh xparameters.h
# (dia chi ngoai vi, tan so clock UART/CPU/TTC...) khi tao platform.
