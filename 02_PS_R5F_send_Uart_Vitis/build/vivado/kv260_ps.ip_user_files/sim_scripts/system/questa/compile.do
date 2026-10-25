vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xilinx_vip
vlib questa_lib/msim/axi_infrastructure_v1_1_0
vlib questa_lib/msim/axi_vip_v1_1_23
vlib questa_lib/msim/zynq_ultra_ps_e_vip_v1_0_23
vlib questa_lib/msim/xil_defaultlib

vmap xilinx_vip questa_lib/msim/xilinx_vip
vmap axi_infrastructure_v1_1_0 questa_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_23 questa_lib/msim/axi_vip_v1_1_23
vmap zynq_ultra_ps_e_vip_v1_0_23 questa_lib/msim/zynq_ultra_ps_e_vip_v1_0_23
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

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

vlog -work axi_infrastructure_v1_1_0 -64 -incr -mfcu  "+incdir+../../../../kv260_ps.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../kv260_ps.gen/sources_1/bd/system/ipshared/cec9/hdl" "+incdir+../../../../../../../../../AMD/2026.1/data/rsb/busdef" "+incdir+/home/bo/AMD/2026.1/data/xilinx_vip/include" \
"../../../../kv260_ps.gen/sources_1/bd/system/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_23 -64 -incr -mfcu  -sv -L axi_vip_v1_1_23 -L zynq_ultra_ps_e_vip_v1_0_23 -L xilinx_vip "+incdir+../../../../kv260_ps.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../kv260_ps.gen/sources_1/bd/system/ipshared/cec9/hdl" "+incdir+../../../../../../../../../AMD/2026.1/data/rsb/busdef" "+incdir+/home/bo/AMD/2026.1/data/xilinx_vip/include" \
"../../../../kv260_ps.gen/sources_1/bd/system/ipshared/4d28/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work zynq_ultra_ps_e_vip_v1_0_23 -64 -incr -mfcu  -sv -L axi_vip_v1_1_23 -L zynq_ultra_ps_e_vip_v1_0_23 -L xilinx_vip "+incdir+../../../../kv260_ps.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../kv260_ps.gen/sources_1/bd/system/ipshared/cec9/hdl" "+incdir+../../../../../../../../../AMD/2026.1/data/rsb/busdef" "+incdir+/home/bo/AMD/2026.1/data/xilinx_vip/include" \
"../../../../kv260_ps.gen/sources_1/bd/system/ipshared/cec9/hdl/zynq_ultra_ps_e_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../kv260_ps.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../kv260_ps.gen/sources_1/bd/system/ipshared/cec9/hdl" "+incdir+../../../../../../../../../AMD/2026.1/data/rsb/busdef" "+incdir+/home/bo/AMD/2026.1/data/xilinx_vip/include" \
"../../../bd/system/ip/system_zynq_ultra_ps_e_0_0/sim/system_zynq_ultra_ps_e_0_0_vip_wrapper.v" \
"../../../bd/system/sim/system.v" \

vlog -work xil_defaultlib \
"glbl.v"

