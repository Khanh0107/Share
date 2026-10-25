transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xilinx_vip
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/axi_vip_v1_1_23
vlib riviera/zynq_ultra_ps_e_vip_v1_0_23
vlib riviera/xil_defaultlib
vlib riviera/proc_sys_reset_v5_0_17

vmap xilinx_vip riviera/xilinx_vip
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_23 riviera/axi_vip_v1_1_23
vmap zynq_ultra_ps_e_vip_v1_0_23 riviera/zynq_ultra_ps_e_vip_v1_0_23
vmap xil_defaultlib riviera/xil_defaultlib
vmap proc_sys_reset_v5_0_17 riviera/proc_sys_reset_v5_0_17

vlog -work xilinx_vip  -incr "+incdir+/home/bo/AMD/2026.1/data/xilinx_vip/include" -l xilinx_vip -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l zynq_ultra_ps_e_vip_v1_0_23 -l xil_defaultlib -l proc_sys_reset_v5_0_17 \
"/home/bo/AMD/2026.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/home/bo/AMD/2026.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/home/bo/AMD/2026.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/home/bo/AMD/2026.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/home/bo/AMD/2026.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/home/bo/AMD/2026.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/home/bo/AMD/2026.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/home/bo/AMD/2026.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/home/bo/AMD/2026.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work axi_infrastructure_v1_1_0  -incr -v2k5 "+incdir+../../../../kv260_pl_uart.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../kv260_pl_uart.gen/sources_1/bd/system/ipshared/cec9/hdl" "+incdir+../../../../../../../../../AMD/2026.1/data/rsb/busdef" "+incdir+/home/bo/AMD/2026.1/data/xilinx_vip/include" -l xilinx_vip -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l zynq_ultra_ps_e_vip_v1_0_23 -l xil_defaultlib -l proc_sys_reset_v5_0_17 \
"../../../../kv260_pl_uart.gen/sources_1/bd/system/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_23  -incr "+incdir+../../../../kv260_pl_uart.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../kv260_pl_uart.gen/sources_1/bd/system/ipshared/cec9/hdl" "+incdir+../../../../../../../../../AMD/2026.1/data/rsb/busdef" "+incdir+/home/bo/AMD/2026.1/data/xilinx_vip/include" -l xilinx_vip -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l zynq_ultra_ps_e_vip_v1_0_23 -l xil_defaultlib -l proc_sys_reset_v5_0_17 \
"../../../../kv260_pl_uart.gen/sources_1/bd/system/ipshared/4d28/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work zynq_ultra_ps_e_vip_v1_0_23  -incr "+incdir+../../../../kv260_pl_uart.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../kv260_pl_uart.gen/sources_1/bd/system/ipshared/cec9/hdl" "+incdir+../../../../../../../../../AMD/2026.1/data/rsb/busdef" "+incdir+/home/bo/AMD/2026.1/data/xilinx_vip/include" -l xilinx_vip -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l zynq_ultra_ps_e_vip_v1_0_23 -l xil_defaultlib -l proc_sys_reset_v5_0_17 \
"../../../../kv260_pl_uart.gen/sources_1/bd/system/ipshared/cec9/hdl/zynq_ultra_ps_e_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../kv260_pl_uart.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../kv260_pl_uart.gen/sources_1/bd/system/ipshared/cec9/hdl" "+incdir+../../../../../../../../../AMD/2026.1/data/rsb/busdef" "+incdir+/home/bo/AMD/2026.1/data/xilinx_vip/include" -l xilinx_vip -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l zynq_ultra_ps_e_vip_v1_0_23 -l xil_defaultlib -l proc_sys_reset_v5_0_17 \
"../../../bd/system/ip/system_zynq_ultra_ps_e_0_0/sim/system_zynq_ultra_ps_e_0_0_vip_wrapper.v" \

vcom -work proc_sys_reset_v5_0_17 -93  -incr \
"../../../../kv260_pl_uart.gen/sources_1/bd/system/ipshared/9438/hdl/proc_sys_reset_v5_0_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/system/ip/system_proc_sys_reset_0_0/sim/system_proc_sys_reset_0_0.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../kv260_pl_uart.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../kv260_pl_uart.gen/sources_1/bd/system/ipshared/cec9/hdl" "+incdir+../../../../../../../../../AMD/2026.1/data/rsb/busdef" "+incdir+/home/bo/AMD/2026.1/data/xilinx_vip/include" -l xilinx_vip -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l zynq_ultra_ps_e_vip_v1_0_23 -l xil_defaultlib -l proc_sys_reset_v5_0_17 \
"../../../bd/system/ip/system_hello_pl_0_0/sim/system_hello_pl_0_0.v" \
"../../../bd/system/sim/system.v" \

vlog -work xil_defaultlib \
"glbl.v"

