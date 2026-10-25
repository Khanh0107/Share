//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2026.1 (lin64) Build 6511674 Tue Jun 16 11:01:26 MDT 2026
//Date        : Sun Oct 25 21:34:24 2026
//Host        : bo running 64-bit Ubuntu 22.04.5 LTS
//Command     : generate_target system_wrapper.bd
//Design      : system_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module system_wrapper
   (uartlite_rx,
    uartlite_tx);
  input uartlite_rx;
  output uartlite_tx;

  wire uartlite_rx;
  wire uartlite_tx;

  system system_i
       (.uartlite_rx(uartlite_rx),
        .uartlite_tx(uartlite_tx));
endmodule
