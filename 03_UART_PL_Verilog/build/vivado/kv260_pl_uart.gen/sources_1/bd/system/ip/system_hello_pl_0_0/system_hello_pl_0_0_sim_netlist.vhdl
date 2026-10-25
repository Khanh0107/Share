-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2026.1 (lin64) Build 6511674 Tue Jun 16 11:01:26 MDT 2026
-- Date        : Sun Oct 25 21:04:52 2026
-- Host        : bo running 64-bit Ubuntu 22.04.5 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/bo/linux/KV260/03_PL_send_Uart_Verilog/build/vivado/kv260_pl_uart.gen/sources_1/bd/system/ip/system_hello_pl_0_0/system_hello_pl_0_0_sim_netlist.vhdl
-- Design      : system_hello_pl_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xck26-sfvc784-2LV-c
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_hello_pl_0_0_uart_tx is
  port (
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    busy_reg_0 : out STD_LOGIC;
    sending_reg_inv : out STD_LOGIC;
    tx : out STD_LOGIC;
    clk : in STD_LOGIC;
    tx_reg_0 : in STD_LOGIC;
    resetn : in STD_LOGIC;
    start_reg : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    Q : in STD_LOGIC_VECTOR ( 4 downto 0 );
    sending_reg_inv_0 : in STD_LOGIC;
    sending_reg_inv_1 : in STD_LOGIC;
    sending_reg_inv_2 : in STD_LOGIC;
    sending_reg_inv_3 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_hello_pl_0_0_uart_tx : entity is "uart_tx";
end system_hello_pl_0_0_uart_tx;

architecture STRUCTURE of system_hello_pl_0_0_uart_tx is
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \bit_idx[0]_i_1_n_0\ : STD_LOGIC;
  signal \bit_idx[1]_i_1_n_0\ : STD_LOGIC;
  signal \bit_idx[2]_i_1_n_0\ : STD_LOGIC;
  signal \bit_idx[3]_i_2_n_0\ : STD_LOGIC;
  signal \bit_idx[3]_i_3_n_0\ : STD_LOGIC;
  signal \bit_idx[3]_i_4_n_0\ : STD_LOGIC;
  signal \bit_idx[3]_i_5_n_0\ : STD_LOGIC;
  signal \bit_idx[3]_i_6_n_0\ : STD_LOGIC;
  signal \bit_idx[3]_i_7_n_0\ : STD_LOGIC;
  signal bit_idx_reg : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal busy : STD_LOGIC;
  signal busy_i_1_n_0 : STD_LOGIC;
  signal \clk_cnt[12]_i_2_n_0\ : STD_LOGIC;
  signal \clk_cnt[15]_i_1_n_0\ : STD_LOGIC;
  signal \clk_cnt[15]_i_3_n_0\ : STD_LOGIC;
  signal \clk_cnt[15]_i_4_n_0\ : STD_LOGIC;
  signal \clk_cnt[2]_i_2_n_0\ : STD_LOGIC;
  signal \clk_cnt[5]_i_2_n_0\ : STD_LOGIC;
  signal \clk_cnt[8]_i_2_n_0\ : STD_LOGIC;
  signal \clk_cnt[9]_i_2_n_0\ : STD_LOGIC;
  signal \clk_cnt[9]_i_3_n_0\ : STD_LOGIC;
  signal \clk_cnt[9]_i_4_n_0\ : STD_LOGIC;
  signal \clk_cnt[9]_i_5_n_0\ : STD_LOGIC;
  signal clk_cnt_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal cur_char : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal p_0_in : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal sending_inv_i_2_n_0 : STD_LOGIC;
  signal \shifter[7]_i_1_n_0\ : STD_LOGIC;
  signal \shifter_reg_n_0_[1]\ : STD_LOGIC;
  signal \shifter_reg_n_0_[2]\ : STD_LOGIC;
  signal \shifter_reg_n_0_[3]\ : STD_LOGIC;
  signal \shifter_reg_n_0_[4]\ : STD_LOGIC;
  signal \shifter_reg_n_0_[5]\ : STD_LOGIC;
  signal \shifter_reg_n_0_[6]\ : STD_LOGIC;
  signal \shifter_reg_n_0_[7]\ : STD_LOGIC;
  signal \^tx\ : STD_LOGIC;
  signal tx0_out : STD_LOGIC;
  signal tx_i_2_n_0 : STD_LOGIC;
  signal tx_i_3_n_0 : STD_LOGIC;
  signal tx_i_4_n_0 : STD_LOGIC;
  signal tx_i_5_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \bit_idx[0]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \bit_idx[1]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \bit_idx[2]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \bit_idx[3]_i_2\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \bit_idx[3]_i_3\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \bit_idx[3]_i_4\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \clk_cnt[0]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \clk_cnt[10]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \clk_cnt[11]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \clk_cnt[13]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \clk_cnt[14]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \clk_cnt[1]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \clk_cnt[2]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \clk_cnt[3]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \clk_cnt[4]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \clk_cnt[5]_i_2\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \clk_cnt[6]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \clk_cnt[7]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \clk_cnt[8]_i_2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of sending_inv_i_2 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \shifter[2]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \shifter[3]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \shifter[4]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \shifter[5]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \shifter[6]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \shifter[7]_i_2\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of start_i_1 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of tx_i_5 : label is "soft_lutpair7";
begin
  SR(0) <= \^sr\(0);
  tx <= \^tx\;
\bit_idx[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => bit_idx_reg(0),
      O => \bit_idx[0]_i_1_n_0\
    );
\bit_idx[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => bit_idx_reg(0),
      I1 => bit_idx_reg(1),
      O => \bit_idx[1]_i_1_n_0\
    );
\bit_idx[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => bit_idx_reg(2),
      I1 => bit_idx_reg(1),
      I2 => bit_idx_reg(0),
      O => \bit_idx[2]_i_1_n_0\
    );
\bit_idx[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000004"
    )
        port map (
      I0 => \bit_idx[3]_i_3_n_0\,
      I1 => busy,
      I2 => \bit_idx[3]_i_4_n_0\,
      I3 => \bit_idx[3]_i_5_n_0\,
      I4 => \bit_idx[3]_i_6_n_0\,
      I5 => \bit_idx[3]_i_7_n_0\,
      O => tx0_out
    );
\bit_idx[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => bit_idx_reg(3),
      I1 => bit_idx_reg(0),
      I2 => bit_idx_reg(1),
      I3 => bit_idx_reg(2),
      O => \bit_idx[3]_i_2_n_0\
    );
\bit_idx[3]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
        port map (
      I0 => bit_idx_reg(1),
      I1 => bit_idx_reg(0),
      I2 => bit_idx_reg(3),
      I3 => bit_idx_reg(2),
      O => \bit_idx[3]_i_3_n_0\
    );
\bit_idx[3]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF7F"
    )
        port map (
      I0 => clk_cnt_reg(1),
      I1 => clk_cnt_reg(0),
      I2 => clk_cnt_reg(8),
      I3 => clk_cnt_reg(3),
      O => \bit_idx[3]_i_4_n_0\
    );
\bit_idx[3]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFD"
    )
        port map (
      I0 => clk_cnt_reg(6),
      I1 => clk_cnt_reg(15),
      I2 => clk_cnt_reg(14),
      I3 => clk_cnt_reg(4),
      O => \bit_idx[3]_i_5_n_0\
    );
\bit_idx[3]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFD"
    )
        port map (
      I0 => clk_cnt_reg(9),
      I1 => clk_cnt_reg(7),
      I2 => clk_cnt_reg(13),
      I3 => clk_cnt_reg(10),
      O => \bit_idx[3]_i_6_n_0\
    );
\bit_idx[3]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFD"
    )
        port map (
      I0 => clk_cnt_reg(5),
      I1 => clk_cnt_reg(12),
      I2 => clk_cnt_reg(11),
      I3 => clk_cnt_reg(2),
      O => \bit_idx[3]_i_7_n_0\
    );
\bit_idx_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => tx0_out,
      D => \bit_idx[0]_i_1_n_0\,
      Q => bit_idx_reg(0),
      R => \clk_cnt[15]_i_1_n_0\
    );
