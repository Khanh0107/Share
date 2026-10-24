//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2026.1 (lin64) Build 6511674 Tue Jun 16 11:01:26 MDT 2026
//Date        : Fri Oct 23 22:37:50 2026
//Host        : bo running 64-bit Ubuntu 22.04.5 LTS
//Command     : generate_target system.bd
//Design      : system
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "system,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=system,x_ipVersion=1.00.a,x_ipLanguage=VERILOG}" *) (* HW_HANDOFF = "system.hwdef" *) 
module system
   ();


  system_zynq_ultra_ps_e_0_0 zynq_ultra_ps_e_0
       (.pl_ps_irq0(1'b0));
endmodule
