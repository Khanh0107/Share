// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2026.1 (lin64) Build 6511674 Tue Jun 16 11:01:26 MDT 2026
// Date        : Sun Oct 25 21:04:52 2026
// Host        : bo running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/bo/linux/KV260/03_PL_send_Uart_Verilog/build/vivado/kv260_pl_uart.gen/sources_1/bd/system/ip/system_hello_pl_0_0/system_hello_pl_0_0_sim_netlist.v
// Design      : system_hello_pl_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xck26-sfvc784-2LV-c
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "system_hello_pl_0_0,hello_pl,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "hello_pl,Vivado 2026.1" *) 
(* NotValidForBitStream *)
module system_hello_pl_0_0
   (clk,
    resetn,
    tx);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET resetn, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 resetn RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input resetn;
  output tx;

  wire clk;
  wire resetn;
  wire tx;

  system_hello_pl_0_0_hello_pl inst
       (.clk(clk),
        .resetn(resetn),
        .tx(tx));
endmodule

(* ORIG_REF_NAME = "hello_pl" *) 
module system_hello_pl_0_0_hello_pl
   (tx,
    resetn,
    clk);
  output tx;
  input resetn;
  input clk;

  wire \char_idx[0]_i_1_n_0 ;
  wire \char_idx[1]_i_1_n_0 ;
  wire \char_idx[2]_i_1_n_0 ;
  wire \char_idx[3]_i_1_n_0 ;
  wire \char_idx[5]_i_1_n_0 ;
  wire \char_idx[5]_i_2_n_0 ;
  wire [5:0]char_idx_reg;
  wire clk;
  wire [31:1]data0;
  wire p_0_in;
  wire [5:4]p_0_in__0;
  wire resetn;
  wire sending_reg_inv_n_0;
  wire start_i_2_n_0;
  wire start_reg_n_0;
  wire tx;
  wire u_tx_n_1;
  wire u_tx_n_2;
  wire [31:0]wait_cnt;
  wire wait_cnt0_carry__0_n_0;
  wire wait_cnt0_carry__0_n_1;
  wire wait_cnt0_carry__0_n_2;
  wire wait_cnt0_carry__0_n_3;
  wire wait_cnt0_carry__0_n_4;
  wire wait_cnt0_carry__0_n_5;
  wire wait_cnt0_carry__0_n_6;
  wire wait_cnt0_carry__0_n_7;
  wire wait_cnt0_carry__1_n_0;
  wire wait_cnt0_carry__1_n_1;
  wire wait_cnt0_carry__1_n_2;
  wire wait_cnt0_carry__1_n_3;
  wire wait_cnt0_carry__1_n_4;
  wire wait_cnt0_carry__1_n_5;
  wire wait_cnt0_carry__1_n_6;
  wire wait_cnt0_carry__1_n_7;
  wire wait_cnt0_carry__2_n_2;
  wire wait_cnt0_carry__2_n_3;
  wire wait_cnt0_carry__2_n_4;
  wire wait_cnt0_carry__2_n_5;
  wire wait_cnt0_carry__2_n_6;
  wire wait_cnt0_carry__2_n_7;
  wire wait_cnt0_carry_n_0;
  wire wait_cnt0_carry_n_1;
  wire wait_cnt0_carry_n_2;
  wire wait_cnt0_carry_n_3;
  wire wait_cnt0_carry_n_4;
  wire wait_cnt0_carry_n_5;
  wire wait_cnt0_carry_n_6;
  wire wait_cnt0_carry_n_7;
  wire \wait_cnt[31]_i_2_n_0 ;
  wire \wait_cnt[31]_i_3_n_0 ;
  wire \wait_cnt[31]_i_4_n_0 ;
  wire \wait_cnt[31]_i_5_n_0 ;
  wire \wait_cnt[31]_i_6_n_0 ;
  wire \wait_cnt[31]_i_7_n_0 ;
  wire \wait_cnt[31]_i_8_n_0 ;
  wire \wait_cnt[31]_i_9_n_0 ;
  wire \wait_cnt_reg_n_0_[0] ;
  wire \wait_cnt_reg_n_0_[10] ;
  wire \wait_cnt_reg_n_0_[11] ;
  wire \wait_cnt_reg_n_0_[12] ;
  wire \wait_cnt_reg_n_0_[13] ;
  wire \wait_cnt_reg_n_0_[14] ;
  wire \wait_cnt_reg_n_0_[15] ;
  wire \wait_cnt_reg_n_0_[16] ;
  wire \wait_cnt_reg_n_0_[17] ;
  wire \wait_cnt_reg_n_0_[18] ;
  wire \wait_cnt_reg_n_0_[19] ;
  wire \wait_cnt_reg_n_0_[1] ;
  wire \wait_cnt_reg_n_0_[20] ;
  wire \wait_cnt_reg_n_0_[21] ;
  wire \wait_cnt_reg_n_0_[22] ;
  wire \wait_cnt_reg_n_0_[23] ;
  wire \wait_cnt_reg_n_0_[24] ;
  wire \wait_cnt_reg_n_0_[25] ;
  wire \wait_cnt_reg_n_0_[26] ;
  wire \wait_cnt_reg_n_0_[27] ;
  wire \wait_cnt_reg_n_0_[28] ;
  wire \wait_cnt_reg_n_0_[29] ;
  wire \wait_cnt_reg_n_0_[2] ;
  wire \wait_cnt_reg_n_0_[30] ;
  wire \wait_cnt_reg_n_0_[31] ;
  wire \wait_cnt_reg_n_0_[3] ;
  wire \wait_cnt_reg_n_0_[4] ;
  wire \wait_cnt_reg_n_0_[5] ;
  wire \wait_cnt_reg_n_0_[6] ;
  wire \wait_cnt_reg_n_0_[7] ;
  wire \wait_cnt_reg_n_0_[8] ;
  wire \wait_cnt_reg_n_0_[9] ;
  wire [7:6]NLW_wait_cnt0_carry__2_CO_UNCONNECTED;
  wire [7:7]NLW_wait_cnt0_carry__2_O_UNCONNECTED;

  LUT1 #(
    .INIT(2'h1)) 
    \char_idx[0]_i_1 
       (.I0(char_idx_reg[0]),
        .O(\char_idx[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \char_idx[1]_i_1 
       (.I0(char_idx_reg[0]),
        .I1(char_idx_reg[1]),
        .O(\char_idx[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \char_idx[2]_i_1 
       (.I0(char_idx_reg[2]),
        .I1(char_idx_reg[0]),
        .I2(char_idx_reg[1]),
        .O(\char_idx[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \char_idx[3]_i_1 
       (.I0(char_idx_reg[3]),
        .I1(char_idx_reg[2]),
        .I2(char_idx_reg[1]),
        .I3(char_idx_reg[0]),
        .O(\char_idx[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \char_idx[4]_i_1 
       (.I0(char_idx_reg[3]),
        .I1(char_idx_reg[2]),
        .I2(char_idx_reg[1]),
        .I3(char_idx_reg[0]),
        .I4(char_idx_reg[4]),
        .O(p_0_in__0[4]));
  LUT6 #(
    .INIT(64'h00000020FFFFFFFF)) 
    \char_idx[5]_i_1 
       (.I0(sending_reg_inv_n_0),
        .I1(\wait_cnt[31]_i_5_n_0 ),
        .I2(\wait_cnt[31]_i_4_n_0 ),
        .I3(\wait_cnt[31]_i_3_n_0 ),
        .I4(\wait_cnt[31]_i_2_n_0 ),
        .I5(resetn),
        .O(\char_idx[5]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \char_idx[5]_i_2 
       (.I0(start_reg_n_0),
        .I1(sending_reg_inv_n_0),
        .O(\char_idx[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \char_idx[5]_i_3 
       (.I0(char_idx_reg[5]),
        .I1(char_idx_reg[4]),
        .I2(char_idx_reg[3]),
        .I3(char_idx_reg[2]),
        .I4(char_idx_reg[1]),
        .I5(char_idx_reg[0]),
        .O(p_0_in__0[5]));
  FDRE \char_idx_reg[0] 
       (.C(clk),
        .CE(\char_idx[5]_i_2_n_0 ),
        .D(\char_idx[0]_i_1_n_0 ),
        .Q(char_idx_reg[0]),
        .R(\char_idx[5]_i_1_n_0 ));
  FDRE \char_idx_reg[1] 
       (.C(clk),
        .CE(\char_idx[5]_i_2_n_0 ),
        .D(\char_idx[1]_i_1_n_0 ),
        .Q(char_idx_reg[1]),
        .R(\char_idx[5]_i_1_n_0 ));
  FDRE \char_idx_reg[2] 
       (.C(clk),
        .CE(\char_idx[5]_i_2_n_0 ),
        .D(\char_idx[2]_i_1_n_0 ),
        .Q(char_idx_reg[2]),
        .R(\char_idx[5]_i_1_n_0 ));
  FDRE \char_idx_reg[3] 
       (.C(clk),
        .CE(\char_idx[5]_i_2_n_0 ),
        .D(\char_idx[3]_i_1_n_0 ),
        .Q(char_idx_reg[3]),
        .R(\char_idx[5]_i_1_n_0 ));
  FDRE \char_idx_reg[4] 
       (.C(clk),
        .CE(\char_idx[5]_i_2_n_0 ),
        .D(p_0_in__0[4]),
        .Q(char_idx_reg[4]),
        .R(\char_idx[5]_i_1_n_0 ));
  FDRE \char_idx_reg[5] 
       (.C(clk),
        .CE(\char_idx[5]_i_2_n_0 ),
        .D(p_0_in__0[5]),
        .Q(char_idx_reg[5]),
        .R(\char_idx[5]_i_1_n_0 ));
  (* inverted = "yes" *) 
  FDSE sending_reg_inv
       (.C(clk),
        .CE(1'b1),
        .D(u_tx_n_2),
        .Q(sending_reg_inv_n_0),
        .S(p_0_in));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    start_i_2
       (.I0(char_idx_reg[4]),
        .I1(char_idx_reg[3]),
        .I2(char_idx_reg[2]),
        .I3(char_idx_reg[1]),
        .I4(char_idx_reg[0]),
        .I5(char_idx_reg[5]),
        .O(start_i_2_n_0));
  FDRE start_reg
       (.C(clk),
        .CE(1'b1),
        .D(u_tx_n_1),
        .Q(start_reg_n_0),
        .R(1'b0));
  system_hello_pl_0_0_uart_tx u_tx
       (.E(sending_reg_inv_n_0),
        .Q(char_idx_reg[4:0]),
        .SR(p_0_in),
        .busy_reg_0(u_tx_n_1),
        .clk(clk),
        .resetn(resetn),
        .sending_reg_inv(u_tx_n_2),
        .sending_reg_inv_0(\wait_cnt[31]_i_2_n_0 ),
        .sending_reg_inv_1(\wait_cnt[31]_i_3_n_0 ),
        .sending_reg_inv_2(\wait_cnt[31]_i_4_n_0 ),
        .sending_reg_inv_3(\wait_cnt[31]_i_5_n_0 ),
        .start_reg(start_i_2_n_0),
        .tx(tx),
        .tx_reg_0(start_reg_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 wait_cnt0_carry
       (.CI(\wait_cnt_reg_n_0_[0] ),
        .CI_TOP(1'b0),
        .CO({wait_cnt0_carry_n_0,wait_cnt0_carry_n_1,wait_cnt0_carry_n_2,wait_cnt0_carry_n_3,wait_cnt0_carry_n_4,wait_cnt0_carry_n_5,wait_cnt0_carry_n_6,wait_cnt0_carry_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(data0[8:1]),
        .S({\wait_cnt_reg_n_0_[8] ,\wait_cnt_reg_n_0_[7] ,\wait_cnt_reg_n_0_[6] ,\wait_cnt_reg_n_0_[5] ,\wait_cnt_reg_n_0_[4] ,\wait_cnt_reg_n_0_[3] ,\wait_cnt_reg_n_0_[2] ,\wait_cnt_reg_n_0_[1] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 wait_cnt0_carry__0
       (.CI(wait_cnt0_carry_n_0),
        .CI_TOP(1'b0),
        .CO({wait_cnt0_carry__0_n_0,wait_cnt0_carry__0_n_1,wait_cnt0_carry__0_n_2,wait_cnt0_carry__0_n_3,wait_cnt0_carry__0_n_4,wait_cnt0_carry__0_n_5,wait_cnt0_carry__0_n_6,wait_cnt0_carry__0_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(data0[16:9]),
        .S({\wait_cnt_reg_n_0_[16] ,\wait_cnt_reg_n_0_[15] ,\wait_cnt_reg_n_0_[14] ,\wait_cnt_reg_n_0_[13] ,\wait_cnt_reg_n_0_[12] ,\wait_cnt_reg_n_0_[11] ,\wait_cnt_reg_n_0_[10] ,\wait_cnt_reg_n_0_[9] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 wait_cnt0_carry__1
       (.CI(wait_cnt0_carry__0_n_0),
        .CI_TOP(1'b0),
        .CO({wait_cnt0_carry__1_n_0,wait_cnt0_carry__1_n_1,wait_cnt0_carry__1_n_2,wait_cnt0_carry__1_n_3,wait_cnt0_carry__1_n_4,wait_cnt0_carry__1_n_5,wait_cnt0_carry__1_n_6,wait_cnt0_carry__1_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(data0[24:17]),
        .S({\wait_cnt_reg_n_0_[24] ,\wait_cnt_reg_n_0_[23] ,\wait_cnt_reg_n_0_[22] ,\wait_cnt_reg_n_0_[21] ,\wait_cnt_reg_n_0_[20] ,\wait_cnt_reg_n_0_[19] ,\wait_cnt_reg_n_0_[18] ,\wait_cnt_reg_n_0_[17] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 wait_cnt0_carry__2
       (.CI(wait_cnt0_carry__1_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_wait_cnt0_carry__2_CO_UNCONNECTED[7:6],wait_cnt0_carry__2_n_2,wait_cnt0_carry__2_n_3,wait_cnt0_carry__2_n_4,wait_cnt0_carry__2_n_5,wait_cnt0_carry__2_n_6,wait_cnt0_carry__2_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_wait_cnt0_carry__2_O_UNCONNECTED[7],data0[31:25]}),
        .S({1'b0,\wait_cnt_reg_n_0_[31] ,\wait_cnt_reg_n_0_[30] ,\wait_cnt_reg_n_0_[29] ,\wait_cnt_reg_n_0_[28] ,\wait_cnt_reg_n_0_[27] ,\wait_cnt_reg_n_0_[26] ,\wait_cnt_reg_n_0_[25] }));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_cnt[0]_i_1 
       (.I0(\wait_cnt_reg_n_0_[0] ),
        .O(wait_cnt[0]));
  LUT5 #(
    .INIT(32'hAAAAA8AA)) 
    \wait_cnt[10]_i_1 
       (.I0(data0[10]),
        .I1(\wait_cnt[31]_i_2_n_0 ),
        .I2(\wait_cnt[31]_i_3_n_0 ),
        .I3(\wait_cnt[31]_i_4_n_0 ),
        .I4(\wait_cnt[31]_i_5_n_0 ),
        .O(wait_cnt[10]));
  LUT5 #(
    .INIT(32'hAAAAA8AA)) 
    \wait_cnt[11]_i_1 
       (.I0(data0[11]),
        .I1(\wait_cnt[31]_i_2_n_0 ),
        .I2(\wait_cnt[31]_i_3_n_0 ),
        .I3(\wait_cnt[31]_i_4_n_0 ),
        .I4(\wait_cnt[31]_i_5_n_0 ),
        .O(wait_cnt[11]));
  LUT5 #(
    .INIT(32'hAAAAA8AA)) 
    \wait_cnt[12]_i_1 
       (.I0(data0[12]),
        .I1(\wait_cnt[31]_i_2_n_0 ),
        .I2(\wait_cnt[31]_i_3_n_0 ),
        .I3(\wait_cnt[31]_i_4_n_0 ),
        .I4(\wait_cnt[31]_i_5_n_0 ),
        .O(wait_cnt[12]));
  LUT5 #(
    .INIT(32'hAAAAA8AA)) 
    \wait_cnt[13]_i_1 
       (.I0(data0[13]),
        .I1(\wait_cnt[31]_i_2_n_0 ),
        .I2(\wait_cnt[31]_i_3_n_0 ),
        .I3(\wait_cnt[31]_i_4_n_0 ),
        .I4(\wait_cnt[31]_i_5_n_0 ),
        .O(wait_cnt[13]));
  LUT5 #(
    .INIT(32'hAAAAA8AA)) 
    \wait_cnt[14]_i_1 
       (.I0(data0[14]),
        .I1(\wait_cnt[31]_i_2_n_0 ),
        .I2(\wait_cnt[31]_i_3_n_0 ),
        .I3(\wait_cnt[31]_i_4_n_0 ),
        .I4(\wait_cnt[31]_i_5_n_0 ),
        .O(wait_cnt[14]));
  LUT5 #(
    .INIT(32'hAAAAA8AA)) 
    \wait_cnt[15]_i_1 
       (.I0(data0[15]),
        .I1(\wait_cnt[31]_i_2_n_0 ),
        .I2(\wait_cnt[31]_i_3_n_0 ),
        .I3(\wait_cnt[31]_i_4_n_0 ),
        .I4(\wait_cnt[31]_i_5_n_0 ),
        .O(wait_cnt[15]));
  LUT5 #(
    .INIT(32'hAAAAA8AA)) 
    \wait_cnt[16]_i_1 
       (.I0(data0[16]),
        .I1(\wait_cnt[31]_i_2_n_0 ),
        .I2(\wait_cnt[31]_i_3_n_0 ),
        .I3(\wait_cnt[31]_i_4_n_0 ),
        .I4(\wait_cnt[31]_i_5_n_0 ),
        .O(wait_cnt[16]));
  LUT5 #(
    .INIT(32'hAAAAA8AA)) 
    \wait_cnt[17]_i_1 
       (.I0(data0[17]),
        .I1(\wait_cnt[31]_i_2_n_0 ),
        .I2(\wait_cnt[31]_i_3_n_0 ),
        .I3(\wait_cnt[31]_i_4_n_0 ),
        .I4(\wait_cnt[31]_i_5_n_0 ),
        .O(wait_cnt[17]));
  LUT5 #(
    .INIT(32'hAAAAA8AA)) 
    \wait_cnt[18]_i_1 
       (.I0(data0[18]),
        .I1(\wait_cnt[31]_i_2_n_0 ),
        .I2(\wait_cnt[31]_i_3_n_0 ),
        .I3(\wait_cnt[31]_i_4_n_0 ),
        .I4(\wait_cnt[31]_i_5_n_0 ),
        .O(wait_cnt[18]));
  LUT5 #(
    .INIT(32'hAAAAA8AA)) 
    \wait_cnt[19]_i_1 
       (.I0(data0[19]),
        .I1(\wait_cnt[31]_i_2_n_0 ),
        .I2(\wait_cnt[31]_i_3_n_0 ),
        .I3(\wait_cnt[31]_i_4_n_0 ),
        .I4(\wait_cnt[31]_i_5_n_0 ),
        .O(wait_cnt[19]));
  LUT5 #(
    .INIT(32'hAAAAA8AA)) 
    \wait_cnt[1]_i_1 
       (.I0(data0[1]),
        .I1(\wait_cnt[31]_i_2_n_0 ),
        .I2(\wait_cnt[31]_i_3_n_0 ),
        .I3(\wait_cnt[31]_i_4_n_0 ),
        .I4(\wait_cnt[31]_i_5_n_0 ),
        .O(wait_cnt[1]));
  LUT5 #(
    .INIT(32'hAAAAA8AA)) 
    \wait_cnt[20]_i_1 
       (.I0(data0[20]),
        .I1(\wait_cnt[31]_i_2_n_0 ),
        .I2(\wait_cnt[31]_i_3_n_0 ),
        .I3(\wait_cnt[31]_i_4_n_0 ),
        .I4(\wait_cnt[31]_i_5_n_0 ),
        .O(wait_cnt[20]));
  LUT5 #(
    .INIT(32'hAAAAA8AA)) 
    \wait_cnt[21]_i_1 
       (.I0(data0[21]),
        .I1(\wait_cnt[31]_i_2_n_0 ),
        .I2(\wait_cnt[31]_i_3_n_0 ),
        .I3(\wait_cnt[31]_i_4_n_0 ),
        .I4(\wait_cnt[31]_i_5_n_0 ),
        .O(wait_cnt[21]));
  LUT5 #(
    .INIT(32'hAAAAA8AA)) 
    \wait_cnt[22]_i_1 
       (.I0(data0[22]),
        .I1(\wait_cnt[31]_i_2_n_0 ),
        .I2(\wait_cnt[31]_i_3_n_0 ),
        .I3(\wait_cnt[31]_i_4_n_0 ),
        .I4(\wait_cnt[31]_i_5_n_0 ),
        .O(wait_cnt[22]));
  LUT5 #(
    .INIT(32'hAAAAA8AA)) 
    \wait_cnt[23]_i_1 
       (.I0(data0[23]),
        .I1(\wait_cnt[31]_i_2_n_0 ),
        .I2(\wait_cnt[31]_i_3_n_0 ),
        .I3(\wait_cnt[31]_i_4_n_0 ),
        .I4(\wait_cnt[31]_i_5_n_0 ),
        .O(wait_cnt[23]));
  LUT5 #(
    .INIT(32'hAAAAA8AA)) 
    \wait_cnt[24]_i_1 
       (.I0(data0[24]),
        .I1(\wait_cnt[31]_i_2_n_0 ),
        .I2(\wait_cnt[31]_i_3_n_0 ),
        .I3(\wait_cnt[31]_i_4_n_0 ),
        .I4(\wait_cnt[31]_i_5_n_0 ),
        .O(wait_cnt[24]));
  LUT5 #(
    .INIT(32'hAAAAA8AA)) 
    \wait_cnt[25]_i_1 
       (.I0(data0[25]),
        .I1(\wait_cnt[31]_i_2_n_0 ),
        .I2(\wait_cnt[31]_i_3_n_0 ),
        .I3(\wait_cnt[31]_i_4_n_0 ),
        .I4(\wait_cnt[31]_i_5_n_0 ),
        .O(wait_cnt[25]));
  LUT5 #(
    .INIT(32'hAAAAA8AA)) 
    \wait_cnt[26]_i_1 
       (.I0(data0[26]),
        .I1(\wait_cnt[31]_i_2_n_0 ),
        .I2(\wait_cnt[31]_i_3_n_0 ),
        .I3(\wait_cnt[31]_i_4_n_0 ),
        .I4(\wait_cnt[31]_i_5_n_0 ),
        .O(wait_cnt[26]));
  LUT5 #(
    .INIT(32'hAAAAA8AA)) 
    \wait_cnt[27]_i_1 
       (.I0(data0[27]),
        .I1(\wait_cnt[31]_i_2_n_0 ),
        .I2(\wait_cnt[31]_i_3_n_0 ),
        .I3(\wait_cnt[31]_i_4_n_0 ),
        .I4(\wait_cnt[31]_i_5_n_0 ),
        .O(wait_cnt[27]));
  LUT5 #(
    .INIT(32'hAAAAA8AA)) 
    \wait_cnt[28]_i_1 
       (.I0(data0[28]),
        .I1(\wait_cnt[31]_i_2_n_0 ),
        .I2(\wait_cnt[31]_i_3_n_0 ),
        .I3(\wait_cnt[31]_i_4_n_0 ),
        .I4(\wait_cnt[31]_i_5_n_0 ),
        .O(wait_cnt[28]));
  LUT5 #(
    .INIT(32'hAAAAA8AA)) 
    \wait_cnt[29]_i_1 
       (.I0(data0[29]),
        .I1(\wait_cnt[31]_i_2_n_0 ),
        .I2(\wait_cnt[31]_i_3_n_0 ),
        .I3(\wait_cnt[31]_i_4_n_0 ),
        .I4(\wait_cnt[31]_i_5_n_0 ),
        .O(wait_cnt[29]));
  LUT5 #(
    .INIT(32'hAAAAA8AA)) 
    \wait_cnt[2]_i_1 
       (.I0(data0[2]),
        .I1(\wait_cnt[31]_i_2_n_0 ),
        .I2(\wait_cnt[31]_i_3_n_0 ),
        .I3(\wait_cnt[31]_i_4_n_0 ),
        .I4(\wait_cnt[31]_i_5_n_0 ),
        .O(wait_cnt[2]));
  LUT5 #(
    .INIT(32'hAAAAA8AA)) 
    \wait_cnt[30]_i_1 
       (.I0(data0[30]),
        .I1(\wait_cnt[31]_i_2_n_0 ),
        .I2(\wait_cnt[31]_i_3_n_0 ),
        .I3(\wait_cnt[31]_i_4_n_0 ),
        .I4(\wait_cnt[31]_i_5_n_0 ),
        .O(wait_cnt[30]));
  LUT5 #(
    .INIT(32'hAAAAA8AA)) 
    \wait_cnt[31]_i_1 
       (.I0(data0[31]),
        .I1(\wait_cnt[31]_i_2_n_0 ),
        .I2(\wait_cnt[31]_i_3_n_0 ),
        .I3(\wait_cnt[31]_i_4_n_0 ),
        .I4(\wait_cnt[31]_i_5_n_0 ),
        .O(wait_cnt[31]));
  LUT5 #(
    .INIT(32'hFFFFBFFF)) 
    \wait_cnt[31]_i_2 
       (.I0(\wait_cnt_reg_n_0_[8] ),
        .I1(\wait_cnt_reg_n_0_[0] ),
        .I2(\wait_cnt_reg_n_0_[21] ),
        .I3(\wait_cnt_reg_n_0_[22] ),
        .I4(\wait_cnt[31]_i_6_n_0 ),
        .O(\wait_cnt[31]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFB)) 
    \wait_cnt[31]_i_3 
       (.I0(\wait_cnt_reg_n_0_[27] ),
        .I1(\wait_cnt_reg_n_0_[2] ),
        .I2(\wait_cnt_reg_n_0_[28] ),
        .I3(\wait_cnt_reg_n_0_[30] ),
        .I4(\wait_cnt[31]_i_7_n_0 ),
        .O(\wait_cnt[31]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h00004000)) 
    \wait_cnt[31]_i_4 
       (.I0(\wait_cnt_reg_n_0_[12] ),
        .I1(\wait_cnt_reg_n_0_[18] ),
        .I2(\wait_cnt_reg_n_0_[13] ),
        .I3(\wait_cnt_reg_n_0_[14] ),
        .I4(\wait_cnt[31]_i_8_n_0 ),
        .O(\wait_cnt[31]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFEFFF)) 
    \wait_cnt[31]_i_5 
       (.I0(\wait_cnt_reg_n_0_[17] ),
        .I1(\wait_cnt_reg_n_0_[29] ),
        .I2(\wait_cnt_reg_n_0_[15] ),
        .I3(\wait_cnt_reg_n_0_[5] ),
        .I4(\wait_cnt[31]_i_9_n_0 ),
        .O(\wait_cnt[31]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hDFFF)) 
    \wait_cnt[31]_i_6 
       (.I0(\wait_cnt_reg_n_0_[7] ),
        .I1(\wait_cnt_reg_n_0_[10] ),
        .I2(\wait_cnt_reg_n_0_[3] ),
        .I3(\wait_cnt_reg_n_0_[24] ),
        .O(\wait_cnt[31]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFEF)) 
    \wait_cnt[31]_i_7 
       (.I0(\wait_cnt_reg_n_0_[11] ),
        .I1(\wait_cnt_reg_n_0_[19] ),
        .I2(\wait_cnt_reg_n_0_[23] ),
        .I3(\wait_cnt_reg_n_0_[9] ),
        .O(\wait_cnt[31]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFF7F)) 
    \wait_cnt[31]_i_8 
       (.I0(\wait_cnt_reg_n_0_[26] ),
        .I1(\wait_cnt_reg_n_0_[1] ),
        .I2(\wait_cnt_reg_n_0_[20] ),
        .I3(\wait_cnt_reg_n_0_[25] ),
        .O(\wait_cnt[31]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFF7F)) 
    \wait_cnt[31]_i_9 
       (.I0(\wait_cnt_reg_n_0_[6] ),
        .I1(\wait_cnt_reg_n_0_[16] ),
        .I2(\wait_cnt_reg_n_0_[4] ),
        .I3(\wait_cnt_reg_n_0_[31] ),
        .O(\wait_cnt[31]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAA8AA)) 
    \wait_cnt[3]_i_1 
       (.I0(data0[3]),
        .I1(\wait_cnt[31]_i_2_n_0 ),
        .I2(\wait_cnt[31]_i_3_n_0 ),
        .I3(\wait_cnt[31]_i_4_n_0 ),
        .I4(\wait_cnt[31]_i_5_n_0 ),
        .O(wait_cnt[3]));
  LUT5 #(
    .INIT(32'hAAAAA8AA)) 
    \wait_cnt[4]_i_1 
       (.I0(data0[4]),
        .I1(\wait_cnt[31]_i_2_n_0 ),
        .I2(\wait_cnt[31]_i_3_n_0 ),
        .I3(\wait_cnt[31]_i_4_n_0 ),
        .I4(\wait_cnt[31]_i_5_n_0 ),
        .O(wait_cnt[4]));
  LUT5 #(
    .INIT(32'hAAAAA8AA)) 
    \wait_cnt[5]_i_1 
       (.I0(data0[5]),
        .I1(\wait_cnt[31]_i_2_n_0 ),
        .I2(\wait_cnt[31]_i_3_n_0 ),
        .I3(\wait_cnt[31]_i_4_n_0 ),
        .I4(\wait_cnt[31]_i_5_n_0 ),
        .O(wait_cnt[5]));
  LUT5 #(
    .INIT(32'hAAAAA8AA)) 
    \wait_cnt[6]_i_1 
       (.I0(data0[6]),
        .I1(\wait_cnt[31]_i_2_n_0 ),
        .I2(\wait_cnt[31]_i_3_n_0 ),
        .I3(\wait_cnt[31]_i_4_n_0 ),
        .I4(\wait_cnt[31]_i_5_n_0 ),
        .O(wait_cnt[6]));
  LUT5 #(
    .INIT(32'hAAAAA8AA)) 
    \wait_cnt[7]_i_1 
       (.I0(data0[7]),
        .I1(\wait_cnt[31]_i_2_n_0 ),
        .I2(\wait_cnt[31]_i_3_n_0 ),
        .I3(\wait_cnt[31]_i_4_n_0 ),
        .I4(\wait_cnt[31]_i_5_n_0 ),
        .O(wait_cnt[7]));
  LUT5 #(
    .INIT(32'hAAAAA8AA)) 
    \wait_cnt[8]_i_1 
       (.I0(data0[8]),
        .I1(\wait_cnt[31]_i_2_n_0 ),
        .I2(\wait_cnt[31]_i_3_n_0 ),
        .I3(\wait_cnt[31]_i_4_n_0 ),
        .I4(\wait_cnt[31]_i_5_n_0 ),
        .O(wait_cnt[8]));
  LUT5 #(
    .INIT(32'hAAAAA8AA)) 
    \wait_cnt[9]_i_1 
       (.I0(data0[9]),
        .I1(\wait_cnt[31]_i_2_n_0 ),
        .I2(\wait_cnt[31]_i_3_n_0 ),
        .I3(\wait_cnt[31]_i_4_n_0 ),
        .I4(\wait_cnt[31]_i_5_n_0 ),
        .O(wait_cnt[9]));
  FDRE \wait_cnt_reg[0] 
       (.C(clk),
        .CE(sending_reg_inv_n_0),
        .D(wait_cnt[0]),
        .Q(\wait_cnt_reg_n_0_[0] ),
        .R(p_0_in));
  FDRE \wait_cnt_reg[10] 
       (.C(clk),
        .CE(sending_reg_inv_n_0),
        .D(wait_cnt[10]),
        .Q(\wait_cnt_reg_n_0_[10] ),
        .R(p_0_in));
  FDRE \wait_cnt_reg[11] 
       (.C(clk),
        .CE(sending_reg_inv_n_0),
        .D(wait_cnt[11]),
        .Q(\wait_cnt_reg_n_0_[11] ),
        .R(p_0_in));
  FDRE \wait_cnt_reg[12] 
       (.C(clk),
        .CE(sending_reg_inv_n_0),
        .D(wait_cnt[12]),
        .Q(\wait_cnt_reg_n_0_[12] ),
        .R(p_0_in));
  FDRE \wait_cnt_reg[13] 
       (.C(clk),
        .CE(sending_reg_inv_n_0),
        .D(wait_cnt[13]),
        .Q(\wait_cnt_reg_n_0_[13] ),
        .R(p_0_in));
  FDRE \wait_cnt_reg[14] 
       (.C(clk),
        .CE(sending_reg_inv_n_0),
        .D(wait_cnt[14]),
        .Q(\wait_cnt_reg_n_0_[14] ),
        .R(p_0_in));
  FDRE \wait_cnt_reg[15] 
       (.C(clk),
        .CE(sending_reg_inv_n_0),
        .D(wait_cnt[15]),
        .Q(\wait_cnt_reg_n_0_[15] ),
        .R(p_0_in));
  FDRE \wait_cnt_reg[16] 
       (.C(clk),
        .CE(sending_reg_inv_n_0),
        .D(wait_cnt[16]),
        .Q(\wait_cnt_reg_n_0_[16] ),
        .R(p_0_in));
  FDRE \wait_cnt_reg[17] 
       (.C(clk),
        .CE(sending_reg_inv_n_0),
        .D(wait_cnt[17]),
        .Q(\wait_cnt_reg_n_0_[17] ),
        .R(p_0_in));
  FDRE \wait_cnt_reg[18] 
       (.C(clk),
        .CE(sending_reg_inv_n_0),
        .D(wait_cnt[18]),
        .Q(\wait_cnt_reg_n_0_[18] ),
        .R(p_0_in));
  FDRE \wait_cnt_reg[19] 
       (.C(clk),
        .CE(sending_reg_inv_n_0),
        .D(wait_cnt[19]),
        .Q(\wait_cnt_reg_n_0_[19] ),
        .R(p_0_in));
  FDRE \wait_cnt_reg[1] 
       (.C(clk),
        .CE(sending_reg_inv_n_0),
        .D(wait_cnt[1]),
        .Q(\wait_cnt_reg_n_0_[1] ),
        .R(p_0_in));
  FDRE \wait_cnt_reg[20] 
       (.C(clk),
        .CE(sending_reg_inv_n_0),
        .D(wait_cnt[20]),
        .Q(\wait_cnt_reg_n_0_[20] ),
        .R(p_0_in));
  FDRE \wait_cnt_reg[21] 
       (.C(clk),
        .CE(sending_reg_inv_n_0),
        .D(wait_cnt[21]),
        .Q(\wait_cnt_reg_n_0_[21] ),
        .R(p_0_in));
  FDRE \wait_cnt_reg[22] 
       (.C(clk),
        .CE(sending_reg_inv_n_0),
        .D(wait_cnt[22]),
        .Q(\wait_cnt_reg_n_0_[22] ),
        .R(p_0_in));
  FDRE \wait_cnt_reg[23] 
       (.C(clk),
        .CE(sending_reg_inv_n_0),
        .D(wait_cnt[23]),
        .Q(\wait_cnt_reg_n_0_[23] ),
        .R(p_0_in));
  FDRE \wait_cnt_reg[24] 
       (.C(clk),
        .CE(sending_reg_inv_n_0),
        .D(wait_cnt[24]),
        .Q(\wait_cnt_reg_n_0_[24] ),
        .R(p_0_in));
  FDRE \wait_cnt_reg[25] 
       (.C(clk),
        .CE(sending_reg_inv_n_0),
        .D(wait_cnt[25]),
        .Q(\wait_cnt_reg_n_0_[25] ),
        .R(p_0_in));
  FDRE \wait_cnt_reg[26] 
       (.C(clk),
        .CE(sending_reg_inv_n_0),
        .D(wait_cnt[26]),
        .Q(\wait_cnt_reg_n_0_[26] ),
        .R(p_0_in));
  FDRE \wait_cnt_reg[27] 
       (.C(clk),
        .CE(sending_reg_inv_n_0),
        .D(wait_cnt[27]),
        .Q(\wait_cnt_reg_n_0_[27] ),
        .R(p_0_in));
  FDRE \wait_cnt_reg[28] 
       (.C(clk),
        .CE(sending_reg_inv_n_0),
        .D(wait_cnt[28]),
        .Q(\wait_cnt_reg_n_0_[28] ),
        .R(p_0_in));
  FDRE \wait_cnt_reg[29] 
       (.C(clk),
        .CE(sending_reg_inv_n_0),
        .D(wait_cnt[29]),
        .Q(\wait_cnt_reg_n_0_[29] ),
        .R(p_0_in));
  FDRE \wait_cnt_reg[2] 
       (.C(clk),
        .CE(sending_reg_inv_n_0),
        .D(wait_cnt[2]),
        .Q(\wait_cnt_reg_n_0_[2] ),
        .R(p_0_in));
  FDRE \wait_cnt_reg[30] 
       (.C(clk),
        .CE(sending_reg_inv_n_0),
        .D(wait_cnt[30]),
        .Q(\wait_cnt_reg_n_0_[30] ),
        .R(p_0_in));
  FDRE \wait_cnt_reg[31] 
       (.C(clk),
        .CE(sending_reg_inv_n_0),
        .D(wait_cnt[31]),
        .Q(\wait_cnt_reg_n_0_[31] ),
        .R(p_0_in));
  FDRE \wait_cnt_reg[3] 
       (.C(clk),
        .CE(sending_reg_inv_n_0),
        .D(wait_cnt[3]),
        .Q(\wait_cnt_reg_n_0_[3] ),
        .R(p_0_in));
  FDRE \wait_cnt_reg[4] 
       (.C(clk),
        .CE(sending_reg_inv_n_0),
        .D(wait_cnt[4]),
        .Q(\wait_cnt_reg_n_0_[4] ),
        .R(p_0_in));
  FDRE \wait_cnt_reg[5] 
       (.C(clk),
        .CE(sending_reg_inv_n_0),
        .D(wait_cnt[5]),
        .Q(\wait_cnt_reg_n_0_[5] ),
        .R(p_0_in));
  FDRE \wait_cnt_reg[6] 
       (.C(clk),
        .CE(sending_reg_inv_n_0),
        .D(wait_cnt[6]),
        .Q(\wait_cnt_reg_n_0_[6] ),
        .R(p_0_in));
  FDRE \wait_cnt_reg[7] 
       (.C(clk),
        .CE(sending_reg_inv_n_0),
        .D(wait_cnt[7]),
        .Q(\wait_cnt_reg_n_0_[7] ),
        .R(p_0_in));
  FDRE \wait_cnt_reg[8] 
       (.C(clk),
        .CE(sending_reg_inv_n_0),
        .D(wait_cnt[8]),
        .Q(\wait_cnt_reg_n_0_[8] ),
        .R(p_0_in));
  FDRE \wait_cnt_reg[9] 
       (.C(clk),
        .CE(sending_reg_inv_n_0),
        .D(wait_cnt[9]),
        .Q(\wait_cnt_reg_n_0_[9] ),
        .R(p_0_in));
endmodule

(* ORIG_REF_NAME = "uart_tx" *) 
module system_hello_pl_0_0_uart_tx
   (SR,
    busy_reg_0,
    sending_reg_inv,
    tx,
    clk,
    tx_reg_0,
    resetn,
    start_reg,
    E,
    Q,
    sending_reg_inv_0,
    sending_reg_inv_1,
    sending_reg_inv_2,
    sending_reg_inv_3);
  output [0:0]SR;
  output busy_reg_0;
  output sending_reg_inv;
  output tx;
  input clk;
  input tx_reg_0;
  input resetn;
  input start_reg;
  input [0:0]E;
  input [4:0]Q;
  input sending_reg_inv_0;
  input sending_reg_inv_1;
  input sending_reg_inv_2;
  input sending_reg_inv_3;

  wire [0:0]E;
  wire [4:0]Q;
  wire [0:0]SR;
  wire \bit_idx[0]_i_1_n_0 ;
  wire \bit_idx[1]_i_1_n_0 ;
  wire \bit_idx[2]_i_1_n_0 ;
  wire \bit_idx[3]_i_2_n_0 ;
  wire \bit_idx[3]_i_3_n_0 ;
  wire \bit_idx[3]_i_4_n_0 ;
  wire \bit_idx[3]_i_5_n_0 ;
  wire \bit_idx[3]_i_6_n_0 ;
  wire \bit_idx[3]_i_7_n_0 ;
  wire [3:0]bit_idx_reg;
  wire busy;
  wire busy_i_1_n_0;
  wire busy_reg_0;
  wire clk;
  wire \clk_cnt[12]_i_2_n_0 ;
  wire \clk_cnt[15]_i_1_n_0 ;
  wire \clk_cnt[15]_i_3_n_0 ;
  wire \clk_cnt[15]_i_4_n_0 ;
  wire \clk_cnt[2]_i_2_n_0 ;
  wire \clk_cnt[5]_i_2_n_0 ;
  wire \clk_cnt[8]_i_2_n_0 ;
  wire \clk_cnt[9]_i_2_n_0 ;
  wire \clk_cnt[9]_i_3_n_0 ;
  wire \clk_cnt[9]_i_4_n_0 ;
  wire \clk_cnt[9]_i_5_n_0 ;
  wire [15:0]clk_cnt_reg;
  wire [6:0]cur_char;
  wire [15:0]p_0_in;
  wire resetn;
  wire sending_inv_i_2_n_0;
  wire sending_reg_inv;
  wire sending_reg_inv_0;
  wire sending_reg_inv_1;
  wire sending_reg_inv_2;
  wire sending_reg_inv_3;
  wire \shifter[7]_i_1_n_0 ;
  wire \shifter_reg_n_0_[1] ;
  wire \shifter_reg_n_0_[2] ;
  wire \shifter_reg_n_0_[3] ;
  wire \shifter_reg_n_0_[4] ;
  wire \shifter_reg_n_0_[5] ;
  wire \shifter_reg_n_0_[6] ;
  wire \shifter_reg_n_0_[7] ;
  wire start_reg;
  wire tx;
  wire tx0_out;
  wire tx_i_2_n_0;
  wire tx_i_3_n_0;
  wire tx_i_4_n_0;
  wire tx_i_5_n_0;
  wire tx_reg_0;

  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \bit_idx[0]_i_1 
       (.I0(bit_idx_reg[0]),
        .O(\bit_idx[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \bit_idx[1]_i_1 
       (.I0(bit_idx_reg[0]),
        .I1(bit_idx_reg[1]),
        .O(\bit_idx[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \bit_idx[2]_i_1 
       (.I0(bit_idx_reg[2]),
        .I1(bit_idx_reg[1]),
        .I2(bit_idx_reg[0]),
        .O(\bit_idx[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000004)) 
    \bit_idx[3]_i_1 
       (.I0(\bit_idx[3]_i_3_n_0 ),
        .I1(busy),
        .I2(\bit_idx[3]_i_4_n_0 ),
        .I3(\bit_idx[3]_i_5_n_0 ),
        .I4(\bit_idx[3]_i_6_n_0 ),
        .I5(\bit_idx[3]_i_7_n_0 ),
        .O(tx0_out));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \bit_idx[3]_i_2 
       (.I0(bit_idx_reg[3]),
        .I1(bit_idx_reg[0]),
        .I2(bit_idx_reg[1]),
        .I3(bit_idx_reg[2]),
        .O(\bit_idx[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h0040)) 
    \bit_idx[3]_i_3 
       (.I0(bit_idx_reg[1]),
        .I1(bit_idx_reg[0]),
        .I2(bit_idx_reg[3]),
        .I3(bit_idx_reg[2]),
        .O(\bit_idx[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hFF7F)) 
    \bit_idx[3]_i_4 
       (.I0(clk_cnt_reg[1]),
        .I1(clk_cnt_reg[0]),
        .I2(clk_cnt_reg[8]),
        .I3(clk_cnt_reg[3]),
        .O(\bit_idx[3]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFFD)) 
    \bit_idx[3]_i_5 
       (.I0(clk_cnt_reg[6]),
        .I1(clk_cnt_reg[15]),
        .I2(clk_cnt_reg[14]),
        .I3(clk_cnt_reg[4]),
        .O(\bit_idx[3]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFD)) 
    \bit_idx[3]_i_6 
       (.I0(clk_cnt_reg[9]),
        .I1(clk_cnt_reg[7]),
        .I2(clk_cnt_reg[13]),
        .I3(clk_cnt_reg[10]),
        .O(\bit_idx[3]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFD)) 
    \bit_idx[3]_i_7 
       (.I0(clk_cnt_reg[5]),
        .I1(clk_cnt_reg[12]),
        .I2(clk_cnt_reg[11]),
        .I3(clk_cnt_reg[2]),
        .O(\bit_idx[3]_i_7_n_0 ));
  FDRE \bit_idx_reg[0] 
       (.C(clk),
        .CE(tx0_out),
        .D(\bit_idx[0]_i_1_n_0 ),
        .Q(bit_idx_reg[0]),
        .R(\clk_cnt[15]_i_1_n_0 ));
  FDRE \bit_idx_reg[1] 
       (.C(clk),
        .CE(tx0_out),
        .D(\bit_idx[1]_i_1_n_0 ),
        .Q(bit_idx_reg[1]),
        .R(\clk_cnt[15]_i_1_n_0 ));
  FDRE \bit_idx_reg[2] 
       (.C(clk),
        .CE(tx0_out),
        .D(\bit_idx[2]_i_1_n_0 ),
        .Q(bit_idx_reg[2]),
        .R(\clk_cnt[15]_i_1_n_0 ));
  FDRE \bit_idx_reg[3] 
       (.C(clk),
        .CE(tx0_out),
        .D(\bit_idx[3]_i_2_n_0 ),
        .Q(bit_idx_reg[3]),
        .R(\clk_cnt[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hCAFA)) 
    busy_i_1
       (.I0(tx_reg_0),
        .I1(\clk_cnt[2]_i_2_n_0 ),
        .I2(busy),
        .I3(\bit_idx[3]_i_3_n_0 ),
        .O(busy_i_1_n_0));
  FDRE busy_reg
       (.C(clk),
        .CE(1'b1),
        .D(busy_i_1_n_0),
        .Q(busy),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \clk_cnt[0]_i_1 
       (.I0(clk_cnt_reg[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hDF20)) 
    \clk_cnt[10]_i_1 
       (.I0(clk_cnt_reg[8]),
        .I1(\clk_cnt[12]_i_2_n_0 ),
        .I2(clk_cnt_reg[9]),
        .I3(clk_cnt_reg[10]),
        .O(p_0_in[10]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hA6AAAAAA)) 
    \clk_cnt[11]_i_1 
       (.I0(clk_cnt_reg[11]),
        .I1(clk_cnt_reg[8]),
        .I2(\clk_cnt[12]_i_2_n_0 ),
        .I3(clk_cnt_reg[9]),
        .I4(clk_cnt_reg[10]),
        .O(p_0_in[11]));
  LUT6 #(
    .INIT(64'hAA6AAAAAAAAAAAAA)) 
    \clk_cnt[12]_i_1 
       (.I0(clk_cnt_reg[12]),
        .I1(clk_cnt_reg[10]),
        .I2(clk_cnt_reg[9]),
        .I3(\clk_cnt[12]_i_2_n_0 ),
        .I4(clk_cnt_reg[8]),
        .I5(clk_cnt_reg[11]),
        .O(p_0_in[12]));
  LUT4 #(
    .INIT(16'hDFFF)) 
    \clk_cnt[12]_i_2 
       (.I0(clk_cnt_reg[6]),
        .I1(\clk_cnt[8]_i_2_n_0 ),
        .I2(clk_cnt_reg[5]),
        .I3(clk_cnt_reg[7]),
        .O(\clk_cnt[12]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \clk_cnt[13]_i_1 
       (.I0(clk_cnt_reg[13]),
        .I1(clk_cnt_reg[11]),
        .I2(\clk_cnt[15]_i_3_n_0 ),
        .I3(clk_cnt_reg[12]),
        .O(p_0_in[13]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \clk_cnt[14]_i_1 
       (.I0(clk_cnt_reg[14]),
        .I1(clk_cnt_reg[12]),
        .I2(\clk_cnt[15]_i_3_n_0 ),
        .I3(clk_cnt_reg[11]),
        .I4(clk_cnt_reg[13]),
        .O(p_0_in[14]));
  LUT3 #(
    .INIT(8'h4F)) 
    \clk_cnt[15]_i_1 
       (.I0(busy),
        .I1(tx_reg_0),
        .I2(resetn),
        .O(\clk_cnt[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \clk_cnt[15]_i_2 
       (.I0(clk_cnt_reg[15]),
        .I1(clk_cnt_reg[13]),
        .I2(clk_cnt_reg[11]),
        .I3(\clk_cnt[15]_i_3_n_0 ),
        .I4(clk_cnt_reg[12]),
        .I5(clk_cnt_reg[14]),
        .O(p_0_in[15]));
  LUT6 #(
    .INIT(64'h0080000000000000)) 
    \clk_cnt[15]_i_3 
       (.I0(clk_cnt_reg[10]),
        .I1(clk_cnt_reg[9]),
        .I2(clk_cnt_reg[7]),
        .I3(\clk_cnt[15]_i_4_n_0 ),
        .I4(clk_cnt_reg[6]),
        .I5(clk_cnt_reg[8]),
        .O(\clk_cnt[15]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \clk_cnt[15]_i_4 
       (.I0(clk_cnt_reg[4]),
        .I1(clk_cnt_reg[2]),
        .I2(clk_cnt_reg[0]),
        .I3(clk_cnt_reg[1]),
        .I4(clk_cnt_reg[3]),
        .I5(clk_cnt_reg[5]),
        .O(\clk_cnt[15]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \clk_cnt[1]_i_1 
       (.I0(clk_cnt_reg[0]),
        .I1(clk_cnt_reg[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h2A80)) 
    \clk_cnt[2]_i_1 
       (.I0(\clk_cnt[2]_i_2_n_0 ),
        .I1(clk_cnt_reg[0]),
        .I2(clk_cnt_reg[1]),
        .I3(clk_cnt_reg[2]),
        .O(p_0_in[2]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFB)) 
    \clk_cnt[2]_i_2 
       (.I0(\clk_cnt[5]_i_2_n_0 ),
        .I1(clk_cnt_reg[8]),
        .I2(clk_cnt_reg[3]),
        .I3(\bit_idx[3]_i_5_n_0 ),
        .I4(\bit_idx[3]_i_6_n_0 ),
        .I5(\bit_idx[3]_i_7_n_0 ),
        .O(\clk_cnt[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \clk_cnt[3]_i_1 
       (.I0(clk_cnt_reg[3]),
        .I1(clk_cnt_reg[1]),
        .I2(clk_cnt_reg[0]),
        .I3(clk_cnt_reg[2]),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \clk_cnt[4]_i_1 
       (.I0(clk_cnt_reg[4]),
        .I1(clk_cnt_reg[2]),
        .I2(clk_cnt_reg[0]),
        .I3(clk_cnt_reg[1]),
        .I4(clk_cnt_reg[3]),
        .O(p_0_in[4]));
  LUT6 #(
    .INIT(64'hA2AAAAAA08000000)) 
    \clk_cnt[5]_i_1 
       (.I0(\clk_cnt[9]_i_2_n_0 ),
        .I1(clk_cnt_reg[3]),
        .I2(\clk_cnt[5]_i_2_n_0 ),
        .I3(clk_cnt_reg[2]),
        .I4(clk_cnt_reg[4]),
        .I5(clk_cnt_reg[5]),
        .O(p_0_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \clk_cnt[5]_i_2 
       (.I0(clk_cnt_reg[0]),
        .I1(clk_cnt_reg[1]),
        .O(\clk_cnt[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h8A20)) 
    \clk_cnt[6]_i_1 
       (.I0(\clk_cnt[9]_i_2_n_0 ),
        .I1(\clk_cnt[8]_i_2_n_0 ),
        .I2(clk_cnt_reg[5]),
        .I3(clk_cnt_reg[6]),
        .O(p_0_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hA6AA)) 
    \clk_cnt[7]_i_1 
       (.I0(clk_cnt_reg[7]),
        .I1(clk_cnt_reg[5]),
        .I2(\clk_cnt[8]_i_2_n_0 ),
        .I3(clk_cnt_reg[6]),
        .O(p_0_in[7]));
  LUT6 #(
    .INIT(64'hA2AAAAAA08000000)) 
    \clk_cnt[8]_i_1 
       (.I0(\clk_cnt[9]_i_2_n_0 ),
        .I1(clk_cnt_reg[6]),
        .I2(\clk_cnt[8]_i_2_n_0 ),
        .I3(clk_cnt_reg[5]),
        .I4(clk_cnt_reg[7]),
        .I5(clk_cnt_reg[8]),
        .O(p_0_in[8]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \clk_cnt[8]_i_2 
       (.I0(clk_cnt_reg[3]),
        .I1(clk_cnt_reg[1]),
        .I2(clk_cnt_reg[0]),
        .I3(clk_cnt_reg[2]),
        .I4(clk_cnt_reg[4]),
        .O(\clk_cnt[8]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h8A20)) 
    \clk_cnt[9]_i_1 
       (.I0(\clk_cnt[9]_i_2_n_0 ),
        .I1(\clk_cnt[12]_i_2_n_0 ),
        .I2(clk_cnt_reg[8]),
        .I3(clk_cnt_reg[9]),
        .O(p_0_in[9]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFBF)) 
    \clk_cnt[9]_i_2 
       (.I0(\clk_cnt[5]_i_2_n_0 ),
        .I1(clk_cnt_reg[6]),
        .I2(clk_cnt_reg[5]),
        .I3(\clk_cnt[9]_i_3_n_0 ),
        .I4(\clk_cnt[9]_i_4_n_0 ),
        .I5(\clk_cnt[9]_i_5_n_0 ),
        .O(\clk_cnt[9]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hEFFF)) 
    \clk_cnt[9]_i_3 
       (.I0(clk_cnt_reg[3]),
        .I1(clk_cnt_reg[2]),
        .I2(clk_cnt_reg[9]),
        .I3(clk_cnt_reg[8]),
        .O(\clk_cnt[9]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \clk_cnt[9]_i_4 
       (.I0(clk_cnt_reg[15]),
        .I1(clk_cnt_reg[14]),
        .I2(clk_cnt_reg[13]),
        .I3(clk_cnt_reg[12]),
        .O(\clk_cnt[9]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \clk_cnt[9]_i_5 
       (.I0(clk_cnt_reg[11]),
        .I1(clk_cnt_reg[10]),
        .I2(clk_cnt_reg[7]),
        .I3(clk_cnt_reg[4]),
        .O(\clk_cnt[9]_i_5_n_0 ));
  FDRE \clk_cnt_reg[0] 
       (.C(clk),
        .CE(busy),
        .D(p_0_in[0]),
        .Q(clk_cnt_reg[0]),
        .R(\clk_cnt[15]_i_1_n_0 ));
  FDRE \clk_cnt_reg[10] 
       (.C(clk),
        .CE(busy),
        .D(p_0_in[10]),
        .Q(clk_cnt_reg[10]),
        .R(\clk_cnt[15]_i_1_n_0 ));
  FDRE \clk_cnt_reg[11] 
       (.C(clk),
        .CE(busy),
        .D(p_0_in[11]),
        .Q(clk_cnt_reg[11]),
        .R(\clk_cnt[15]_i_1_n_0 ));
  FDRE \clk_cnt_reg[12] 
       (.C(clk),
        .CE(busy),
        .D(p_0_in[12]),
        .Q(clk_cnt_reg[12]),
        .R(\clk_cnt[15]_i_1_n_0 ));
  FDRE \clk_cnt_reg[13] 
       (.C(clk),
        .CE(busy),
        .D(p_0_in[13]),
        .Q(clk_cnt_reg[13]),
        .R(\clk_cnt[15]_i_1_n_0 ));
  FDRE \clk_cnt_reg[14] 
       (.C(clk),
        .CE(busy),
        .D(p_0_in[14]),
        .Q(clk_cnt_reg[14]),
        .R(\clk_cnt[15]_i_1_n_0 ));
  FDRE \clk_cnt_reg[15] 
       (.C(clk),
        .CE(busy),
        .D(p_0_in[15]),
        .Q(clk_cnt_reg[15]),
        .R(\clk_cnt[15]_i_1_n_0 ));
  FDRE \clk_cnt_reg[1] 
       (.C(clk),
        .CE(busy),
        .D(p_0_in[1]),
        .Q(clk_cnt_reg[1]),
        .R(\clk_cnt[15]_i_1_n_0 ));
  FDRE \clk_cnt_reg[2] 
       (.C(clk),
        .CE(busy),
        .D(p_0_in[2]),
        .Q(clk_cnt_reg[2]),
        .R(\clk_cnt[15]_i_1_n_0 ));
  FDRE \clk_cnt_reg[3] 
       (.C(clk),
        .CE(busy),
        .D(p_0_in[3]),
        .Q(clk_cnt_reg[3]),
        .R(\clk_cnt[15]_i_1_n_0 ));
  FDRE \clk_cnt_reg[4] 
       (.C(clk),
        .CE(busy),
        .D(p_0_in[4]),
        .Q(clk_cnt_reg[4]),
        .R(\clk_cnt[15]_i_1_n_0 ));
  FDRE \clk_cnt_reg[5] 
       (.C(clk),
        .CE(busy),
        .D(p_0_in[5]),
        .Q(clk_cnt_reg[5]),
        .R(\clk_cnt[15]_i_1_n_0 ));
  FDRE \clk_cnt_reg[6] 
       (.C(clk),
        .CE(busy),
        .D(p_0_in[6]),
        .Q(clk_cnt_reg[6]),
        .R(\clk_cnt[15]_i_1_n_0 ));
  FDRE \clk_cnt_reg[7] 
       (.C(clk),
        .CE(busy),
        .D(p_0_in[7]),
        .Q(clk_cnt_reg[7]),
        .R(\clk_cnt[15]_i_1_n_0 ));
  FDRE \clk_cnt_reg[8] 
       (.C(clk),
        .CE(busy),
        .D(p_0_in[8]),
        .Q(clk_cnt_reg[8]),
        .R(\clk_cnt[15]_i_1_n_0 ));
  FDRE \clk_cnt_reg[9] 
       (.C(clk),
        .CE(busy),
        .D(p_0_in[9]),
        .Q(clk_cnt_reg[9]),
        .R(\clk_cnt[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000FFEFFFFF0000)) 
    sending_inv_i_1
       (.I0(sending_reg_inv_0),
        .I1(sending_reg_inv_1),
        .I2(sending_reg_inv_2),
        .I3(sending_reg_inv_3),
        .I4(sending_inv_i_2_n_0),
        .I5(E),
        .O(sending_reg_inv));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h0002)) 
    sending_inv_i_2
       (.I0(start_reg),
        .I1(E),
        .I2(tx_reg_0),
        .I3(busy),
        .O(sending_inv_i_2_n_0));
  LUT5 #(
    .INIT(32'h9CC4F012)) 
    \shifter[1]_i_1 
       (.I0(Q[0]),
        .I1(Q[3]),
        .I2(Q[2]),
        .I3(Q[1]),
        .I4(Q[4]),
        .O(cur_char[0]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h5BC03910)) 
    \shifter[2]_i_1 
       (.I0(Q[0]),
        .I1(Q[4]),
        .I2(Q[3]),
        .I3(Q[2]),
        .I4(Q[1]),
        .O(cur_char[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hAE64D6DE)) 
    \shifter[3]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(Q[3]),
        .I4(Q[4]),
        .O(cur_char[2]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hFC19724D)) 
    \shifter[4]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[4]),
        .I3(Q[3]),
        .I4(Q[2]),
        .O(cur_char[3]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h04019808)) 
    \shifter[5]_i_1 
       (.I0(Q[4]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[2]),
        .I4(Q[3]),
        .O(cur_char[4]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h9FFFD9BE)) 
    \shifter[6]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(Q[4]),
        .I4(Q[3]),
        .O(cur_char[5]));
  LUT3 #(
    .INIT(8'h40)) 
    \shifter[7]_i_1 
       (.I0(busy),
        .I1(tx_reg_0),
        .I2(resetn),
        .O(\shifter[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h8FE6F7DF)) 
    \shifter[7]_i_2 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(Q[3]),
        .I4(Q[4]),
        .O(cur_char[6]));
  FDRE \shifter_reg[1] 
       (.C(clk),
        .CE(\shifter[7]_i_1_n_0 ),
        .D(cur_char[0]),
        .Q(\shifter_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \shifter_reg[2] 
       (.C(clk),
        .CE(\shifter[7]_i_1_n_0 ),
        .D(cur_char[1]),
        .Q(\shifter_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \shifter_reg[3] 
       (.C(clk),
        .CE(\shifter[7]_i_1_n_0 ),
        .D(cur_char[2]),
        .Q(\shifter_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \shifter_reg[4] 
       (.C(clk),
        .CE(\shifter[7]_i_1_n_0 ),
        .D(cur_char[3]),
        .Q(\shifter_reg_n_0_[4] ),
        .R(1'b0));
  FDRE \shifter_reg[5] 
       (.C(clk),
        .CE(\shifter[7]_i_1_n_0 ),
        .D(cur_char[4]),
        .Q(\shifter_reg_n_0_[5] ),
        .R(1'b0));
  FDRE \shifter_reg[6] 
       (.C(clk),
        .CE(\shifter[7]_i_1_n_0 ),
        .D(cur_char[5]),
        .Q(\shifter_reg_n_0_[6] ),
        .R(1'b0));
  FDRE \shifter_reg[7] 
       (.C(clk),
        .CE(\shifter[7]_i_1_n_0 ),
        .D(cur_char[6]),
        .Q(\shifter_reg_n_0_[7] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h00000100)) 
    start_i_1
       (.I0(busy),
        .I1(tx_reg_0),
        .I2(E),
        .I3(resetn),
        .I4(start_reg),
        .O(busy_reg_0));
  LUT1 #(
    .INIT(2'h1)) 
    tx_i_1
       (.I0(resetn),
        .O(SR));
  LUT5 #(
    .INIT(32'hB0BB8088)) 
    tx_i_2
       (.I0(tx_i_3_n_0),
        .I1(tx0_out),
        .I2(busy),
        .I3(tx_reg_0),
        .I4(tx),
        .O(tx_i_2_n_0));
  LUT6 #(
    .INIT(64'hB777A23737622222)) 
    tx_i_3
       (.I0(bit_idx_reg[3]),
        .I1(bit_idx_reg[0]),
        .I2(bit_idx_reg[1]),
        .I3(bit_idx_reg[2]),
        .I4(tx_i_4_n_0),
        .I5(tx_i_5_n_0),
        .O(tx_i_3_n_0));
  LUT6 #(
    .INIT(64'hFCAF0CAFFCA00CA0)) 
    tx_i_4
       (.I0(\shifter_reg_n_0_[6] ),
        .I1(\shifter_reg_n_0_[7] ),
        .I2(bit_idx_reg[0]),
        .I3(bit_idx_reg[1]),
        .I4(\shifter_reg_n_0_[4] ),
        .I5(\shifter_reg_n_0_[5] ),
        .O(tx_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h0CAF0CA0)) 
    tx_i_5
       (.I0(\shifter_reg_n_0_[2] ),
        .I1(\shifter_reg_n_0_[3] ),
        .I2(bit_idx_reg[0]),
        .I3(bit_idx_reg[1]),
        .I4(\shifter_reg_n_0_[1] ),
        .O(tx_i_5_n_0));
  FDSE tx_reg
       (.C(clk),
        .CE(1'b1),
        .D(tx_i_2_n_0),
        .Q(tx),
        .S(SR));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