\bit_idx_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => tx0_out,
      D => \bit_idx[1]_i_1_n_0\,
      Q => bit_idx_reg(1),
      R => \clk_cnt[15]_i_1_n_0\
    );
\bit_idx_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => tx0_out,
      D => \bit_idx[2]_i_1_n_0\,
      Q => bit_idx_reg(2),
      R => \clk_cnt[15]_i_1_n_0\
    );
\bit_idx_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => tx0_out,
      D => \bit_idx[3]_i_2_n_0\,
      Q => bit_idx_reg(3),
      R => \clk_cnt[15]_i_1_n_0\
    );
busy_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"CAFA"
    )
        port map (
      I0 => tx_reg_0,
      I1 => \clk_cnt[2]_i_2_n_0\,
      I2 => busy,
      I3 => \bit_idx[3]_i_3_n_0\,
      O => busy_i_1_n_0
    );
busy_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => busy_i_1_n_0,
      Q => busy,
      R => \^sr\(0)
    );
\clk_cnt[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => clk_cnt_reg(0),
      O => p_0_in(0)
    );
\clk_cnt[10]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DF20"
    )
        port map (
      I0 => clk_cnt_reg(8),
      I1 => \clk_cnt[12]_i_2_n_0\,
      I2 => clk_cnt_reg(9),
      I3 => clk_cnt_reg(10),
      O => p_0_in(10)
    );
\clk_cnt[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A6AAAAAA"
    )
        port map (
      I0 => clk_cnt_reg(11),
      I1 => clk_cnt_reg(8),
      I2 => \clk_cnt[12]_i_2_n_0\,
      I3 => clk_cnt_reg(9),
      I4 => clk_cnt_reg(10),
      O => p_0_in(11)
    );
\clk_cnt[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA6AAAAAAAAAAAAA"
    )
        port map (
      I0 => clk_cnt_reg(12),
      I1 => clk_cnt_reg(10),
      I2 => clk_cnt_reg(9),
      I3 => \clk_cnt[12]_i_2_n_0\,
      I4 => clk_cnt_reg(8),
      I5 => clk_cnt_reg(11),
      O => p_0_in(12)
    );
\clk_cnt[12]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DFFF"
    )
        port map (
      I0 => clk_cnt_reg(6),
      I1 => \clk_cnt[8]_i_2_n_0\,
      I2 => clk_cnt_reg(5),
      I3 => clk_cnt_reg(7),
      O => \clk_cnt[12]_i_2_n_0\
    );
\clk_cnt[13]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => clk_cnt_reg(13),
      I1 => clk_cnt_reg(11),
      I2 => \clk_cnt[15]_i_3_n_0\,
      I3 => clk_cnt_reg(12),
      O => p_0_in(13)
    );
\clk_cnt[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => clk_cnt_reg(14),
      I1 => clk_cnt_reg(12),
      I2 => \clk_cnt[15]_i_3_n_0\,
      I3 => clk_cnt_reg(11),
      I4 => clk_cnt_reg(13),
      O => p_0_in(14)
    );
\clk_cnt[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"4F"
    )
        port map (
      I0 => busy,
      I1 => tx_reg_0,
      I2 => resetn,
      O => \clk_cnt[15]_i_1_n_0\
    );
\clk_cnt[15]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => clk_cnt_reg(15),
      I1 => clk_cnt_reg(13),
      I2 => clk_cnt_reg(11),
      I3 => \clk_cnt[15]_i_3_n_0\,
      I4 => clk_cnt_reg(12),
      I5 => clk_cnt_reg(14),
      O => p_0_in(15)
    );
\clk_cnt[15]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080000000000000"
    )
        port map (
      I0 => clk_cnt_reg(10),
      I1 => clk_cnt_reg(9),
      I2 => clk_cnt_reg(7),
      I3 => \clk_cnt[15]_i_4_n_0\,
      I4 => clk_cnt_reg(6),
      I5 => clk_cnt_reg(8),
      O => \clk_cnt[15]_i_3_n_0\
    );
\clk_cnt[15]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => clk_cnt_reg(4),
      I1 => clk_cnt_reg(2),
      I2 => clk_cnt_reg(0),
      I3 => clk_cnt_reg(1),
      I4 => clk_cnt_reg(3),
      I5 => clk_cnt_reg(5),
      O => \clk_cnt[15]_i_4_n_0\
    );
\clk_cnt[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => clk_cnt_reg(0),
      I1 => clk_cnt_reg(1),
      O => p_0_in(1)
    );
\clk_cnt[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2A80"
    )
        port map (
      I0 => \clk_cnt[2]_i_2_n_0\,
      I1 => clk_cnt_reg(0),
      I2 => clk_cnt_reg(1),
      I3 => clk_cnt_reg(2),
      O => p_0_in(2)
    );
\clk_cnt[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFB"
    )
        port map (
      I0 => \clk_cnt[5]_i_2_n_0\,
      I1 => clk_cnt_reg(8),
      I2 => clk_cnt_reg(3),
      I3 => \bit_idx[3]_i_5_n_0\,
      I4 => \bit_idx[3]_i_6_n_0\,
      I5 => \bit_idx[3]_i_7_n_0\,
      O => \clk_cnt[2]_i_2_n_0\
    );
\clk_cnt[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => clk_cnt_reg(3),
      I1 => clk_cnt_reg(1),
      I2 => clk_cnt_reg(0),
      I3 => clk_cnt_reg(2),
      O => p_0_in(3)
    );
\clk_cnt[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => clk_cnt_reg(4),
      I1 => clk_cnt_reg(2),
      I2 => clk_cnt_reg(0),
      I3 => clk_cnt_reg(1),
      I4 => clk_cnt_reg(3),
      O => p_0_in(4)
    );
\clk_cnt[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A2AAAAAA08000000"
    )
        port map (
      I0 => \clk_cnt[9]_i_2_n_0\,
      I1 => clk_cnt_reg(3),
      I2 => \clk_cnt[5]_i_2_n_0\,
      I3 => clk_cnt_reg(2),
      I4 => clk_cnt_reg(4),
      I5 => clk_cnt_reg(5),
      O => p_0_in(5)
    );
\clk_cnt[5]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => clk_cnt_reg(0),
      I1 => clk_cnt_reg(1),
      O => \clk_cnt[5]_i_2_n_0\
    );
\clk_cnt[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8A20"
    )
        port map (
      I0 => \clk_cnt[9]_i_2_n_0\,
      I1 => \clk_cnt[8]_i_2_n_0\,
      I2 => clk_cnt_reg(5),
      I3 => clk_cnt_reg(6),
      O => p_0_in(6)
    );
\clk_cnt[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A6AA"
    )
        port map (
      I0 => clk_cnt_reg(7),
      I1 => clk_cnt_reg(5),
      I2 => \clk_cnt[8]_i_2_n_0\,
      I3 => clk_cnt_reg(6),
      O => p_0_in(7)
    );
\clk_cnt[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A2AAAAAA08000000"
    )
        port map (
      I0 => \clk_cnt[9]_i_2_n_0\,
      I1 => clk_cnt_reg(6),
      I2 => \clk_cnt[8]_i_2_n_0\,
      I3 => clk_cnt_reg(5),
      I4 => clk_cnt_reg(7),
      I5 => clk_cnt_reg(8),
      O => p_0_in(8)
    );
\clk_cnt[8]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => clk_cnt_reg(3),
      I1 => clk_cnt_reg(1),
      I2 => clk_cnt_reg(0),
      I3 => clk_cnt_reg(2),
      I4 => clk_cnt_reg(4),
      O => \clk_cnt[8]_i_2_n_0\
    );
\clk_cnt[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8A20"
    )
        port map (
      I0 => \clk_cnt[9]_i_2_n_0\,
      I1 => \clk_cnt[12]_i_2_n_0\,
      I2 => clk_cnt_reg(8),
      I3 => clk_cnt_reg(9),
      O => p_0_in(9)
    );
