vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xilinx_vip
vlib modelsim_lib/msim/axi_infrastructure_v1_1_0
vlib modelsim_lib/msim/axi_vip_v1_1_23
vlib modelsim_lib/msim/zynq_ultra_ps_e_vip_v1_0_23
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/proc_sys_reset_v5_0_17

vmap xilinx_vip modelsim_lib/msim/xilinx_vip
vmap axi_infrastructure_v1_1_0 modelsim_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_23 modelsim_lib/msim/axi_vip_v1_1_23
vmap zynq_ultra_ps_e_vip_v1_0_23 modelsim_lib/msim/zynq_ultra_ps_e_vip_v1_0_23
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap proc_sys_reset_v5_0_17 modelsim_lib/msim/proc_sys_reset_v5_0_17

vlog -work xilinx_vip -64 -incr -mfcu  -sv -L axi_vip_v1_1_23 -L zynq_ultra_ps_e_vip_v1_0_23 -L xilinx_vip "+incdir+/home/bo/AMD/2026.1/data/xilinx_vip/include" \
"/home/bo/AMD/2026.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/home/bo/AMD/2026.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/home/bo/AMD/2026.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/home/bo/AMD/2026.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/home/bo/AMD/2026.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/home/bo/AMD/2026.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/home/bo/AMD/2026.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/home/bo/AMD/2026.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/home/bo/AMD/2026.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work axi_infrastructure_v1_1_0 -64 -incr -mfcu  "+incdir+../../../../kv260_pl_uart.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../kv260_pl_uart.gen/sources_1/bd/system/ipshared/cec9/hdl" "+incdir+../../../../../../../../../AMD/2026.1/data/rsb/busdef" "+incdir+/home/bo/AMD/2026.1/data/xilinx_vip/include" \
"../../../../kv260_pl_uart.gen/sources_1/bd/system/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_23 -64 -incr -mfcu  -sv -L axi_vip_v1_1_23 -L zynq_ultra_ps_e_vip_v1_0_23 -L xilinx_vip "+incdir+../../../../kv260_pl_uart.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../kv260_pl_uart.gen/sources_1/bd/system/ipshared/cec9/hdl" "+incdir+../../../../../../../../../AMD/2026.1/data/rsb/busdef" "+incdir+/home/bo/AMD/2026.1/data/xilinx_vip/include" \
"../../../../kv260_pl_uart.gen/sources_1/bd/system/ipshared/4d28/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work zynq_ultra_ps_e_vip_v1_0_23 -64 -incr -mfcu  -sv -L axi_vip_v1_1_23 -L zynq_ultra_ps_e_vip_v1_0_23 -L xilinx_vip "+incdir+../../../../kv260_pl_uart.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../kv260_pl_uart.gen/sources_1/bd/system/ipshared/cec9/hdl" "+incdir+../../../../../../../../../AMD/2026.1/data/rsb/busdef" "+incdir+/home/bo/AMD/2026.1/data/xilinx_vip/include" \
"../../../../kv260_pl_uart.gen/sources_1/bd/system/ipshared/cec9/hdl/zynq_ultra_ps_e_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../kv260_pl_uart.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../kv260_pl_uart.gen/sources_1/bd/system/ipshared/cec9/hdl" "+incdir+../../../../../../../../../AMD/2026.1/data/rsb/busdef" "+incdir+/home/bo/AMD/2026.1/data/xilinx_vip/include" \
"../../../bd/system/ip/system_zynq_ultra_ps_e_0_0/sim/system_zynq_ultra_ps_e_0_0_vip_wrapper.v" \

vcom -work proc_sys_reset_v5_0_17 -64 -93  \
"../../../../kv260_pl_uart.gen/sources_1/bd/system/ipshared/9438/hdl/proc_sys_reset_v5_0_rfs.vhd" \

vcom -work xil_defaultlib -64 -93  \
"../../../bd/system/ip/system_proc_sys_reset_0_0/sim/system_proc_sys_reset_0_0.vhd" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../kv260_pl_uart.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../kv260_pl_uart.gen/sources_1/bd/system/ipshared/cec9/hdl" "+incdir+../../../../../../../../../AMD/2026.1/data/rsb/busdef" "+incdir+/home/bo/AMD/2026.1/data/xilinx_vip/include" \
"../../../bd/system/ip/system_hello_pl_0_0/sim/system_hello_pl_0_0.v" \
"../../../bd/system/sim/system.v" \

vlog -work xil_defaultlib \
"glbl.v"