\clk_cnt[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFBF"
    )
        port map (
      I0 => \clk_cnt[5]_i_2_n_0\,
      I1 => clk_cnt_reg(6),
      I2 => clk_cnt_reg(5),
      I3 => \clk_cnt[9]_i_3_n_0\,
      I4 => \clk_cnt[9]_i_4_n_0\,
      I5 => \clk_cnt[9]_i_5_n_0\,
      O => \clk_cnt[9]_i_2_n_0\
    );
\clk_cnt[9]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EFFF"
    )
        port map (
      I0 => clk_cnt_reg(3),
      I1 => clk_cnt_reg(2),
      I2 => clk_cnt_reg(9),
      I3 => clk_cnt_reg(8),
      O => \clk_cnt[9]_i_3_n_0\
    );
\clk_cnt[9]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => clk_cnt_reg(15),
      I1 => clk_cnt_reg(14),
      I2 => clk_cnt_reg(13),
      I3 => clk_cnt_reg(12),
      O => \clk_cnt[9]_i_4_n_0\
    );
\clk_cnt[9]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => clk_cnt_reg(11),
      I1 => clk_cnt_reg(10),
      I2 => clk_cnt_reg(7),
      I3 => clk_cnt_reg(4),
      O => \clk_cnt[9]_i_5_n_0\
    );
\clk_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => busy,
      D => p_0_in(0),
      Q => clk_cnt_reg(0),
      R => \clk_cnt[15]_i_1_n_0\
    );
\clk_cnt_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => busy,
      D => p_0_in(10),
      Q => clk_cnt_reg(10),
      R => \clk_cnt[15]_i_1_n_0\
    );
\clk_cnt_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => busy,
      D => p_0_in(11),
      Q => clk_cnt_reg(11),
      R => \clk_cnt[15]_i_1_n_0\
    );
\clk_cnt_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => busy,
      D => p_0_in(12),
      Q => clk_cnt_reg(12),
      R => \clk_cnt[15]_i_1_n_0\
    );
\clk_cnt_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => busy,
      D => p_0_in(13),
      Q => clk_cnt_reg(13),
      R => \clk_cnt[15]_i_1_n_0\
    );
\clk_cnt_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => busy,
      D => p_0_in(14),
      Q => clk_cnt_reg(14),
      R => \clk_cnt[15]_i_1_n_0\
    );
\clk_cnt_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => busy,
      D => p_0_in(15),
      Q => clk_cnt_reg(15),
      R => \clk_cnt[15]_i_1_n_0\
    );
\clk_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => busy,
      D => p_0_in(1),
      Q => clk_cnt_reg(1),
      R => \clk_cnt[15]_i_1_n_0\
    );
\clk_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => busy,
      D => p_0_in(2),
      Q => clk_cnt_reg(2),
      R => \clk_cnt[15]_i_1_n_0\
    );
\clk_cnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => busy,
      D => p_0_in(3),
      Q => clk_cnt_reg(3),
      R => \clk_cnt[15]_i_1_n_0\
    );
\clk_cnt_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => busy,
      D => p_0_in(4),
      Q => clk_cnt_reg(4),
      R => \clk_cnt[15]_i_1_n_0\
    );
\clk_cnt_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => busy,
      D => p_0_in(5),
      Q => clk_cnt_reg(5),
      R => \clk_cnt[15]_i_1_n_0\
    );
\clk_cnt_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => busy,
      D => p_0_in(6),
      Q => clk_cnt_reg(6),
      R => \clk_cnt[15]_i_1_n_0\
    );
\clk_cnt_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => busy,
      D => p_0_in(7),
      Q => clk_cnt_reg(7),
      R => \clk_cnt[15]_i_1_n_0\
    );
\clk_cnt_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => busy,
      D => p_0_in(8),
      Q => clk_cnt_reg(8),
      R => \clk_cnt[15]_i_1_n_0\
    );
\clk_cnt_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => busy,
      D => p_0_in(9),
      Q => clk_cnt_reg(9),
      R => \clk_cnt[15]_i_1_n_0\
    );
sending_inv_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFEFFFFF0000"
    )
        port map (
      I0 => sending_reg_inv_0,
      I1 => sending_reg_inv_1,
      I2 => sending_reg_inv_2,
      I3 => sending_reg_inv_3,
      I4 => sending_inv_i_2_n_0,
      I5 => E(0),
      O => sending_reg_inv
    );
sending_inv_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => start_reg,
      I1 => E(0),
      I2 => tx_reg_0,
      I3 => busy,
      O => sending_inv_i_2_n_0
    );
\shifter[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"9CC4F012"
    )
        port map (
      I0 => Q(0),
      I1 => Q(3),
      I2 => Q(2),
      I3 => Q(1),
      I4 => Q(4),
      O => cur_char(0)
    );
\shifter[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5BC03910"
    )
        port map (
      I0 => Q(0),
      I1 => Q(4),
      I2 => Q(3),
      I3 => Q(2),
      I4 => Q(1),
      O => cur_char(1)
    );
\shifter[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AE64D6DE"
    )
        port map (
      I0 => Q(0),
      I1 => Q(1),
      I2 => Q(2),
      I3 => Q(3),
      I4 => Q(4),
      O => cur_char(2)
    );
\shifter[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FC19724D"
    )
        port map (
      I0 => Q(0),
      I1 => Q(1),
      I2 => Q(4),
      I3 => Q(3),
      I4 => Q(2),
      O => cur_char(3)
    );
\shifter[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04019808"
    )
        port map (
      I0 => Q(4),
      I1 => Q(0),
      I2 => Q(1),
      I3 => Q(2),
      I4 => Q(3),
      O => cur_char(4)
    );
\shifter[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"9FFFD9BE"
    )
        port map (
      I0 => Q(0),
      I1 => Q(1),
      I2 => Q(2),
      I3 => Q(4),
      I4 => Q(3),
      O => cur_char(5)
    );
\shifter[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => busy,
      I1 => tx_reg_0,
      I2 => resetn,
      O => \shifter[7]_i_1_n_0\
    );
\shifter[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8FE6F7DF"
    )
        port map (
      I0 => Q(0),
      I1 => Q(1),
      I2 => Q(2),
      I3 => Q(3),
      I4 => Q(4),
      O => cur_char(6)
    );
\shifter_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \shifter[7]_i_1_n_0\,
      D => cur_char(0),
      Q => \shifter_reg_n_0_[1]\,
      R => '0'
    );
\shifter_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \shifter[7]_i_1_n_0\,
      D => cur_char(1),
      Q => \shifter_reg_n_0_[2]\,
      R => '0'
    );
\shifter_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \shifter[7]_i_1_n_0\,
      D => cur_char(2),
      Q => \shifter_reg_n_0_[3]\,
      R => '0'
    );
\shifter_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \shifter[7]_i_1_n_0\,
      D => cur_char(3),
      Q => \shifter_reg_n_0_[4]\,
      R => '0'
    );
\shifter_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \shifter[7]_i_1_n_0\,
      D => cur_char(4),
      Q => \shifter_reg_n_0_[5]\,
      R => '0'
    );
\shifter_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \shifter[7]_i_1_n_0\,
      D => cur_char(5),
      Q => \shifter_reg_n_0_[6]\,
      R => '0'
    );
\shifter_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \shifter[7]_i_1_n_0\,
      D => cur_char(6),
      Q => \shifter_reg_n_0_[7]\,
      R => '0'
    );
start_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000100"
    )
        port map (
      I0 => busy,
      I1 => tx_reg_0,
      I2 => E(0),
      I3 => resetn,
      I4 => start_reg,
      O => busy_reg_0
    );
tx_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => resetn,
      O => \^sr\(0)
    );
tx_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B0BB8088"
    )
        port map (
      I0 => tx_i_3_n_0,
      I1 => tx0_out,
      I2 => busy,
      I3 => tx_reg_0,
      I4 => \^tx\,
      O => tx_i_2_n_0
    );
tx_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B777A23737622222"
    )
        port map (
      I0 => bit_idx_reg(3),
      I1 => bit_idx_reg(0),
      I2 => bit_idx_reg(1),
      I3 => bit_idx_reg(2),
      I4 => tx_i_4_n_0,
      I5 => tx_i_5_n_0,
      O => tx_i_3_n_0
    );
tx_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FCAF0CAFFCA00CA0"
    )
        port map (
      I0 => \shifter_reg_n_0_[6]\,
      I1 => \shifter_reg_n_0_[7]\,
      I2 => bit_idx_reg(0),
      I3 => bit_idx_reg(1),
      I4 => \shifter_reg_n_0_[4]\,
      I5 => \shifter_reg_n_0_[5]\,
      O => tx_i_4_n_0
    );
tx_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0CAF0CA0"
    )
        port map (
      I0 => \shifter_reg_n_0_[2]\,
      I1 => \shifter_reg_n_0_[3]\,
      I2 => bit_idx_reg(0),
      I3 => bit_idx_reg(1),
      I4 => \shifter_reg_n_0_[1]\,
      O => tx_i_5_n_0
    );
tx_reg: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => '1',
      D => tx_i_2_n_0,
      Q => \^tx\,
      S => \^sr\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_hello_pl_0_0_hello_pl is
  port (
    tx : out STD_LOGIC;
    resetn : in STD_LOGIC;
    clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_hello_pl_0_0_hello_pl : entity is "hello_pl";
end system_hello_pl_0_0_hello_pl;

architecture STRUCTURE of system_hello_pl_0_0_hello_pl is
  signal \char_idx[0]_i_1_n_0\ : STD_LOGIC;
  signal \char_idx[1]_i_1_n_0\ : STD_LOGIC;
  signal \char_idx[2]_i_1_n_0\ : STD_LOGIC;
  signal \char_idx[3]_i_1_n_0\ : STD_LOGIC;
  signal \char_idx[5]_i_1_n_0\ : STD_LOGIC;
  signal \char_idx[5]_i_2_n_0\ : STD_LOGIC;
  signal char_idx_reg : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal data0 : STD_LOGIC_VECTOR ( 31 downto 1 );
  signal p_0_in : STD_LOGIC;
  signal \p_0_in__0\ : STD_LOGIC_VECTOR ( 5 downto 4 );
  signal sending_reg_inv_n_0 : STD_LOGIC;
  signal start_i_2_n_0 : STD_LOGIC;
  signal start_reg_n_0 : STD_LOGIC;
  signal u_tx_n_1 : STD_LOGIC;
  signal u_tx_n_2 : STD_LOGIC;
  signal wait_cnt : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \wait_cnt0_carry__0_n_0\ : STD_LOGIC;
  signal \wait_cnt0_carry__0_n_1\ : STD_LOGIC;
  signal \wait_cnt0_carry__0_n_2\ : STD_LOGIC;
  signal \wait_cnt0_carry__0_n_3\ : STD_LOGIC;
  signal \wait_cnt0_carry__0_n_4\ : STD_LOGIC;
  signal \wait_cnt0_carry__0_n_5\ : STD_LOGIC;
  signal \wait_cnt0_carry__0_n_6\ : STD_LOGIC;
  signal \wait_cnt0_carry__0_n_7\ : STD_LOGIC;
  signal \wait_cnt0_carry__1_n_0\ : STD_LOGIC;
  signal \wait_cnt0_carry__1_n_1\ : STD_LOGIC;
  signal \wait_cnt0_carry__1_n_2\ : STD_LOGIC;
  signal \wait_cnt0_carry__1_n_3\ : STD_LOGIC;
  signal \wait_cnt0_carry__1_n_4\ : STD_LOGIC;
  signal \wait_cnt0_carry__1_n_5\ : STD_LOGIC;
  signal \wait_cnt0_carry__1_n_6\ : STD_LOGIC;
  signal \wait_cnt0_carry__1_n_7\ : STD_LOGIC;
  signal \wait_cnt0_carry__2_n_2\ : STD_LOGIC;
  signal \wait_cnt0_carry__2_n_3\ : STD_LOGIC;
  signal \wait_cnt0_carry__2_n_4\ : STD_LOGIC;
  signal \wait_cnt0_carry__2_n_5\ : STD_LOGIC;
  signal \wait_cnt0_carry__2_n_6\ : STD_LOGIC;
  signal \wait_cnt0_carry__2_n_7\ : STD_LOGIC;
  signal wait_cnt0_carry_n_0 : STD_LOGIC;
  signal wait_cnt0_carry_n_1 : STD_LOGIC;
  signal wait_cnt0_carry_n_2 : STD_LOGIC;
  signal wait_cnt0_carry_n_3 : STD_LOGIC;
  signal wait_cnt0_carry_n_4 : STD_LOGIC;
  signal wait_cnt0_carry_n_5 : STD_LOGIC;
  signal wait_cnt0_carry_n_6 : STD_LOGIC;
  signal wait_cnt0_carry_n_7 : STD_LOGIC;
  signal \wait_cnt[31]_i_2_n_0\ : STD_LOGIC;
  signal \wait_cnt[31]_i_3_n_0\ : STD_LOGIC;
  signal \wait_cnt[31]_i_4_n_0\ : STD_LOGIC;
  signal \wait_cnt[31]_i_5_n_0\ : STD_LOGIC;
  signal \wait_cnt[31]_i_6_n_0\ : STD_LOGIC;
  signal \wait_cnt[31]_i_7_n_0\ : STD_LOGIC;
  signal \wait_cnt[31]_i_8_n_0\ : STD_LOGIC;
  signal \wait_cnt[31]_i_9_n_0\ : STD_LOGIC;
  signal \wait_cnt_reg_n_0_[0]\ : STD_LOGIC;
  signal \wait_cnt_reg_n_0_[10]\ : STD_LOGIC;
  signal \wait_cnt_reg_n_0_[11]\ : STD_LOGIC;
  signal \wait_cnt_reg_n_0_[12]\ : STD_LOGIC;
  signal \wait_cnt_reg_n_0_[13]\ : STD_LOGIC;
  signal \wait_cnt_reg_n_0_[14]\ : STD_LOGIC;
  signal \wait_cnt_reg_n_0_[15]\ : STD_LOGIC;
  signal \wait_cnt_reg_n_0_[16]\ : STD_LOGIC;
  signal \wait_cnt_reg_n_0_[17]\ : STD_LOGIC;
  signal \wait_cnt_reg_n_0_[18]\ : STD_LOGIC;
  signal \wait_cnt_reg_n_0_[19]\ : STD_LOGIC;
  signal \wait_cnt_reg_n_0_[1]\ : STD_LOGIC;
  signal \wait_cnt_reg_n_0_[20]\ : STD_LOGIC;
  signal \wait_cnt_reg_n_0_[21]\ : STD_LOGIC;
  signal \wait_cnt_reg_n_0_[22]\ : STD_LOGIC;
  signal \wait_cnt_reg_n_0_[23]\ : STD_LOGIC;
  signal \wait_cnt_reg_n_0_[24]\ : STD_LOGIC;
  signal \wait_cnt_reg_n_0_[25]\ : STD_LOGIC;
  signal \wait_cnt_reg_n_0_[26]\ : STD_LOGIC;
  signal \wait_cnt_reg_n_0_[27]\ : STD_LOGIC;
  signal \wait_cnt_reg_n_0_[28]\ : STD_LOGIC;
  signal \wait_cnt_reg_n_0_[29]\ : STD_LOGIC;
  signal \wait_cnt_reg_n_0_[2]\ : STD_LOGIC;
  signal \wait_cnt_reg_n_0_[30]\ : STD_LOGIC;
  signal \wait_cnt_reg_n_0_[31]\ : STD_LOGIC;
  signal \wait_cnt_reg_n_0_[3]\ : STD_LOGIC;
  signal \wait_cnt_reg_n_0_[4]\ : STD_LOGIC;
  signal \wait_cnt_reg_n_0_[5]\ : STD_LOGIC;
  signal \wait_cnt_reg_n_0_[6]\ : STD_LOGIC;
  signal \wait_cnt_reg_n_0_[7]\ : STD_LOGIC;
  signal \wait_cnt_reg_n_0_[8]\ : STD_LOGIC;
  signal \wait_cnt_reg_n_0_[9]\ : STD_LOGIC;
  signal \NLW_wait_cnt0_carry__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 6 );
  signal \NLW_wait_cnt0_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 to 7 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \char_idx[1]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \char_idx[2]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \char_idx[3]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \char_idx[4]_i_1\ : label is "soft_lutpair14";
  attribute inverted : string;
  attribute inverted of sending_reg_inv : label is "yes";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of wait_cnt0_carry : label is 35;
  attribute ADDER_THRESHOLD of \wait_cnt0_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \wait_cnt0_carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \wait_cnt0_carry__2\ : label is 35;
begin
\char_idx[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => char_idx_reg(0),
      O => \char_idx[0]_i_1_n_0\
    );
\char_idx[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => char_idx_reg(0),
      I1 => char_idx_reg(1),
      O => \char_idx[1]_i_1_n_0\
    );
\char_idx[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => char_idx_reg(2),
      I1 => char_idx_reg(0),
      I2 => char_idx_reg(1),
      O => \char_idx[2]_i_1_n_0\
    );
\char_idx[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => char_idx_reg(3),
      I1 => char_idx_reg(2),
      I2 => char_idx_reg(1),
      I3 => char_idx_reg(0),
      O => \char_idx[3]_i_1_n_0\
    );
\char_idx[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => char_idx_reg(3),
      I1 => char_idx_reg(2),
      I2 => char_idx_reg(1),
      I3 => char_idx_reg(0),
      I4 => char_idx_reg(4),
      O => \p_0_in__0\(4)
    );
\char_idx[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000020FFFFFFFF"
    )
        port map (
      I0 => sending_reg_inv_n_0,
      I1 => \wait_cnt[31]_i_5_n_0\,
      I2 => \wait_cnt[31]_i_4_n_0\,
      I3 => \wait_cnt[31]_i_3_n_0\,
      I4 => \wait_cnt[31]_i_2_n_0\,
      I5 => resetn,
      O => \char_idx[5]_i_1_n_0\
    );
\char_idx[5]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => start_reg_n_0,
      I1 => sending_reg_inv_n_0,
      O => \char_idx[5]_i_2_n_0\
    );
\char_idx[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => char_idx_reg(5),
      I1 => char_idx_reg(4),
      I2 => char_idx_reg(3),
      I3 => char_idx_reg(2),
      I4 => char_idx_reg(1),
      I5 => char_idx_reg(0),
      O => \p_0_in__0\(5)
    );
\char_idx_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \char_idx[5]_i_2_n_0\,
      D => \char_idx[0]_i_1_n_0\,
      Q => char_idx_reg(0),
      R => \char_idx[5]_i_1_n_0\
    );
\char_idx_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \char_idx[5]_i_2_n_0\,
      D => \char_idx[1]_i_1_n_0\,
      Q => char_idx_reg(1),
      R => \char_idx[5]_i_1_n_0\
    );
\char_idx_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \char_idx[5]_i_2_n_0\,
      D => \char_idx[2]_i_1_n_0\,
      Q => char_idx_reg(2),
      R => \char_idx[5]_i_1_n_0\
    );
\char_idx_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \char_idx[5]_i_2_n_0\,
      D => \char_idx[3]_i_1_n_0\,
      Q => char_idx_reg(3),
      R => \char_idx[5]_i_1_n_0\
    );
\char_idx_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \char_idx[5]_i_2_n_0\,
      D => \p_0_in__0\(4),
      Q => char_idx_reg(4),
      R => \char_idx[5]_i_1_n_0\
    );
\char_idx_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \char_idx[5]_i_2_n_0\,
      D => \p_0_in__0\(5),
      Q => char_idx_reg(5),
      R => \char_idx[5]_i_1_n_0\
    );
sending_reg_inv: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => '1',
      D => u_tx_n_2,
      Q => sending_reg_inv_n_0,
      S => p_0_in
    );
start_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080000000"
    )
        port map (
      I0 => char_idx_reg(4),
      I1 => char_idx_reg(3),
      I2 => char_idx_reg(2),
      I3 => char_idx_reg(1),
      I4 => char_idx_reg(0),
      I5 => char_idx_reg(5),
      O => start_i_2_n_0
    );
start_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => u_tx_n_1,
      Q => start_reg_n_0,
      R => '0'
    );
u_tx: entity work.system_hello_pl_0_0_uart_tx
     port map (
      E(0) => sending_reg_inv_n_0,
      Q(4 downto 0) => char_idx_reg(4 downto 0),
      SR(0) => p_0_in,
      busy_reg_0 => u_tx_n_1,
      clk => clk,
      resetn => resetn,
      sending_reg_inv => u_tx_n_2,
      sending_reg_inv_0 => \wait_cnt[31]_i_2_n_0\,
      sending_reg_inv_1 => \wait_cnt[31]_i_3_n_0\,
      sending_reg_inv_2 => \wait_cnt[31]_i_4_n_0\,
      sending_reg_inv_3 => \wait_cnt[31]_i_5_n_0\,
      start_reg => start_i_2_n_0,
      tx => tx,
      tx_reg_0 => start_reg_n_0
    );
wait_cnt0_carry: unisim.vcomponents.CARRY8
     port map (
      CI => \wait_cnt_reg_n_0_[0]\,
      CI_TOP => '0',
      CO(7) => wait_cnt0_carry_n_0,
      CO(6) => wait_cnt0_carry_n_1,
      CO(5) => wait_cnt0_carry_n_2,
      CO(4) => wait_cnt0_carry_n_3,
      CO(3) => wait_cnt0_carry_n_4,
      CO(2) => wait_cnt0_carry_n_5,
      CO(1) => wait_cnt0_carry_n_6,
      CO(0) => wait_cnt0_carry_n_7,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => data0(8 downto 1),
      S(7) => \wait_cnt_reg_n_0_[8]\,
      S(6) => \wait_cnt_reg_n_0_[7]\,
      S(5) => \wait_cnt_reg_n_0_[6]\,
      S(4) => \wait_cnt_reg_n_0_[5]\,
      S(3) => \wait_cnt_reg_n_0_[4]\,
      S(2) => \wait_cnt_reg_n_0_[3]\,
      S(1) => \wait_cnt_reg_n_0_[2]\,
      S(0) => \wait_cnt_reg_n_0_[1]\
    );
\wait_cnt0_carry__0\: unisim.vcomponents.CARRY8
     port map (
      CI => wait_cnt0_carry_n_0,
      CI_TOP => '0',
      CO(7) => \wait_cnt0_carry__0_n_0\,
      CO(6) => \wait_cnt0_carry__0_n_1\,
      CO(5) => \wait_cnt0_carry__0_n_2\,
      CO(4) => \wait_cnt0_carry__0_n_3\,
      CO(3) => \wait_cnt0_carry__0_n_4\,
      CO(2) => \wait_cnt0_carry__0_n_5\,
      CO(1) => \wait_cnt0_carry__0_n_6\,
      CO(0) => \wait_cnt0_carry__0_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => data0(16 downto 9),
      S(7) => \wait_cnt_reg_n_0_[16]\,
      S(6) => \wait_cnt_reg_n_0_[15]\,
      S(5) => \wait_cnt_reg_n_0_[14]\,
      S(4) => \wait_cnt_reg_n_0_[13]\,
      S(3) => \wait_cnt_reg_n_0_[12]\,
      S(2) => \wait_cnt_reg_n_0_[11]\,
      S(1) => \wait_cnt_reg_n_0_[10]\,
      S(0) => \wait_cnt_reg_n_0_[9]\
    );
\wait_cnt0_carry__1\: unisim.vcomponents.CARRY8
     port map (
      CI => \wait_cnt0_carry__0_n_0\,
      CI_TOP => '0',
      CO(7) => \wait_cnt0_carry__1_n_0\,
      CO(6) => \wait_cnt0_carry__1_n_1\,
      CO(5) => \wait_cnt0_carry__1_n_2\,
      CO(4) => \wait_cnt0_carry__1_n_3\,
      CO(3) => \wait_cnt0_carry__1_n_4\,
      CO(2) => \wait_cnt0_carry__1_n_5\,
      CO(1) => \wait_cnt0_carry__1_n_6\,
      CO(0) => \wait_cnt0_carry__1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => data0(24 downto 17),
      S(7) => \wait_cnt_reg_n_0_[24]\,
      S(6) => \wait_cnt_reg_n_0_[23]\,
      S(5) => \wait_cnt_reg_n_0_[22]\,
      S(4) => \wait_cnt_reg_n_0_[21]\,
      S(3) => \wait_cnt_reg_n_0_[20]\,
      S(2) => \wait_cnt_reg_n_0_[19]\,
      S(1) => \wait_cnt_reg_n_0_[18]\,
      S(0) => \wait_cnt_reg_n_0_[17]\
    );
\wait_cnt0_carry__2\: unisim.vcomponents.CARRY8
     port map (
      CI => \wait_cnt0_carry__1_n_0\,
      CI_TOP => '0',
      CO(7 downto 6) => \NLW_wait_cnt0_carry__2_CO_UNCONNECTED\(7 downto 6),
      CO(5) => \wait_cnt0_carry__2_n_2\,
      CO(4) => \wait_cnt0_carry__2_n_3\,
      CO(3) => \wait_cnt0_carry__2_n_4\,
      CO(2) => \wait_cnt0_carry__2_n_5\,
      CO(1) => \wait_cnt0_carry__2_n_6\,
      CO(0) => \wait_cnt0_carry__2_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \NLW_wait_cnt0_carry__2_O_UNCONNECTED\(7),
      O(6 downto 0) => data0(31 downto 25),
      S(7) => '0',
      S(6) => \wait_cnt_reg_n_0_[31]\,
      S(5) => \wait_cnt_reg_n_0_[30]\,
      S(4) => \wait_cnt_reg_n_0_[29]\,
      S(3) => \wait_cnt_reg_n_0_[28]\,
      S(2) => \wait_cnt_reg_n_0_[27]\,
      S(1) => \wait_cnt_reg_n_0_[26]\,
      S(0) => \wait_cnt_reg_n_0_[25]\
    );
\wait_cnt[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \wait_cnt_reg_n_0_[0]\,
      O => wait_cnt(0)
    );
\wait_cnt[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAA8AA"
    )
        port map (
      I0 => data0(10),
      I1 => \wait_cnt[31]_i_2_n_0\,
      I2 => \wait_cnt[31]_i_3_n_0\,
      I3 => \wait_cnt[31]_i_4_n_0\,
      I4 => \wait_cnt[31]_i_5_n_0\,
      O => wait_cnt(10)
    );
\wait_cnt[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAA8AA"
    )
        port map (
      I0 => data0(11),
      I1 => \wait_cnt[31]_i_2_n_0\,
      I2 => \wait_cnt[31]_i_3_n_0\,
      I3 => \wait_cnt[31]_i_4_n_0\,
      I4 => \wait_cnt[31]_i_5_n_0\,
      O => wait_cnt(11)
    );
\wait_cnt[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAA8AA"
    )
        port map (
      I0 => data0(12),
      I1 => \wait_cnt[31]_i_2_n_0\,
      I2 => \wait_cnt[31]_i_3_n_0\,
      I3 => \wait_cnt[31]_i_4_n_0\,
      I4 => \wait_cnt[31]_i_5_n_0\,
      O => wait_cnt(12)
    );
\wait_cnt[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAA8AA"
    )
        port map (
      I0 => data0(13),
      I1 => \wait_cnt[31]_i_2_n_0\,
      I2 => \wait_cnt[31]_i_3_n_0\,
      I3 => \wait_cnt[31]_i_4_n_0\,
      I4 => \wait_cnt[31]_i_5_n_0\,
      O => wait_cnt(13)
    );
\wait_cnt[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAA8AA"
    )
        port map (
      I0 => data0(14),
      I1 => \wait_cnt[31]_i_2_n_0\,
      I2 => \wait_cnt[31]_i_3_n_0\,
      I3 => \wait_cnt[31]_i_4_n_0\,
      I4 => \wait_cnt[31]_i_5_n_0\,
      O => wait_cnt(14)
    );
\wait_cnt[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAA8AA"
    )
        port map (
      I0 => data0(15),
      I1 => \wait_cnt[31]_i_2_n_0\,
      I2 => \wait_cnt[31]_i_3_n_0\,
      I3 => \wait_cnt[31]_i_4_n_0\,
      I4 => \wait_cnt[31]_i_5_n_0\,
      O => wait_cnt(15)
    );
\wait_cnt[16]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAA8AA"
    )
        port map (
      I0 => data0(16),
      I1 => \wait_cnt[31]_i_2_n_0\,
      I2 => \wait_cnt[31]_i_3_n_0\,
      I3 => \wait_cnt[31]_i_4_n_0\,
      I4 => \wait_cnt[31]_i_5_n_0\,
      O => wait_cnt(16)
    );
\wait_cnt[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAA8AA"
    )
        port map (
      I0 => data0(17),
      I1 => \wait_cnt[31]_i_2_n_0\,
      I2 => \wait_cnt[31]_i_3_n_0\,
      I3 => \wait_cnt[31]_i_4_n_0\,
      I4 => \wait_cnt[31]_i_5_n_0\,
      O => wait_cnt(17)
    );
\wait_cnt[18]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAA8AA"
    )
        port map (
      I0 => data0(18),
      I1 => \wait_cnt[31]_i_2_n_0\,
      I2 => \wait_cnt[31]_i_3_n_0\,
      I3 => \wait_cnt[31]_i_4_n_0\,
      I4 => \wait_cnt[31]_i_5_n_0\,
      O => wait_cnt(18)
    );
\wait_cnt[19]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAA8AA"
    )
        port map (
      I0 => data0(19),
      I1 => \wait_cnt[31]_i_2_n_0\,
      I2 => \wait_cnt[31]_i_3_n_0\,
      I3 => \wait_cnt[31]_i_4_n_0\,
      I4 => \wait_cnt[31]_i_5_n_0\,
      O => wait_cnt(19)
    );
\wait_cnt[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAA8AA"
    )
        port map (
      I0 => data0(1),
      I1 => \wait_cnt[31]_i_2_n_0\,
      I2 => \wait_cnt[31]_i_3_n_0\,
      I3 => \wait_cnt[31]_i_4_n_0\,
      I4 => \wait_cnt[31]_i_5_n_0\,
      O => wait_cnt(1)
    );
\wait_cnt[20]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAA8AA"
    )
        port map (
      I0 => data0(20),
      I1 => \wait_cnt[31]_i_2_n_0\,
      I2 => \wait_cnt[31]_i_3_n_0\,
      I3 => \wait_cnt[31]_i_4_n_0\,
      I4 => \wait_cnt[31]_i_5_n_0\,
      O => wait_cnt(20)
    );
\wait_cnt[21]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAA8AA"
    )
        port map (
      I0 => data0(21),
      I1 => \wait_cnt[31]_i_2_n_0\,
      I2 => \wait_cnt[31]_i_3_n_0\,
      I3 => \wait_cnt[31]_i_4_n_0\,
      I4 => \wait_cnt[31]_i_5_n_0\,
      O => wait_cnt(21)
    );
\wait_cnt[22]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAA8AA"
    )
        port map (
      I0 => data0(22),
      I1 => \wait_cnt[31]_i_2_n_0\,
      I2 => \wait_cnt[31]_i_3_n_0\,
      I3 => \wait_cnt[31]_i_4_n_0\,
      I4 => \wait_cnt[31]_i_5_n_0\,
      O => wait_cnt(22)
    );
\wait_cnt[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAA8AA"
    )
        port map (
      I0 => data0(23),
      I1 => \wait_cnt[31]_i_2_n_0\,
      I2 => \wait_cnt[31]_i_3_n_0\,
      I3 => \wait_cnt[31]_i_4_n_0\,
      I4 => \wait_cnt[31]_i_5_n_0\,
      O => wait_cnt(23)
    );
\wait_cnt[24]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAA8AA"
    )
        port map (
      I0 => data0(24),
      I1 => \wait_cnt[31]_i_2_n_0\,
      I2 => \wait_cnt[31]_i_3_n_0\,
      I3 => \wait_cnt[31]_i_4_n_0\,
      I4 => \wait_cnt[31]_i_5_n_0\,
      O => wait_cnt(24)
    );
\wait_cnt[25]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAA8AA"
    )
        port map (
      I0 => data0(25),
      I1 => \wait_cnt[31]_i_2_n_0\,
      I2 => \wait_cnt[31]_i_3_n_0\,
      I3 => \wait_cnt[31]_i_4_n_0\,
      I4 => \wait_cnt[31]_i_5_n_0\,
      O => wait_cnt(25)
    );
\wait_cnt[26]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAA8AA"
    )
        port map (
      I0 => data0(26),
      I1 => \wait_cnt[31]_i_2_n_0\,
      I2 => \wait_cnt[31]_i_3_n_0\,
      I3 => \wait_cnt[31]_i_4_n_0\,
      I4 => \wait_cnt[31]_i_5_n_0\,
      O => wait_cnt(26)
    );
\wait_cnt[27]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAA8AA"
    )
        port map (
      I0 => data0(27),
      I1 => \wait_cnt[31]_i_2_n_0\,
      I2 => \wait_cnt[31]_i_3_n_0\,
      I3 => \wait_cnt[31]_i_4_n_0\,
      I4 => \wait_cnt[31]_i_5_n_0\,
      O => wait_cnt(27)
    );
\wait_cnt[28]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAA8AA"
    )
        port map (
      I0 => data0(28),
      I1 => \wait_cnt[31]_i_2_n_0\,
      I2 => \wait_cnt[31]_i_3_n_0\,
      I3 => \wait_cnt[31]_i_4_n_0\,
      I4 => \wait_cnt[31]_i_5_n_0\,
      O => wait_cnt(28)
    );
\wait_cnt[29]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAA8AA"
    )
        port map (
      I0 => data0(29),
      I1 => \wait_cnt[31]_i_2_n_0\,
      I2 => \wait_cnt[31]_i_3_n_0\,
      I3 => \wait_cnt[31]_i_4_n_0\,
      I4 => \wait_cnt[31]_i_5_n_0\,
      O => wait_cnt(29)
    );
\wait_cnt[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAA8AA"
    )
        port map (
      I0 => data0(2),
      I1 => \wait_cnt[31]_i_2_n_0\,
      I2 => \wait_cnt[31]_i_3_n_0\,
      I3 => \wait_cnt[31]_i_4_n_0\,
      I4 => \wait_cnt[31]_i_5_n_0\,
      O => wait_cnt(2)
    );
\wait_cnt[30]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAA8AA"
    )
        port map (
      I0 => data0(30),
      I1 => \wait_cnt[31]_i_2_n_0\,
      I2 => \wait_cnt[31]_i_3_n_0\,
      I3 => \wait_cnt[31]_i_4_n_0\,
      I4 => \wait_cnt[31]_i_5_n_0\,
      O => wait_cnt(30)
    );
\wait_cnt[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAA8AA"
    )
        port map (
      I0 => data0(31),
      I1 => \wait_cnt[31]_i_2_n_0\,
      I2 => \wait_cnt[31]_i_3_n_0\,
      I3 => \wait_cnt[31]_i_4_n_0\,
      I4 => \wait_cnt[31]_i_5_n_0\,
      O => wait_cnt(31)
    );
\wait_cnt[31]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFBFFF"
    )
        port map (
      I0 => \wait_cnt_reg_n_0_[8]\,
      I1 => \wait_cnt_reg_n_0_[0]\,
      I2 => \wait_cnt_reg_n_0_[21]\,
      I3 => \wait_cnt_reg_n_0_[22]\,
      I4 => \wait_cnt[31]_i_6_n_0\,
      O => \wait_cnt[31]_i_2_n_0\
    );
\wait_cnt[31]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFB"
    )
        port map (
      I0 => \wait_cnt_reg_n_0_[27]\,
      I1 => \wait_cnt_reg_n_0_[2]\,
      I2 => \wait_cnt_reg_n_0_[28]\,
      I3 => \wait_cnt_reg_n_0_[30]\,
      I4 => \wait_cnt[31]_i_7_n_0\,
      O => \wait_cnt[31]_i_3_n_0\
    );
\wait_cnt[31]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00004000"
    )
        port map (
      I0 => \wait_cnt_reg_n_0_[12]\,
      I1 => \wait_cnt_reg_n_0_[18]\,
      I2 => \wait_cnt_reg_n_0_[13]\,
      I3 => \wait_cnt_reg_n_0_[14]\,
      I4 => \wait_cnt[31]_i_8_n_0\,
      O => \wait_cnt[31]_i_4_n_0\
    );
\wait_cnt[31]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFEFFF"
    )
        port map (
      I0 => \wait_cnt_reg_n_0_[17]\,
      I1 => \wait_cnt_reg_n_0_[29]\,
      I2 => \wait_cnt_reg_n_0_[15]\,
      I3 => \wait_cnt_reg_n_0_[5]\,
      I4 => \wait_cnt[31]_i_9_n_0\,
      O => \wait_cnt[31]_i_5_n_0\
    );
\wait_cnt[31]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DFFF"
    )
        port map (
      I0 => \wait_cnt_reg_n_0_[7]\,
      I1 => \wait_cnt_reg_n_0_[10]\,
      I2 => \wait_cnt_reg_n_0_[3]\,
      I3 => \wait_cnt_reg_n_0_[24]\,
      O => \wait_cnt[31]_i_6_n_0\
    );
\wait_cnt[31]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => \wait_cnt_reg_n_0_[11]\,
      I1 => \wait_cnt_reg_n_0_[19]\,
      I2 => \wait_cnt_reg_n_0_[23]\,
      I3 => \wait_cnt_reg_n_0_[9]\,
      O => \wait_cnt[31]_i_7_n_0\
    );
\wait_cnt[31]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF7F"
    )
        port map (
      I0 => \wait_cnt_reg_n_0_[26]\,
      I1 => \wait_cnt_reg_n_0_[1]\,
      I2 => \wait_cnt_reg_n_0_[20]\,
      I3 => \wait_cnt_reg_n_0_[25]\,
      O => \wait_cnt[31]_i_8_n_0\
    );
\wait_cnt[31]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF7F"
    )
        port map (
      I0 => \wait_cnt_reg_n_0_[6]\,
      I1 => \wait_cnt_reg_n_0_[16]\,
      I2 => \wait_cnt_reg_n_0_[4]\,
      I3 => \wait_cnt_reg_n_0_[31]\,
      O => \wait_cnt[31]_i_9_n_0\
    );
\wait_cnt[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAA8AA"
    )
        port map (
      I0 => data0(3),
      I1 => \wait_cnt[31]_i_2_n_0\,
      I2 => \wait_cnt[31]_i_3_n_0\,
      I3 => \wait_cnt[31]_i_4_n_0\,
      I4 => \wait_cnt[31]_i_5_n_0\,
      O => wait_cnt(3)
    );
\wait_cnt[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAA8AA"
    )
        port map (
      I0 => data0(4),
      I1 => \wait_cnt[31]_i_2_n_0\,
      I2 => \wait_cnt[31]_i_3_n_0\,
      I3 => \wait_cnt[31]_i_4_n_0\,
      I4 => \wait_cnt[31]_i_5_n_0\,
      O => wait_cnt(4)
    );
\wait_cnt[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAA8AA"
    )
        port map (
      I0 => data0(5),
      I1 => \wait_cnt[31]_i_2_n_0\,
      I2 => \wait_cnt[31]_i_3_n_0\,
      I3 => \wait_cnt[31]_i_4_n_0\,
      I4 => \wait_cnt[31]_i_5_n_0\,
      O => wait_cnt(5)
    );
\wait_cnt[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAA8AA"
    )
        port map (
      I0 => data0(6),
      I1 => \wait_cnt[31]_i_2_n_0\,
      I2 => \wait_cnt[31]_i_3_n_0\,
      I3 => \wait_cnt[31]_i_4_n_0\,
      I4 => \wait_cnt[31]_i_5_n_0\,
      O => wait_cnt(6)
    );
\wait_cnt[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAA8AA"
    )
        port map (
      I0 => data0(7),
      I1 => \wait_cnt[31]_i_2_n_0\,
      I2 => \wait_cnt[31]_i_3_n_0\,
      I3 => \wait_cnt[31]_i_4_n_0\,
      I4 => \wait_cnt[31]_i_5_n_0\,
      O => wait_cnt(7)
    );
\wait_cnt[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAA8AA"
    )
        port map (
      I0 => data0(8),
      I1 => \wait_cnt[31]_i_2_n_0\,
      I2 => \wait_cnt[31]_i_3_n_0\,
      I3 => \wait_cnt[31]_i_4_n_0\,
      I4 => \wait_cnt[31]_i_5_n_0\,
      O => wait_cnt(8)
    );
\wait_cnt[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAA8AA"
    )
        port map (
      I0 => data0(9),
      I1 => \wait_cnt[31]_i_2_n_0\,
      I2 => \wait_cnt[31]_i_3_n_0\,
      I3 => \wait_cnt[31]_i_4_n_0\,
      I4 => \wait_cnt[31]_i_5_n_0\,
      O => wait_cnt(9)
    );
\wait_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => sending_reg_inv_n_0,
      D => wait_cnt(0),
      Q => \wait_cnt_reg_n_0_[0]\,
      R => p_0_in
    );
\wait_cnt_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => sending_reg_inv_n_0,
      D => wait_cnt(10),
      Q => \wait_cnt_reg_n_0_[10]\,
      R => p_0_in
    );
\wait_cnt_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => sending_reg_inv_n_0,
      D => wait_cnt(11),
      Q => \wait_cnt_reg_n_0_[11]\,
      R => p_0_in
    );
\wait_cnt_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => sending_reg_inv_n_0,
      D => wait_cnt(12),
      Q => \wait_cnt_reg_n_0_[12]\,
      R => p_0_in
    );
\wait_cnt_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => sending_reg_inv_n_0,
      D => wait_cnt(13),
      Q => \wait_cnt_reg_n_0_[13]\,
      R => p_0_in
    );
\wait_cnt_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => sending_reg_inv_n_0,
      D => wait_cnt(14),
      Q => \wait_cnt_reg_n_0_[14]\,
      R => p_0_in
    );
\wait_cnt_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => sending_reg_inv_n_0,
      D => wait_cnt(15),
      Q => \wait_cnt_reg_n_0_[15]\,
      R => p_0_in
    );
\wait_cnt_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => sending_reg_inv_n_0,
      D => wait_cnt(16),
      Q => \wait_cnt_reg_n_0_[16]\,
      R => p_0_in
    );
\wait_cnt_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => sending_reg_inv_n_0,
      D => wait_cnt(17),
      Q => \wait_cnt_reg_n_0_[17]\,
      R => p_0_in
    );
\wait_cnt_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => sending_reg_inv_n_0,
      D => wait_cnt(18),
      Q => \wait_cnt_reg_n_0_[18]\,
      R => p_0_in
    );
\wait_cnt_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => sending_reg_inv_n_0,
      D => wait_cnt(19),
      Q => \wait_cnt_reg_n_0_[19]\,
      R => p_0_in
    );
\wait_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => sending_reg_inv_n_0,
      D => wait_cnt(1),
      Q => \wait_cnt_reg_n_0_[1]\,
      R => p_0_in
    );
\wait_cnt_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => sending_reg_inv_n_0,
      D => wait_cnt(20),
      Q => \wait_cnt_reg_n_0_[20]\,
      R => p_0_in
    );
\wait_cnt_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => sending_reg_inv_n_0,
      D => wait_cnt(21),
      Q => \wait_cnt_reg_n_0_[21]\,
      R => p_0_in
    );
\wait_cnt_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => sending_reg_inv_n_0,
      D => wait_cnt(22),
      Q => \wait_cnt_reg_n_0_[22]\,
      R => p_0_in
    );
\wait_cnt_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => sending_reg_inv_n_0,
      D => wait_cnt(23),
      Q => \wait_cnt_reg_n_0_[23]\,
      R => p_0_in
    );
\wait_cnt_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => sending_reg_inv_n_0,
      D => wait_cnt(24),
      Q => \wait_cnt_reg_n_0_[24]\,
      R => p_0_in
    );
\wait_cnt_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => sending_reg_inv_n_0,
      D => wait_cnt(25),
      Q => \wait_cnt_reg_n_0_[25]\,
      R => p_0_in
    );
\wait_cnt_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => sending_reg_inv_n_0,
      D => wait_cnt(26),
      Q => \wait_cnt_reg_n_0_[26]\,
      R => p_0_in
    );
\wait_cnt_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => sending_reg_inv_n_0,
      D => wait_cnt(27),
      Q => \wait_cnt_reg_n_0_[27]\,
      R => p_0_in
    );
\wait_cnt_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => sending_reg_inv_n_0,
      D => wait_cnt(28),
      Q => \wait_cnt_reg_n_0_[28]\,
      R => p_0_in
    );
\wait_cnt_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => sending_reg_inv_n_0,
      D => wait_cnt(29),
      Q => \wait_cnt_reg_n_0_[29]\,
      R => p_0_in
    );
\wait_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => sending_reg_inv_n_0,
      D => wait_cnt(2),
      Q => \wait_cnt_reg_n_0_[2]\,
      R => p_0_in
    );
\wait_cnt_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => sending_reg_inv_n_0,
      D => wait_cnt(30),
      Q => \wait_cnt_reg_n_0_[30]\,
      R => p_0_in
    );
\wait_cnt_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => sending_reg_inv_n_0,
      D => wait_cnt(31),
      Q => \wait_cnt_reg_n_0_[31]\,
      R => p_0_in
    );
\wait_cnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => sending_reg_inv_n_0,
      D => wait_cnt(3),
      Q => \wait_cnt_reg_n_0_[3]\,
      R => p_0_in
    );
\wait_cnt_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => sending_reg_inv_n_0,
      D => wait_cnt(4),
      Q => \wait_cnt_reg_n_0_[4]\,
      R => p_0_in
    );
\wait_cnt_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => sending_reg_inv_n_0,
      D => wait_cnt(5),
      Q => \wait_cnt_reg_n_0_[5]\,
      R => p_0_in
    );
\wait_cnt_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => sending_reg_inv_n_0,
      D => wait_cnt(6),
      Q => \wait_cnt_reg_n_0_[6]\,
      R => p_0_in
    );
\wait_cnt_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => sending_reg_inv_n_0,
      D => wait_cnt(7),
      Q => \wait_cnt_reg_n_0_[7]\,
      R => p_0_in
    );
\wait_cnt_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => sending_reg_inv_n_0,
      D => wait_cnt(8),
      Q => \wait_cnt_reg_n_0_[8]\,
      R => p_0_in
    );
\wait_cnt_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => sending_reg_inv_n_0,
      D => wait_cnt(9),
      Q => \wait_cnt_reg_n_0_[9]\,
      R => p_0_in
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_hello_pl_0_0 is
  port (
    clk : in STD_LOGIC;
    resetn : in STD_LOGIC;
    tx : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of system_hello_pl_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of system_hello_pl_0_0 : entity is "system_hello_pl_0_0,hello_pl,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of system_hello_pl_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of system_hello_pl_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of system_hello_pl_0_0 : entity is "hello_pl,Vivado 2026.1";
end system_hello_pl_0_0;

architecture STRUCTURE of system_hello_pl_0_0 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of clk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_RESET resetn, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of resetn : signal is "xilinx.com:signal:reset:1.0 resetn RST";
  attribute X_INTERFACE_MODE of resetn : signal is "slave";
  attribute X_INTERFACE_PARAMETER of resetn : signal is "XIL_INTERFACENAME resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
inst: entity work.system_hello_pl_0_0_hello_pl
     port map (
      clk => clk,
      resetn => resetn,
      tx => tx
    );
end STRUCTURE;
