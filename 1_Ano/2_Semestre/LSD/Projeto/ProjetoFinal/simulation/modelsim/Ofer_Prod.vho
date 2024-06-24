-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 17.1.0 Build 590 10/25/2017 SJ Lite Edition"

-- DATE "06/16/2021 01:26:39"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_F4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_P3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_P28,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Ofer_Prod_Top IS
    PORT (
	CLOCK_50 : IN std_logic;
	KEY : IN std_logic_vector(1 DOWNTO 0);
	SW : IN std_logic_vector(4 DOWNTO 0);
	LEDR : BUFFER std_logic_vector(0 DOWNTO 0);
	LEDG : BUFFER std_logic_vector(0 DOWNTO 0);
	HEX0 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX1 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX2 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX3 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX4 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX5 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX6 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX7 : BUFFER std_logic_vector(6 DOWNTO 0)
	);
END Ofer_Prod_Top;

-- Design Ports Information
-- LEDR[0]	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[0]	=>  Location: PIN_E21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[0]	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[1]	=>  Location: PIN_F22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[2]	=>  Location: PIN_E17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[3]	=>  Location: PIN_L26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[4]	=>  Location: PIN_L25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[5]	=>  Location: PIN_J22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[6]	=>  Location: PIN_H22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[0]	=>  Location: PIN_M24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[1]	=>  Location: PIN_Y22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[2]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[3]	=>  Location: PIN_W22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[4]	=>  Location: PIN_W25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[5]	=>  Location: PIN_U23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[6]	=>  Location: PIN_U24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[0]	=>  Location: PIN_AA25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[1]	=>  Location: PIN_AA26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[2]	=>  Location: PIN_Y25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[3]	=>  Location: PIN_W26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[4]	=>  Location: PIN_Y26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[5]	=>  Location: PIN_W27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[6]	=>  Location: PIN_W28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[0]	=>  Location: PIN_V21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[1]	=>  Location: PIN_U21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[2]	=>  Location: PIN_AB20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[3]	=>  Location: PIN_AA21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[4]	=>  Location: PIN_AD24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[5]	=>  Location: PIN_AF23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[6]	=>  Location: PIN_Y19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[0]	=>  Location: PIN_AB19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[1]	=>  Location: PIN_AA19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[2]	=>  Location: PIN_AG21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[3]	=>  Location: PIN_AH21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[4]	=>  Location: PIN_AE19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[5]	=>  Location: PIN_AF19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[6]	=>  Location: PIN_AE18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[0]	=>  Location: PIN_AD18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[1]	=>  Location: PIN_AC18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[2]	=>  Location: PIN_AB18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[3]	=>  Location: PIN_AH19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[4]	=>  Location: PIN_AG19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[5]	=>  Location: PIN_AF18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[6]	=>  Location: PIN_AH18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[0]	=>  Location: PIN_AA17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[1]	=>  Location: PIN_AB16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[2]	=>  Location: PIN_AA16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[3]	=>  Location: PIN_AB17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[4]	=>  Location: PIN_AB15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[5]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[6]	=>  Location: PIN_AC17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX7[0]	=>  Location: PIN_AD17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX7[1]	=>  Location: PIN_AE17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX7[2]	=>  Location: PIN_AG17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX7[3]	=>  Location: PIN_AH17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX7[4]	=>  Location: PIN_AF17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX7[5]	=>  Location: PIN_AG18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX7[6]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK_50	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[4]	=>  Location: PIN_AB27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[2]	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[3]	=>  Location: PIN_AD27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[0]	=>  Location: PIN_M23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[1]	=>  Location: PIN_M21,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Ofer_Prod_Top IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL ww_KEY : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_SW : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_LEDR : std_logic_vector(0 DOWNTO 0);
SIGNAL ww_LEDG : std_logic_vector(0 DOWNTO 0);
SIGNAL ww_HEX0 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX2 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX3 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX4 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX5 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX6 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX7 : std_logic_vector(6 DOWNTO 0);
SIGNAL \CLOCK_50~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \LEDR[0]~output_o\ : std_logic;
SIGNAL \LEDG[0]~output_o\ : std_logic;
SIGNAL \HEX0[0]~output_o\ : std_logic;
SIGNAL \HEX0[1]~output_o\ : std_logic;
SIGNAL \HEX0[2]~output_o\ : std_logic;
SIGNAL \HEX0[3]~output_o\ : std_logic;
SIGNAL \HEX0[4]~output_o\ : std_logic;
SIGNAL \HEX0[5]~output_o\ : std_logic;
SIGNAL \HEX0[6]~output_o\ : std_logic;
SIGNAL \HEX1[0]~output_o\ : std_logic;
SIGNAL \HEX1[1]~output_o\ : std_logic;
SIGNAL \HEX1[2]~output_o\ : std_logic;
SIGNAL \HEX1[3]~output_o\ : std_logic;
SIGNAL \HEX1[4]~output_o\ : std_logic;
SIGNAL \HEX1[5]~output_o\ : std_logic;
SIGNAL \HEX1[6]~output_o\ : std_logic;
SIGNAL \HEX2[0]~output_o\ : std_logic;
SIGNAL \HEX2[1]~output_o\ : std_logic;
SIGNAL \HEX2[2]~output_o\ : std_logic;
SIGNAL \HEX2[3]~output_o\ : std_logic;
SIGNAL \HEX2[4]~output_o\ : std_logic;
SIGNAL \HEX2[5]~output_o\ : std_logic;
SIGNAL \HEX2[6]~output_o\ : std_logic;
SIGNAL \HEX3[0]~output_o\ : std_logic;
SIGNAL \HEX3[1]~output_o\ : std_logic;
SIGNAL \HEX3[2]~output_o\ : std_logic;
SIGNAL \HEX3[3]~output_o\ : std_logic;
SIGNAL \HEX3[4]~output_o\ : std_logic;
SIGNAL \HEX3[5]~output_o\ : std_logic;
SIGNAL \HEX3[6]~output_o\ : std_logic;
SIGNAL \HEX4[0]~output_o\ : std_logic;
SIGNAL \HEX4[1]~output_o\ : std_logic;
SIGNAL \HEX4[2]~output_o\ : std_logic;
SIGNAL \HEX4[3]~output_o\ : std_logic;
SIGNAL \HEX4[4]~output_o\ : std_logic;
SIGNAL \HEX4[5]~output_o\ : std_logic;
SIGNAL \HEX4[6]~output_o\ : std_logic;
SIGNAL \HEX5[0]~output_o\ : std_logic;
SIGNAL \HEX5[1]~output_o\ : std_logic;
SIGNAL \HEX5[2]~output_o\ : std_logic;
SIGNAL \HEX5[3]~output_o\ : std_logic;
SIGNAL \HEX5[4]~output_o\ : std_logic;
SIGNAL \HEX5[5]~output_o\ : std_logic;
SIGNAL \HEX5[6]~output_o\ : std_logic;
SIGNAL \HEX6[0]~output_o\ : std_logic;
SIGNAL \HEX6[1]~output_o\ : std_logic;
SIGNAL \HEX6[2]~output_o\ : std_logic;
SIGNAL \HEX6[3]~output_o\ : std_logic;
SIGNAL \HEX6[4]~output_o\ : std_logic;
SIGNAL \HEX6[5]~output_o\ : std_logic;
SIGNAL \HEX6[6]~output_o\ : std_logic;
SIGNAL \HEX7[0]~output_o\ : std_logic;
SIGNAL \HEX7[1]~output_o\ : std_logic;
SIGNAL \HEX7[2]~output_o\ : std_logic;
SIGNAL \HEX7[3]~output_o\ : std_logic;
SIGNAL \HEX7[4]~output_o\ : std_logic;
SIGNAL \HEX7[5]~output_o\ : std_logic;
SIGNAL \HEX7[6]~output_o\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \CLOCK_50~inputclkctrl_outclk\ : std_logic;
SIGNAL \SW[2]~input_o\ : std_logic;
SIGNAL \SW[4]~input_o\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \main_fsm|s_currentState.START~0_combout\ : std_logic;
SIGNAL \main_fsm|s_currentState.START~q\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \SW[3]~input_o\ : std_logic;
SIGNAL \main_fsm|Selector2~0_combout\ : std_logic;
SIGNAL \main_fsm|s_currentState~17_combout\ : std_logic;
SIGNAL \main_fsm|s_currentState~16_combout\ : std_logic;
SIGNAL \main_fsm|s_currentState~18_combout\ : std_logic;
SIGNAL \main_fsm|s_currentState.PREP_SPES~q\ : std_logic;
SIGNAL \main_fsm|s_currentState~23_combout\ : std_logic;
SIGNAL \main_fsm|s_currentState~24_combout\ : std_logic;
SIGNAL \main_fsm|s_currentState.DIS_SPES~q\ : std_logic;
SIGNAL \main_fsm|s_currentState~11_combout\ : std_logic;
SIGNAL \main_fsm|s_currentState~12_combout\ : std_logic;
SIGNAL \main_fsm|s_currentState.PREP_FAN~q\ : std_logic;
SIGNAL \main_fsm|s_currentState~19_combout\ : std_logic;
SIGNAL \main_fsm|s_currentState~20_combout\ : std_logic;
SIGNAL \main_fsm|s_currentState.DIS_FAN~q\ : std_logic;
SIGNAL \main_fsm|s_currentState~21_combout\ : std_logic;
SIGNAL \main_fsm|s_currentState~22_combout\ : std_logic;
SIGNAL \main_fsm|s_currentState.DIS_SOLI~q\ : std_logic;
SIGNAL \main_fsm|Selector2~4_combout\ : std_logic;
SIGNAL \main_fsm|Selector2~1_combout\ : std_logic;
SIGNAL \main_fsm|Selector2~2_combout\ : std_logic;
SIGNAL \main_fsm|s_currentState~26_combout\ : std_logic;
SIGNAL \main_fsm|s_currentState.START_DONE~q\ : std_logic;
SIGNAL \main_fsm|Selector2~3_combout\ : std_logic;
SIGNAL \main_fsm|s_currentState~25_combout\ : std_logic;
SIGNAL \main_fsm|s_currentState.EREF~q\ : std_logic;
SIGNAL \main_fsm|Selector1~0_combout\ : std_logic;
SIGNAL \main_fsm|selModoGelo~0_combout\ : std_logic;
SIGNAL \timer_fsm|Mult0|mult_core|_~1_combout\ : std_logic;
SIGNAL \main_fsm|WideOr10~0_combout\ : std_logic;
SIGNAL \timer_fsm|Mult0|mult_core|romout[0][28]~0_combout\ : std_logic;
SIGNAL \timer_fsm|Add0~1_cout\ : std_logic;
SIGNAL \timer_fsm|Add0~3_cout\ : std_logic;
SIGNAL \timer_fsm|Add0~5\ : std_logic;
SIGNAL \timer_fsm|Add0~8\ : std_logic;
SIGNAL \timer_fsm|Add0~11\ : std_logic;
SIGNAL \timer_fsm|Add0~14\ : std_logic;
SIGNAL \timer_fsm|Add0~17\ : std_logic;
SIGNAL \timer_fsm|Add0~20\ : std_logic;
SIGNAL \timer_fsm|Add0~22\ : std_logic;
SIGNAL \timer_fsm|Add0~24\ : std_logic;
SIGNAL \timer_fsm|Add0~25_combout\ : std_logic;
SIGNAL \timer_fsm|Add0~23_combout\ : std_logic;
SIGNAL \timer_fsm|Add0~21_combout\ : std_logic;
SIGNAL \timer_fsm|Add0~13_combout\ : std_logic;
SIGNAL \timer_fsm|Add0~10_combout\ : std_logic;
SIGNAL \timer_fsm|Add0~7_combout\ : std_logic;
SIGNAL \timer_fsm|Add0~4_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~0_combout\ : std_logic;
SIGNAL \timer_fsm|s_counter~15_combout\ : std_logic;
SIGNAL \timer_fsm|s_counter[2]~16_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~1\ : std_logic;
SIGNAL \timer_fsm|Add1~2_combout\ : std_logic;
SIGNAL \timer_fsm|s_counter~17_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~3\ : std_logic;
SIGNAL \timer_fsm|Add1~4_combout\ : std_logic;
SIGNAL \timer_fsm|s_counter~18_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~5\ : std_logic;
SIGNAL \timer_fsm|Add1~6_combout\ : std_logic;
SIGNAL \timer_fsm|s_counter~19_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~7\ : std_logic;
SIGNAL \timer_fsm|Add1~8_combout\ : std_logic;
SIGNAL \timer_fsm|s_counter~20_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~9\ : std_logic;
SIGNAL \timer_fsm|Add1~10_combout\ : std_logic;
SIGNAL \timer_fsm|s_counter~21_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~11\ : std_logic;
SIGNAL \timer_fsm|Add1~12_combout\ : std_logic;
SIGNAL \timer_fsm|s_counter~22_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~13\ : std_logic;
SIGNAL \timer_fsm|Add1~14_combout\ : std_logic;
SIGNAL \timer_fsm|s_counter~23_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~15\ : std_logic;
SIGNAL \timer_fsm|Add1~16_combout\ : std_logic;
SIGNAL \timer_fsm|s_counter~24_combout\ : std_logic;
SIGNAL \timer_fsm|s_counter[8]~feeder_combout\ : std_logic;
SIGNAL \main_fsm|s_currentState.START~_wirecell_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~17\ : std_logic;
SIGNAL \timer_fsm|Add1~18_combout\ : std_logic;
SIGNAL \timer_fsm|s_counter~25_combout\ : std_logic;
SIGNAL \timer_fsm|s_counter~26_combout\ : std_logic;
SIGNAL \timer_fsm|s_counter[9]~feeder_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~19\ : std_logic;
SIGNAL \timer_fsm|Add1~20_combout\ : std_logic;
SIGNAL \timer_fsm|Add0~6_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~21\ : std_logic;
SIGNAL \timer_fsm|Add1~22_combout\ : std_logic;
SIGNAL \timer_fsm|Add0~9_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~23\ : std_logic;
SIGNAL \timer_fsm|Add1~24_combout\ : std_logic;
SIGNAL \timer_fsm|Add0~12_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~25\ : std_logic;
SIGNAL \timer_fsm|Add1~26_combout\ : std_logic;
SIGNAL \timer_fsm|Add0~15_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~27\ : std_logic;
SIGNAL \timer_fsm|Add1~28_combout\ : std_logic;
SIGNAL \timer_fsm|Add0~16_combout\ : std_logic;
SIGNAL \timer_fsm|Add0~18_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~29\ : std_logic;
SIGNAL \timer_fsm|Add1~30_combout\ : std_logic;
SIGNAL \timer_fsm|Add0~19_combout\ : std_logic;
SIGNAL \timer_fsm|s_counter[15]~0_combout\ : std_logic;
SIGNAL \timer_fsm|Mult0|mult_core|romout[0][28]~0_wirecell_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~31\ : std_logic;
SIGNAL \timer_fsm|Add1~32_combout\ : std_logic;
SIGNAL \timer_fsm|s_counter[16]~1_combout\ : std_logic;
SIGNAL \main_fsm|WideOr10~0_wirecell_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~33\ : std_logic;
SIGNAL \timer_fsm|Add1~34_combout\ : std_logic;
SIGNAL \timer_fsm|s_counter[17]~2_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~35\ : std_logic;
SIGNAL \timer_fsm|Add1~36_combout\ : std_logic;
SIGNAL \timer_fsm|s_counter[18]~3_combout\ : std_logic;
SIGNAL \timer_fsm|Equal0~5_combout\ : std_logic;
SIGNAL \timer_fsm|Mult0|mult_core|_~0_combout\ : std_logic;
SIGNAL \timer_fsm|Add0~26\ : std_logic;
SIGNAL \timer_fsm|Add0~28\ : std_logic;
SIGNAL \timer_fsm|Add0~29_combout\ : std_logic;
SIGNAL \timer_fsm|Add0~27_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~37\ : std_logic;
SIGNAL \timer_fsm|Add1~38_combout\ : std_logic;
SIGNAL \timer_fsm|s_counter[19]~4_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~39\ : std_logic;
SIGNAL \timer_fsm|Add1~40_combout\ : std_logic;
SIGNAL \timer_fsm|s_counter[20]~5_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~41\ : std_logic;
SIGNAL \timer_fsm|Add1~42_combout\ : std_logic;
SIGNAL \timer_fsm|Add0~30\ : std_logic;
SIGNAL \timer_fsm|Add0~31_combout\ : std_logic;
SIGNAL \timer_fsm|s_counter[21]~6_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~43\ : std_logic;
SIGNAL \timer_fsm|Add1~44_combout\ : std_logic;
SIGNAL \timer_fsm|Add0~32\ : std_logic;
SIGNAL \timer_fsm|Add0~33_combout\ : std_logic;
SIGNAL \timer_fsm|s_counter[22]~7_combout\ : std_logic;
SIGNAL \timer_fsm|Equal0~6_combout\ : std_logic;
SIGNAL \timer_fsm|Equal0~1_combout\ : std_logic;
SIGNAL \timer_fsm|Equal0~0_combout\ : std_logic;
SIGNAL \timer_fsm|Equal0~2_combout\ : std_logic;
SIGNAL \timer_fsm|Add0~34\ : std_logic;
SIGNAL \timer_fsm|Add0~36\ : std_logic;
SIGNAL \timer_fsm|Add0~38\ : std_logic;
SIGNAL \timer_fsm|Add0~40\ : std_logic;
SIGNAL \timer_fsm|Add0~42\ : std_logic;
SIGNAL \timer_fsm|Add0~44\ : std_logic;
SIGNAL \timer_fsm|Add0~46\ : std_logic;
SIGNAL \timer_fsm|Add0~47_combout\ : std_logic;
SIGNAL \timer_fsm|Add0~45_combout\ : std_logic;
SIGNAL \timer_fsm|Add0~43_combout\ : std_logic;
SIGNAL \timer_fsm|Add0~41_combout\ : std_logic;
SIGNAL \timer_fsm|Add0~37_combout\ : std_logic;
SIGNAL \timer_fsm|Add0~35_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~45\ : std_logic;
SIGNAL \timer_fsm|Add1~46_combout\ : std_logic;
SIGNAL \timer_fsm|s_counter[23]~8_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~47\ : std_logic;
SIGNAL \timer_fsm|Add1~48_combout\ : std_logic;
SIGNAL \timer_fsm|s_counter[24]~9_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~49\ : std_logic;
SIGNAL \timer_fsm|Add1~50_combout\ : std_logic;
SIGNAL \timer_fsm|Add0~39_combout\ : std_logic;
SIGNAL \timer_fsm|s_counter[25]~10_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~51\ : std_logic;
SIGNAL \timer_fsm|Add1~52_combout\ : std_logic;
SIGNAL \timer_fsm|s_counter[26]~11_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~53\ : std_logic;
SIGNAL \timer_fsm|Add1~54_combout\ : std_logic;
SIGNAL \timer_fsm|s_counter[27]~12_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~55\ : std_logic;
SIGNAL \timer_fsm|Add1~56_combout\ : std_logic;
SIGNAL \timer_fsm|s_counter[28]~13_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~57\ : std_logic;
SIGNAL \timer_fsm|Add1~58_combout\ : std_logic;
SIGNAL \timer_fsm|s_counter[29]~14_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~59\ : std_logic;
SIGNAL \timer_fsm|Add1~60_combout\ : std_logic;
SIGNAL \timer_fsm|Add0~48\ : std_logic;
SIGNAL \timer_fsm|Add0~49_combout\ : std_logic;
SIGNAL \timer_fsm|Add0~51_combout\ : std_logic;
SIGNAL \timer_fsm|Equal0~3_combout\ : std_logic;
SIGNAL \timer_fsm|Equal0~4_combout\ : std_logic;
SIGNAL \timer_fsm|Equal0~7_combout\ : std_logic;
SIGNAL \timer_fsm|Equal0~8_combout\ : std_logic;
SIGNAL \timer_fsm|Equal0~9_combout\ : std_logic;
SIGNAL \timer_fsm|s_cntZero~0_combout\ : std_logic;
SIGNAL \timer_fsm|s_cntZero~q\ : std_logic;
SIGNAL \main_fsm|s_currentState~14_combout\ : std_logic;
SIGNAL \main_fsm|s_currentState~13_combout\ : std_logic;
SIGNAL \main_fsm|s_currentState~15_combout\ : std_logic;
SIGNAL \main_fsm|s_currentState.PREP_SOLI~q\ : std_logic;
SIGNAL \main_fsm|WideOr18~0_combout\ : std_logic;
SIGNAL \main_fsm|WideOr19~0_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~0_combout\ : std_logic;
SIGNAL \clk_div_1hz|s_divCounter~10_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~1\ : std_logic;
SIGNAL \clk_div_1hz|Add0~2_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~3\ : std_logic;
SIGNAL \clk_div_1hz|Add0~4_combout\ : std_logic;
SIGNAL \clk_div_1hz|s_divCounter~9_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~5\ : std_logic;
SIGNAL \clk_div_1hz|Add0~6_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~7\ : std_logic;
SIGNAL \clk_div_1hz|Add0~8_combout\ : std_logic;
SIGNAL \clk_div_1hz|s_divCounter~8_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~9\ : std_logic;
SIGNAL \clk_div_1hz|Add0~10_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~11\ : std_logic;
SIGNAL \clk_div_1hz|Add0~12_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~13\ : std_logic;
SIGNAL \clk_div_1hz|Add0~14_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~15\ : std_logic;
SIGNAL \clk_div_1hz|Add0~16_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~17\ : std_logic;
SIGNAL \clk_div_1hz|Add0~18_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~19\ : std_logic;
SIGNAL \clk_div_1hz|Add0~20_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~21\ : std_logic;
SIGNAL \clk_div_1hz|Add0~22_combout\ : std_logic;
SIGNAL \clk_div_1hz|s_divCounter~7_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~23\ : std_logic;
SIGNAL \clk_div_1hz|Add0~24_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~25\ : std_logic;
SIGNAL \clk_div_1hz|Add0~26_combout\ : std_logic;
SIGNAL \clk_div_1hz|s_divCounter~6_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~27\ : std_logic;
SIGNAL \clk_div_1hz|Add0~28_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~29\ : std_logic;
SIGNAL \clk_div_1hz|Add0~30_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~31\ : std_logic;
SIGNAL \clk_div_1hz|Add0~32_combout\ : std_logic;
SIGNAL \clk_div_1hz|s_divCounter~5_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~33\ : std_logic;
SIGNAL \clk_div_1hz|Add0~34_combout\ : std_logic;
SIGNAL \clk_div_1hz|s_divCounter~4_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~35\ : std_logic;
SIGNAL \clk_div_1hz|Add0~36_combout\ : std_logic;
SIGNAL \clk_div_1hz|s_divCounter~3_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~37\ : std_logic;
SIGNAL \clk_div_1hz|Add0~38_combout\ : std_logic;
SIGNAL \clk_div_1hz|s_divCounter~2_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~39\ : std_logic;
SIGNAL \clk_div_1hz|Add0~40_combout\ : std_logic;
SIGNAL \clk_div_1hz|s_divCounter~1_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~41\ : std_logic;
SIGNAL \clk_div_1hz|Add0~42_combout\ : std_logic;
SIGNAL \clk_div_1hz|s_divCounter~0_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~43\ : std_logic;
SIGNAL \clk_div_1hz|Add0~44_combout\ : std_logic;
SIGNAL \clk_div_1hz|s_divCounter~11_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~45\ : std_logic;
SIGNAL \clk_div_1hz|Add0~46_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~47\ : std_logic;
SIGNAL \clk_div_1hz|Add0~48_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~49\ : std_logic;
SIGNAL \clk_div_1hz|Add0~50_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~51\ : std_logic;
SIGNAL \clk_div_1hz|Add0~52_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~53\ : std_logic;
SIGNAL \clk_div_1hz|Add0~54_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~55\ : std_logic;
SIGNAL \clk_div_1hz|Add0~56_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~57\ : std_logic;
SIGNAL \clk_div_1hz|Add0~58_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~59\ : std_logic;
SIGNAL \clk_div_1hz|Add0~60_combout\ : std_logic;
SIGNAL \clk_div_1hz|Equal0~8_combout\ : std_logic;
SIGNAL \clk_div_1hz|Equal0~7_combout\ : std_logic;
SIGNAL \clk_div_1hz|Equal0~9_combout\ : std_logic;
SIGNAL \clk_div_1hz|Equal0~5_combout\ : std_logic;
SIGNAL \clk_div_1hz|Equal0~2_combout\ : std_logic;
SIGNAL \clk_div_1hz|Equal0~3_combout\ : std_logic;
SIGNAL \clk_div_1hz|Equal0~0_combout\ : std_logic;
SIGNAL \clk_div_1hz|Equal0~1_combout\ : std_logic;
SIGNAL \clk_div_1hz|Equal0~4_combout\ : std_logic;
SIGNAL \clk_div_1hz|Equal0~10_combout\ : std_logic;
SIGNAL \clk_div_1hz|clkOut~1_combout\ : std_logic;
SIGNAL \clk_div_1hz|clkOut~0_combout\ : std_logic;
SIGNAL \clk_div_1hz|clkOut~2_combout\ : std_logic;
SIGNAL \clk_div_1hz|Equal0~6_combout\ : std_logic;
SIGNAL \clk_div_1hz|clkOut~3_combout\ : std_logic;
SIGNAL \clk_div_1hz|clkOut~q\ : std_logic;
SIGNAL \dec_word0|decOut_n[5]~0_combout\ : std_logic;
SIGNAL \main_fsm|WideOr17~combout\ : std_logic;
SIGNAL \dec_word0|decOut_n[0]~1_combout\ : std_logic;
SIGNAL \dec_word0|decOut_n[2]~2_combout\ : std_logic;
SIGNAL \dec_word0|decOut_n[4]~3_combout\ : std_logic;
SIGNAL \main_fsm|enable~0_combout\ : std_logic;
SIGNAL \main_fsm|WideOr16~0_combout\ : std_logic;
SIGNAL \main_fsm|WideOr15~0_combout\ : std_logic;
SIGNAL \dec_word1|Mux3~0_combout\ : std_logic;
SIGNAL \dec_word1|decOut_n[0]~2_combout\ : std_logic;
SIGNAL \dec_word1|decOut_n[1]~3_combout\ : std_logic;
SIGNAL \dec_word1|decOut_n[3]~5_combout\ : std_logic;
SIGNAL \dec_word1|decOut_n[6]~4_combout\ : std_logic;
SIGNAL \main_fsm|WideOr16~combout\ : std_logic;
SIGNAL \main_fsm|WideOr12~combout\ : std_logic;
SIGNAL \dec_word2|decOut_n[0]~4_combout\ : std_logic;
SIGNAL \dec_word2|decOut_n[2]~7_combout\ : std_logic;
SIGNAL \dec_word2|decOut_n[3]~8_combout\ : std_logic;
SIGNAL \dec_word2|decOut_n[5]~5_combout\ : std_logic;
SIGNAL \dec_word2|decOut_n[6]~6_combout\ : std_logic;
SIGNAL \main_fsm|WideOr10~combout\ : std_logic;
SIGNAL \dec_word3|decOut_n[0]~4_combout\ : std_logic;
SIGNAL \dec_word3|Mux5~0_combout\ : std_logic;
SIGNAL \dec_word3|decOut_n[1]~7_combout\ : std_logic;
SIGNAL \dec_word3|Mux4~0_combout\ : std_logic;
SIGNAL \dec_word3|decOut_n[2]~8_combout\ : std_logic;
SIGNAL \dec_word3|decOut_n[3]~5_combout\ : std_logic;
SIGNAL \dec_word3|decOut_n[4]~6_combout\ : std_logic;
SIGNAL \modoGelo_fsm|s_currentState~8_combout\ : std_logic;
SIGNAL \modoGelo_fsm|s_currentState.INICIO~q\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \debounceDiminuir_fsm|s_dirtyIn~q\ : std_logic;
SIGNAL \debounceDiminuir_fsm|s_previousIn~feeder_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|s_previousIn~q\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~0_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~1\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~2_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|s_debounceCnt~20_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~3\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~4_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|s_debounceCnt~21_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~5\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~6_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|s_debounceCnt~22_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~7\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~8_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|s_debounceCnt~23_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~9\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~10_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|s_debounceCnt~27_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~11\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~12_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|s_debounceCnt[21]~0_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|s_debounceCnt~1_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~13\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~14_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|s_debounceCnt~12_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~15\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~16_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|s_debounceCnt~13_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~17\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~18_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|s_debounceCnt~14_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~19\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~20_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|s_debounceCnt~15_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~21\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~22_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|s_debounceCnt~16_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|LessThan0~1_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~23\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~24_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|s_debounceCnt~8_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~25\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~26_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|s_debounceCnt~9_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~27\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~28_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|s_debounceCnt~17_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~29\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~30_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|s_debounceCnt~5_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~31\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~32_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|s_debounceCnt~6_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~33\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~34_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|s_debounceCnt~7_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~35\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~36_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|s_debounceCnt[18]~18_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|LessThan0~0_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|s_pulsedOut~5_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|LessThan0~2_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|LessThan0~3_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|LessThan0~4_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|LessThan0~5_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|LessThan0~6_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|LessThan0~7_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|s_debounceCnt[21]~4_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|s_debounceCnt~24_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|s_pulsedOut~2_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|s_pulsedOut~3_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|s_pulsedOut~0_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|s_pulsedOut~1_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|s_pulsedOut~4_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|s_debounceCnt[21]~2_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|s_debounceCnt[21]~3_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~37\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~38_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|s_debounceCnt[19]~19_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~39\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~40_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|s_debounceCnt[20]~10_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~41\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~42_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|s_debounceCnt[21]~11_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~43\ : std_logic;
SIGNAL \debounceDiminuir_fsm|Add0~44_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|s_debounceCnt[22]~25_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|s_debounceCnt[22]~26_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|s_pulsedOut~6_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|s_pulsedOut~7_combout\ : std_logic;
SIGNAL \debounceDiminuir_fsm|s_pulsedOut~q\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~0_combout\ : std_logic;
SIGNAL \KEY[1]~input_o\ : std_logic;
SIGNAL \debounceAumentar_fsm|s_dirtyIn~q\ : std_logic;
SIGNAL \debounceAumentar_fsm|s_previousIn~feeder_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|s_previousIn~q\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~3\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~4_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|s_debounceCnt~20_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~5\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~6_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|s_debounceCnt~21_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~7\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~8_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|s_debounceCnt~22_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~9\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~10_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|s_debounceCnt~27_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~11\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~12_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|s_debounceCnt~1_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~13\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~14_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|s_debounceCnt~11_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~15\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~16_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|s_debounceCnt~12_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~17\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~18_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|s_debounceCnt~13_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~19\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~20_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|s_debounceCnt~14_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|s_pulsedOut~2_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~21\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~22_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|s_debounceCnt~15_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~23\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~24_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|s_debounceCnt~7_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~25\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~26_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|s_debounceCnt~8_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~27\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~28_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|s_debounceCnt~16_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~29\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~30_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|s_debounceCnt~4_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~31\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~32_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|s_debounceCnt~5_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~33\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~34_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|s_debounceCnt~6_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~35\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~36_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|s_debounceCnt[18]~17_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~37\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~38_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|s_debounceCnt[19]~18_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|s_pulsedOut~3_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~39\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~41\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~42_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|s_debounceCnt[21]~10_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|s_pulsedOut~1_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|s_pulsedOut~0_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|s_pulsedOut~4_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|s_debounceCnt[5]~2_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|LessThan0~6_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|LessThan0~4_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|LessThan0~5_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|LessThan0~1_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|LessThan0~2_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|LessThan0~3_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|LessThan0~7_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|s_debounceCnt[22]~24_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|s_debounceCnt[22]~25_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~43\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~44_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|s_debounceCnt[22]~26_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|s_debounceCnt[5]~3_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~40_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|s_debounceCnt[20]~9_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|LessThan0~0_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|s_debounceCnt[5]~0_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|s_debounceCnt~23_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~1\ : std_logic;
SIGNAL \debounceAumentar_fsm|Add0~2_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|s_debounceCnt~19_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|s_pulsedOut~5_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|s_pulsedOut~6_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|s_pulsedOut~7_combout\ : std_logic;
SIGNAL \debounceAumentar_fsm|s_pulsedOut~q\ : std_logic;
SIGNAL \modoGelo_fsm|comb_proc~0_combout\ : std_logic;
SIGNAL \modoGelo_fsm|Selector4~0_combout\ : std_logic;
SIGNAL \modoGelo_fsm|Selector4~1_combout\ : std_logic;
SIGNAL \modoGelo_fsm|s_currentState.QUATROCUBOS~q\ : std_logic;
SIGNAL \modoGelo_fsm|Selector3~0_combout\ : std_logic;
SIGNAL \modoGelo_fsm|Selector3~1_combout\ : std_logic;
SIGNAL \modoGelo_fsm|Selector3~2_combout\ : std_logic;
SIGNAL \modoGelo_fsm|s_currentState.TRESCUBOS~q\ : std_logic;
SIGNAL \modoGelo_fsm|Selector0~0_combout\ : std_logic;
SIGNAL \modoGelo_fsm|Selector0~1_combout\ : std_logic;
SIGNAL \modoGelo_fsm|Selector0~2_combout\ : std_logic;
SIGNAL \modoGelo_fsm|s_currentState.DOISCUBOS~q\ : std_logic;
SIGNAL \modoGelo_fsm|Selector1~0_combout\ : std_logic;
SIGNAL \modoGelo_fsm|Selector1~1_combout\ : std_logic;
SIGNAL \modoGelo_fsm|s_currentState.UMCUBO~q\ : std_logic;
SIGNAL \modoGelo_fsm|s_currentState~9_combout\ : std_logic;
SIGNAL \modoGelo_fsm|s_currentState~10_combout\ : std_logic;
SIGNAL \modoGelo_fsm|s_currentState.ZEROCUBOS~q\ : std_logic;
SIGNAL \modoGelo_fsm|WideOr4~0_combout\ : std_logic;
SIGNAL \modoGelo_fsm|WideOr4~combout\ : std_logic;
SIGNAL \register_fsm|dataOut\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \timer_fsm|s_counter\ : std_logic_vector(30 DOWNTO 0);
SIGNAL \modoGelo_fsm|enable\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk_div_1hz|s_divCounter\ : std_logic_vector(30 DOWNTO 0);
SIGNAL \debounceDiminuir_fsm|s_debounceCnt\ : std_logic_vector(22 DOWNTO 0);
SIGNAL \debounceAumentar_fsm|s_debounceCnt\ : std_logic_vector(22 DOWNTO 0);
SIGNAL \modoGelo_fsm|ALT_INV_enable\ : std_logic_vector(2 DOWNTO 2);
SIGNAL \modoGelo_fsm|ALT_INV_WideOr4~0_combout\ : std_logic;
SIGNAL \main_fsm|ALT_INV_enable~0_combout\ : std_logic;
SIGNAL \dec_word0|ALT_INV_decOut_n[5]~0_combout\ : std_logic;
SIGNAL \main_fsm|ALT_INV_WideOr19~0_combout\ : std_logic;
SIGNAL \modoGelo_fsm|ALT_INV_s_currentState.QUATROCUBOS~q\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_CLOCK_50 <= CLOCK_50;
ww_KEY <= KEY;
ww_SW <= SW;
LEDR <= ww_LEDR;
LEDG <= ww_LEDG;
HEX0 <= ww_HEX0;
HEX1 <= ww_HEX1;
HEX2 <= ww_HEX2;
HEX3 <= ww_HEX3;
HEX4 <= ww_HEX4;
HEX5 <= ww_HEX5;
HEX6 <= ww_HEX6;
HEX7 <= ww_HEX7;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\CLOCK_50~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLOCK_50~input_o\);
\modoGelo_fsm|ALT_INV_enable\(2) <= NOT \modoGelo_fsm|enable\(2);
\modoGelo_fsm|ALT_INV_WideOr4~0_combout\ <= NOT \modoGelo_fsm|WideOr4~0_combout\;
\main_fsm|ALT_INV_enable~0_combout\ <= NOT \main_fsm|enable~0_combout\;
\dec_word0|ALT_INV_decOut_n[5]~0_combout\ <= NOT \dec_word0|decOut_n[5]~0_combout\;
\main_fsm|ALT_INV_WideOr19~0_combout\ <= NOT \main_fsm|WideOr19~0_combout\;
\modoGelo_fsm|ALT_INV_s_currentState.QUATROCUBOS~q\ <= NOT \modoGelo_fsm|s_currentState.QUATROCUBOS~q\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X69_Y73_N16
\LEDR[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \main_fsm|WideOr18~0_combout\,
	devoe => ww_devoe,
	o => \LEDR[0]~output_o\);

-- Location: IOOBUF_X107_Y73_N9
\LEDG[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \main_fsm|ALT_INV_WideOr19~0_combout\,
	devoe => ww_devoe,
	o => \LEDG[0]~output_o\);

-- Location: IOOBUF_X69_Y73_N23
\HEX0[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dec_word0|decOut_n[0]~1_combout\,
	devoe => ww_devoe,
	o => \HEX0[0]~output_o\);

-- Location: IOOBUF_X107_Y73_N23
\HEX0[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX0[1]~output_o\);

-- Location: IOOBUF_X67_Y73_N23
\HEX0[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dec_word0|decOut_n[2]~2_combout\,
	devoe => ww_devoe,
	o => \HEX0[2]~output_o\);

-- Location: IOOBUF_X115_Y50_N2
\HEX0[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dec_word0|decOut_n[2]~2_combout\,
	devoe => ww_devoe,
	o => \HEX0[3]~output_o\);

-- Location: IOOBUF_X115_Y54_N16
\HEX0[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dec_word0|decOut_n[4]~3_combout\,
	devoe => ww_devoe,
	o => \HEX0[4]~output_o\);

-- Location: IOOBUF_X115_Y67_N16
\HEX0[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dec_word0|ALT_INV_decOut_n[5]~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[5]~output_o\);

-- Location: IOOBUF_X115_Y69_N2
\HEX0[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dec_word0|decOut_n[0]~1_combout\,
	devoe => ww_devoe,
	o => \HEX0[6]~output_o\);

-- Location: IOOBUF_X115_Y41_N2
\HEX1[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dec_word1|decOut_n[0]~2_combout\,
	devoe => ww_devoe,
	o => \HEX1[0]~output_o\);

-- Location: IOOBUF_X115_Y30_N9
\HEX1[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dec_word1|decOut_n[1]~3_combout\,
	devoe => ww_devoe,
	o => \HEX1[1]~output_o\);

-- Location: IOOBUF_X115_Y25_N23
\HEX1[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dec_word1|decOut_n[1]~3_combout\,
	devoe => ww_devoe,
	o => \HEX1[2]~output_o\);

-- Location: IOOBUF_X115_Y30_N2
\HEX1[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dec_word1|decOut_n[3]~5_combout\,
	devoe => ww_devoe,
	o => \HEX1[3]~output_o\);

-- Location: IOOBUF_X115_Y20_N9
\HEX1[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \main_fsm|ALT_INV_enable~0_combout\,
	devoe => ww_devoe,
	o => \HEX1[4]~output_o\);

-- Location: IOOBUF_X115_Y22_N2
\HEX1[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \main_fsm|ALT_INV_enable~0_combout\,
	devoe => ww_devoe,
	o => \HEX1[5]~output_o\);

-- Location: IOOBUF_X115_Y28_N9
\HEX1[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dec_word1|decOut_n[6]~4_combout\,
	devoe => ww_devoe,
	o => \HEX1[6]~output_o\);

-- Location: IOOBUF_X115_Y17_N9
\HEX2[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dec_word2|decOut_n[0]~4_combout\,
	devoe => ww_devoe,
	o => \HEX2[0]~output_o\);

-- Location: IOOBUF_X115_Y16_N2
\HEX2[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dec_word2|decOut_n[0]~4_combout\,
	devoe => ww_devoe,
	o => \HEX2[1]~output_o\);

-- Location: IOOBUF_X115_Y19_N9
\HEX2[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dec_word2|decOut_n[2]~7_combout\,
	devoe => ww_devoe,
	o => \HEX2[2]~output_o\);

-- Location: IOOBUF_X115_Y19_N2
\HEX2[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dec_word2|decOut_n[3]~8_combout\,
	devoe => ww_devoe,
	o => \HEX2[3]~output_o\);

-- Location: IOOBUF_X115_Y18_N2
\HEX2[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \main_fsm|ALT_INV_enable~0_combout\,
	devoe => ww_devoe,
	o => \HEX2[4]~output_o\);

-- Location: IOOBUF_X115_Y20_N2
\HEX2[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dec_word2|decOut_n[5]~5_combout\,
	devoe => ww_devoe,
	o => \HEX2[5]~output_o\);

-- Location: IOOBUF_X115_Y21_N16
\HEX2[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dec_word2|decOut_n[6]~6_combout\,
	devoe => ww_devoe,
	o => \HEX2[6]~output_o\);

-- Location: IOOBUF_X115_Y25_N16
\HEX3[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dec_word3|decOut_n[0]~4_combout\,
	devoe => ww_devoe,
	o => \HEX3[0]~output_o\);

-- Location: IOOBUF_X115_Y29_N2
\HEX3[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dec_word3|decOut_n[1]~7_combout\,
	devoe => ww_devoe,
	o => \HEX3[1]~output_o\);

-- Location: IOOBUF_X100_Y0_N2
\HEX3[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dec_word3|decOut_n[2]~8_combout\,
	devoe => ww_devoe,
	o => \HEX3[2]~output_o\);

-- Location: IOOBUF_X111_Y0_N2
\HEX3[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dec_word3|decOut_n[3]~5_combout\,
	devoe => ww_devoe,
	o => \HEX3[3]~output_o\);

-- Location: IOOBUF_X105_Y0_N23
\HEX3[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dec_word3|decOut_n[4]~6_combout\,
	devoe => ww_devoe,
	o => \HEX3[4]~output_o\);

-- Location: IOOBUF_X105_Y0_N9
\HEX3[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \main_fsm|ALT_INV_enable~0_combout\,
	devoe => ww_devoe,
	o => \HEX3[5]~output_o\);

-- Location: IOOBUF_X105_Y0_N2
\HEX3[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \main_fsm|ALT_INV_enable~0_combout\,
	devoe => ww_devoe,
	o => \HEX3[6]~output_o\);

-- Location: IOOBUF_X98_Y0_N23
\HEX4[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \modoGelo_fsm|ALT_INV_WideOr4~0_combout\,
	devoe => ww_devoe,
	o => \HEX4[0]~output_o\);

-- Location: IOOBUF_X107_Y0_N9
\HEX4[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \modoGelo_fsm|ALT_INV_WideOr4~0_combout\,
	devoe => ww_devoe,
	o => \HEX4[1]~output_o\);

-- Location: IOOBUF_X74_Y0_N9
\HEX4[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \modoGelo_fsm|ALT_INV_WideOr4~0_combout\,
	devoe => ww_devoe,
	o => \HEX4[2]~output_o\);

-- Location: IOOBUF_X74_Y0_N2
\HEX4[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \modoGelo_fsm|ALT_INV_WideOr4~0_combout\,
	devoe => ww_devoe,
	o => \HEX4[3]~output_o\);

-- Location: IOOBUF_X83_Y0_N23
\HEX4[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \modoGelo_fsm|ALT_INV_WideOr4~0_combout\,
	devoe => ww_devoe,
	o => \HEX4[4]~output_o\);

-- Location: IOOBUF_X83_Y0_N16
\HEX4[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \modoGelo_fsm|ALT_INV_WideOr4~0_combout\,
	devoe => ww_devoe,
	o => \HEX4[5]~output_o\);

-- Location: IOOBUF_X79_Y0_N23
\HEX4[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX4[6]~output_o\);

-- Location: IOOBUF_X85_Y0_N9
\HEX5[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \modoGelo_fsm|WideOr4~combout\,
	devoe => ww_devoe,
	o => \HEX5[0]~output_o\);

-- Location: IOOBUF_X87_Y0_N16
\HEX5[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \modoGelo_fsm|WideOr4~combout\,
	devoe => ww_devoe,
	o => \HEX5[1]~output_o\);

-- Location: IOOBUF_X98_Y0_N16
\HEX5[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \modoGelo_fsm|WideOr4~combout\,
	devoe => ww_devoe,
	o => \HEX5[2]~output_o\);

-- Location: IOOBUF_X72_Y0_N2
\HEX5[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \modoGelo_fsm|WideOr4~combout\,
	devoe => ww_devoe,
	o => \HEX5[3]~output_o\);

-- Location: IOOBUF_X72_Y0_N9
\HEX5[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \modoGelo_fsm|WideOr4~combout\,
	devoe => ww_devoe,
	o => \HEX5[4]~output_o\);

-- Location: IOOBUF_X79_Y0_N16
\HEX5[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \modoGelo_fsm|WideOr4~combout\,
	devoe => ww_devoe,
	o => \HEX5[5]~output_o\);

-- Location: IOOBUF_X69_Y0_N2
\HEX5[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX5[6]~output_o\);

-- Location: IOOBUF_X89_Y0_N23
\HEX6[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \modoGelo_fsm|ALT_INV_enable\(2),
	devoe => ww_devoe,
	o => \HEX6[0]~output_o\);

-- Location: IOOBUF_X65_Y0_N2
\HEX6[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \modoGelo_fsm|ALT_INV_enable\(2),
	devoe => ww_devoe,
	o => \HEX6[1]~output_o\);

-- Location: IOOBUF_X65_Y0_N9
\HEX6[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \modoGelo_fsm|ALT_INV_enable\(2),
	devoe => ww_devoe,
	o => \HEX6[2]~output_o\);

-- Location: IOOBUF_X89_Y0_N16
\HEX6[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \modoGelo_fsm|ALT_INV_enable\(2),
	devoe => ww_devoe,
	o => \HEX6[3]~output_o\);

-- Location: IOOBUF_X67_Y0_N16
\HEX6[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \modoGelo_fsm|ALT_INV_enable\(2),
	devoe => ww_devoe,
	o => \HEX6[4]~output_o\);

-- Location: IOOBUF_X67_Y0_N23
\HEX6[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \modoGelo_fsm|ALT_INV_enable\(2),
	devoe => ww_devoe,
	o => \HEX6[5]~output_o\);

-- Location: IOOBUF_X74_Y0_N23
\HEX6[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX6[6]~output_o\);

-- Location: IOOBUF_X74_Y0_N16
\HEX7[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \modoGelo_fsm|ALT_INV_s_currentState.QUATROCUBOS~q\,
	devoe => ww_devoe,
	o => \HEX7[0]~output_o\);

-- Location: IOOBUF_X67_Y0_N9
\HEX7[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \modoGelo_fsm|ALT_INV_s_currentState.QUATROCUBOS~q\,
	devoe => ww_devoe,
	o => \HEX7[1]~output_o\);

-- Location: IOOBUF_X62_Y0_N23
\HEX7[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \modoGelo_fsm|ALT_INV_s_currentState.QUATROCUBOS~q\,
	devoe => ww_devoe,
	o => \HEX7[2]~output_o\);

-- Location: IOOBUF_X62_Y0_N16
\HEX7[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \modoGelo_fsm|ALT_INV_s_currentState.QUATROCUBOS~q\,
	devoe => ww_devoe,
	o => \HEX7[3]~output_o\);

-- Location: IOOBUF_X67_Y0_N2
\HEX7[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \modoGelo_fsm|ALT_INV_s_currentState.QUATROCUBOS~q\,
	devoe => ww_devoe,
	o => \HEX7[4]~output_o\);

-- Location: IOOBUF_X69_Y0_N9
\HEX7[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \modoGelo_fsm|ALT_INV_s_currentState.QUATROCUBOS~q\,
	devoe => ww_devoe,
	o => \HEX7[5]~output_o\);

-- Location: IOOBUF_X54_Y0_N23
\HEX7[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX7[6]~output_o\);

-- Location: IOIBUF_X0_Y36_N15
\CLOCK_50~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50,
	o => \CLOCK_50~input_o\);

-- Location: CLKCTRL_G4
\CLOCK_50~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLOCK_50~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLOCK_50~inputclkctrl_outclk\);

-- Location: IOIBUF_X115_Y15_N8
\SW[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(2),
	o => \SW[2]~input_o\);

-- Location: FF_X108_Y19_N5
\register_fsm|dataOut[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[2]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \register_fsm|dataOut\(2));

-- Location: IOIBUF_X115_Y18_N8
\SW[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(4),
	o => \SW[4]~input_o\);

-- Location: FF_X108_Y19_N23
\register_fsm|dataOut[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[4]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \register_fsm|dataOut\(4));

-- Location: IOIBUF_X115_Y17_N1
\SW[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

-- Location: FF_X109_Y19_N27
\register_fsm|dataOut[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \register_fsm|dataOut\(0));

-- Location: LCCOMB_X109_Y19_N0
\main_fsm|s_currentState.START~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|s_currentState.START~0_combout\ = !\register_fsm|dataOut\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \register_fsm|dataOut\(0),
	combout => \main_fsm|s_currentState.START~0_combout\);

-- Location: FF_X109_Y19_N1
\main_fsm|s_currentState.START\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \main_fsm|s_currentState.START~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \main_fsm|s_currentState.START~q\);

-- Location: IOIBUF_X115_Y14_N1
\SW[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(1),
	o => \SW[1]~input_o\);

-- Location: FF_X108_Y19_N27
\register_fsm|dataOut[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[1]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \register_fsm|dataOut\(1));

-- Location: IOIBUF_X115_Y13_N8
\SW[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(3),
	o => \SW[3]~input_o\);

-- Location: FF_X108_Y19_N25
\register_fsm|dataOut[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[3]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \register_fsm|dataOut\(3));

-- Location: LCCOMB_X108_Y19_N18
\main_fsm|Selector2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|Selector2~0_combout\ = (!\register_fsm|dataOut\(2) & (!\register_fsm|dataOut\(1) & !\register_fsm|dataOut\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \register_fsm|dataOut\(2),
	datac => \register_fsm|dataOut\(1),
	datad => \register_fsm|dataOut\(3),
	combout => \main_fsm|Selector2~0_combout\);

-- Location: LCCOMB_X108_Y19_N12
\main_fsm|s_currentState~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|s_currentState~17_combout\ = (!\register_fsm|dataOut\(1) & (!\register_fsm|dataOut\(2) & (\main_fsm|s_currentState.EREF~q\ & \register_fsm|dataOut\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \register_fsm|dataOut\(1),
	datab => \register_fsm|dataOut\(2),
	datac => \main_fsm|s_currentState.EREF~q\,
	datad => \register_fsm|dataOut\(3),
	combout => \main_fsm|s_currentState~17_combout\);

-- Location: LCCOMB_X108_Y19_N14
\main_fsm|s_currentState~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|s_currentState~16_combout\ = (\main_fsm|s_currentState.PREP_SPES~q\ & ((\register_fsm|dataOut\(4)) # ((\register_fsm|dataOut\(3) & !\timer_fsm|s_cntZero~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \register_fsm|dataOut\(4),
	datab => \register_fsm|dataOut\(3),
	datac => \main_fsm|s_currentState.PREP_SPES~q\,
	datad => \timer_fsm|s_cntZero~q\,
	combout => \main_fsm|s_currentState~16_combout\);

-- Location: LCCOMB_X108_Y19_N8
\main_fsm|s_currentState~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|s_currentState~18_combout\ = (!\register_fsm|dataOut\(0) & ((\main_fsm|s_currentState~17_combout\) # (\main_fsm|s_currentState~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_currentState~17_combout\,
	datac => \main_fsm|s_currentState~16_combout\,
	datad => \register_fsm|dataOut\(0),
	combout => \main_fsm|s_currentState~18_combout\);

-- Location: FF_X108_Y19_N9
\main_fsm|s_currentState.PREP_SPES\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \main_fsm|s_currentState~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \main_fsm|s_currentState.PREP_SPES~q\);

-- Location: LCCOMB_X108_Y19_N28
\main_fsm|s_currentState~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|s_currentState~23_combout\ = (\main_fsm|s_currentState.PREP_SPES~q\ & (!\register_fsm|dataOut\(4) & \timer_fsm|s_cntZero~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \main_fsm|s_currentState.PREP_SPES~q\,
	datac => \register_fsm|dataOut\(4),
	datad => \timer_fsm|s_cntZero~q\,
	combout => \main_fsm|s_currentState~23_combout\);

-- Location: LCCOMB_X108_Y19_N16
\main_fsm|s_currentState~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|s_currentState~24_combout\ = (!\register_fsm|dataOut\(0) & ((\main_fsm|s_currentState~23_combout\) # ((!\main_fsm|Selector2~0_combout\ & \main_fsm|s_currentState.DIS_SPES~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|Selector2~0_combout\,
	datab => \main_fsm|s_currentState~23_combout\,
	datac => \main_fsm|s_currentState.DIS_SPES~q\,
	datad => \register_fsm|dataOut\(0),
	combout => \main_fsm|s_currentState~24_combout\);

-- Location: FF_X108_Y19_N17
\main_fsm|s_currentState.DIS_SPES\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \main_fsm|s_currentState~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \main_fsm|s_currentState.DIS_SPES~q\);

-- Location: LCCOMB_X108_Y19_N20
\main_fsm|s_currentState~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|s_currentState~11_combout\ = (\register_fsm|dataOut\(1) & ((\main_fsm|s_currentState.EREF~q\) # ((\main_fsm|s_currentState.PREP_FAN~q\ & !\timer_fsm|s_cntZero~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \register_fsm|dataOut\(1),
	datab => \main_fsm|s_currentState.PREP_FAN~q\,
	datac => \main_fsm|s_currentState.EREF~q\,
	datad => \timer_fsm|s_cntZero~q\,
	combout => \main_fsm|s_currentState~11_combout\);

-- Location: LCCOMB_X108_Y19_N0
\main_fsm|s_currentState~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|s_currentState~12_combout\ = (!\register_fsm|dataOut\(0) & ((\main_fsm|s_currentState~11_combout\) # ((\register_fsm|dataOut\(4) & \main_fsm|s_currentState.PREP_FAN~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \register_fsm|dataOut\(4),
	datab => \main_fsm|s_currentState~11_combout\,
	datac => \main_fsm|s_currentState.PREP_FAN~q\,
	datad => \register_fsm|dataOut\(0),
	combout => \main_fsm|s_currentState~12_combout\);

-- Location: FF_X108_Y19_N1
\main_fsm|s_currentState.PREP_FAN\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \main_fsm|s_currentState~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \main_fsm|s_currentState.PREP_FAN~q\);

-- Location: LCCOMB_X109_Y19_N2
\main_fsm|s_currentState~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|s_currentState~19_combout\ = (\main_fsm|s_currentState.PREP_FAN~q\ & (!\register_fsm|dataOut\(4) & \timer_fsm|s_cntZero~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_currentState.PREP_FAN~q\,
	datab => \register_fsm|dataOut\(4),
	datac => \timer_fsm|s_cntZero~q\,
	combout => \main_fsm|s_currentState~19_combout\);

-- Location: LCCOMB_X109_Y19_N28
\main_fsm|s_currentState~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|s_currentState~20_combout\ = (!\register_fsm|dataOut\(0) & ((\main_fsm|s_currentState~19_combout\) # ((\main_fsm|s_currentState.DIS_FAN~q\ & !\main_fsm|Selector2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \register_fsm|dataOut\(0),
	datab => \main_fsm|s_currentState~19_combout\,
	datac => \main_fsm|s_currentState.DIS_FAN~q\,
	datad => \main_fsm|Selector2~0_combout\,
	combout => \main_fsm|s_currentState~20_combout\);

-- Location: FF_X109_Y19_N29
\main_fsm|s_currentState.DIS_FAN\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \main_fsm|s_currentState~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \main_fsm|s_currentState.DIS_FAN~q\);

-- Location: LCCOMB_X109_Y19_N12
\main_fsm|s_currentState~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|s_currentState~21_combout\ = (\main_fsm|s_currentState.PREP_SOLI~q\ & (!\register_fsm|dataOut\(4) & \timer_fsm|s_cntZero~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_currentState.PREP_SOLI~q\,
	datab => \register_fsm|dataOut\(4),
	datac => \timer_fsm|s_cntZero~q\,
	combout => \main_fsm|s_currentState~21_combout\);

-- Location: LCCOMB_X109_Y19_N6
\main_fsm|s_currentState~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|s_currentState~22_combout\ = (!\register_fsm|dataOut\(0) & ((\main_fsm|s_currentState~21_combout\) # ((!\main_fsm|Selector2~0_combout\ & \main_fsm|s_currentState.DIS_SOLI~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \register_fsm|dataOut\(0),
	datab => \main_fsm|Selector2~0_combout\,
	datac => \main_fsm|s_currentState.DIS_SOLI~q\,
	datad => \main_fsm|s_currentState~21_combout\,
	combout => \main_fsm|s_currentState~22_combout\);

-- Location: FF_X109_Y19_N7
\main_fsm|s_currentState.DIS_SOLI\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \main_fsm|s_currentState~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \main_fsm|s_currentState.DIS_SOLI~q\);

-- Location: LCCOMB_X109_Y19_N24
\main_fsm|Selector2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|Selector2~4_combout\ = (\main_fsm|s_currentState.DIS_SPES~q\) # ((\main_fsm|s_currentState.DIS_FAN~q\) # ((\main_fsm|s_currentState.EREF~q\) # (\main_fsm|s_currentState.DIS_SOLI~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_currentState.DIS_SPES~q\,
	datab => \main_fsm|s_currentState.DIS_FAN~q\,
	datac => \main_fsm|s_currentState.EREF~q\,
	datad => \main_fsm|s_currentState.DIS_SOLI~q\,
	combout => \main_fsm|Selector2~4_combout\);

-- Location: LCCOMB_X108_Y19_N26
\main_fsm|Selector2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|Selector2~1_combout\ = (\main_fsm|s_currentState.PREP_SOLI~q\ & (((!\register_fsm|dataOut\(1) & \main_fsm|s_currentState.PREP_FAN~q\)) # (!\register_fsm|dataOut\(2)))) # (!\main_fsm|s_currentState.PREP_SOLI~q\ & (((!\register_fsm|dataOut\(1) & 
-- \main_fsm|s_currentState.PREP_FAN~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010111100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_currentState.PREP_SOLI~q\,
	datab => \register_fsm|dataOut\(2),
	datac => \register_fsm|dataOut\(1),
	datad => \main_fsm|s_currentState.PREP_FAN~q\,
	combout => \main_fsm|Selector2~1_combout\);

-- Location: LCCOMB_X108_Y19_N24
\main_fsm|Selector2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|Selector2~2_combout\ = (\main_fsm|Selector2~1_combout\) # ((\main_fsm|s_currentState.PREP_SPES~q\ & !\register_fsm|dataOut\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \main_fsm|s_currentState.PREP_SPES~q\,
	datac => \register_fsm|dataOut\(3),
	datad => \main_fsm|Selector2~1_combout\,
	combout => \main_fsm|Selector2~2_combout\);

-- Location: LCCOMB_X109_Y19_N16
\main_fsm|s_currentState~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|s_currentState~26_combout\ = (!\register_fsm|dataOut\(0) & (((!\timer_fsm|s_cntZero~q\ & \main_fsm|s_currentState.START_DONE~q\)) # (!\main_fsm|s_currentState.START~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \register_fsm|dataOut\(0),
	datab => \timer_fsm|s_cntZero~q\,
	datac => \main_fsm|s_currentState.START_DONE~q\,
	datad => \main_fsm|s_currentState.START~q\,
	combout => \main_fsm|s_currentState~26_combout\);

-- Location: FF_X109_Y19_N17
\main_fsm|s_currentState.START_DONE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \main_fsm|s_currentState~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \main_fsm|s_currentState.START_DONE~q\);

-- Location: LCCOMB_X109_Y19_N14
\main_fsm|Selector2~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|Selector2~3_combout\ = (\timer_fsm|s_cntZero~q\ & (((\main_fsm|s_currentState.START_DONE~q\)))) # (!\timer_fsm|s_cntZero~q\ & (\main_fsm|Selector2~2_combout\ & (!\register_fsm|dataOut\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|Selector2~2_combout\,
	datab => \register_fsm|dataOut\(4),
	datac => \timer_fsm|s_cntZero~q\,
	datad => \main_fsm|s_currentState.START_DONE~q\,
	combout => \main_fsm|Selector2~3_combout\);

-- Location: LCCOMB_X109_Y19_N30
\main_fsm|s_currentState~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|s_currentState~25_combout\ = (!\register_fsm|dataOut\(0) & ((\main_fsm|Selector2~3_combout\) # ((\main_fsm|Selector2~4_combout\ & \main_fsm|Selector2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \register_fsm|dataOut\(0),
	datab => \main_fsm|Selector2~4_combout\,
	datac => \main_fsm|Selector2~3_combout\,
	datad => \main_fsm|Selector2~0_combout\,
	combout => \main_fsm|s_currentState~25_combout\);

-- Location: FF_X109_Y19_N31
\main_fsm|s_currentState.EREF\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \main_fsm|s_currentState~25_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \main_fsm|s_currentState.EREF~q\);

-- Location: LCCOMB_X109_Y19_N10
\main_fsm|Selector1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|Selector1~0_combout\ = ((\main_fsm|s_currentState.EREF~q\ & !\main_fsm|Selector2~0_combout\)) # (!\main_fsm|s_currentState.START~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \main_fsm|s_currentState.START~q\,
	datac => \main_fsm|s_currentState.EREF~q\,
	datad => \main_fsm|Selector2~0_combout\,
	combout => \main_fsm|Selector1~0_combout\);

-- Location: LCCOMB_X108_Y19_N2
\main_fsm|selModoGelo~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|selModoGelo~0_combout\ = (\register_fsm|dataOut\(4) & ((\main_fsm|s_currentState.PREP_FAN~q\) # ((\main_fsm|s_currentState.PREP_SPES~q\) # (\main_fsm|s_currentState.PREP_SOLI~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \register_fsm|dataOut\(4),
	datab => \main_fsm|s_currentState.PREP_FAN~q\,
	datac => \main_fsm|s_currentState.PREP_SPES~q\,
	datad => \main_fsm|s_currentState.PREP_SOLI~q\,
	combout => \main_fsm|selModoGelo~0_combout\);

-- Location: LCCOMB_X110_Y19_N6
\timer_fsm|Mult0|mult_core|_~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Mult0|mult_core|_~1_combout\ = (\main_fsm|s_currentState.START~q\ & \main_fsm|s_currentState.EREF~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \main_fsm|s_currentState.START~q\,
	datad => \main_fsm|s_currentState.EREF~q\,
	combout => \timer_fsm|Mult0|mult_core|_~1_combout\);

-- Location: LCCOMB_X110_Y19_N8
\main_fsm|WideOr10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|WideOr10~0_combout\ = (\main_fsm|s_currentState.START~q\ & !\main_fsm|s_currentState.EREF~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \main_fsm|s_currentState.START~q\,
	datad => \main_fsm|s_currentState.EREF~q\,
	combout => \main_fsm|WideOr10~0_combout\);

-- Location: LCCOMB_X110_Y19_N4
\timer_fsm|Mult0|mult_core|romout[0][28]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Mult0|mult_core|romout[0][28]~0_combout\ = \main_fsm|s_currentState.START~q\ $ (\main_fsm|s_currentState.EREF~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \main_fsm|s_currentState.START~q\,
	datad => \main_fsm|s_currentState.EREF~q\,
	combout => \timer_fsm|Mult0|mult_core|romout[0][28]~0_combout\);

-- Location: LCCOMB_X110_Y19_N10
\timer_fsm|Add0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add0~1_cout\ = CARRY(!\main_fsm|s_currentState.START~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_currentState.START~q\,
	datad => VCC,
	cout => \timer_fsm|Add0~1_cout\);

-- Location: LCCOMB_X110_Y19_N12
\timer_fsm|Add0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add0~3_cout\ = CARRY((\main_fsm|s_currentState.START~q\ & !\timer_fsm|Add0~1_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_currentState.START~q\,
	datad => VCC,
	cin => \timer_fsm|Add0~1_cout\,
	cout => \timer_fsm|Add0~3_cout\);

-- Location: LCCOMB_X110_Y19_N14
\timer_fsm|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add0~4_combout\ = (\main_fsm|s_currentState.EREF~q\ & ((GND) # (!\timer_fsm|Add0~3_cout\))) # (!\main_fsm|s_currentState.EREF~q\ & (\timer_fsm|Add0~3_cout\ $ (GND)))
-- \timer_fsm|Add0~5\ = CARRY((\main_fsm|s_currentState.EREF~q\) # (!\timer_fsm|Add0~3_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \main_fsm|s_currentState.EREF~q\,
	datad => VCC,
	cin => \timer_fsm|Add0~3_cout\,
	combout => \timer_fsm|Add0~4_combout\,
	cout => \timer_fsm|Add0~5\);

-- Location: LCCOMB_X110_Y19_N16
\timer_fsm|Add0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add0~7_combout\ = !\timer_fsm|Add0~5\
-- \timer_fsm|Add0~8\ = CARRY(!\timer_fsm|Add0~5\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => VCC,
	cin => \timer_fsm|Add0~5\,
	combout => \timer_fsm|Add0~7_combout\,
	cout => \timer_fsm|Add0~8\);

-- Location: LCCOMB_X110_Y19_N18
\timer_fsm|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add0~10_combout\ = \timer_fsm|Add0~8\ $ (GND)
-- \timer_fsm|Add0~11\ = CARRY(!\timer_fsm|Add0~8\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => VCC,
	cin => \timer_fsm|Add0~8\,
	combout => \timer_fsm|Add0~10_combout\,
	cout => \timer_fsm|Add0~11\);

-- Location: LCCOMB_X110_Y19_N20
\timer_fsm|Add0~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add0~13_combout\ = (\main_fsm|s_currentState.START~q\ & (!\timer_fsm|Add0~11\)) # (!\main_fsm|s_currentState.START~q\ & (\timer_fsm|Add0~11\ & VCC))
-- \timer_fsm|Add0~14\ = CARRY((\main_fsm|s_currentState.START~q\ & !\timer_fsm|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_currentState.START~q\,
	datad => VCC,
	cin => \timer_fsm|Add0~11\,
	combout => \timer_fsm|Add0~13_combout\,
	cout => \timer_fsm|Add0~14\);

-- Location: LCCOMB_X110_Y19_N22
\timer_fsm|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add0~16_combout\ = \timer_fsm|Add0~14\ $ (GND)
-- \timer_fsm|Add0~17\ = CARRY(!\timer_fsm|Add0~14\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => VCC,
	cin => \timer_fsm|Add0~14\,
	combout => \timer_fsm|Add0~16_combout\,
	cout => \timer_fsm|Add0~17\);

-- Location: LCCOMB_X110_Y19_N24
\timer_fsm|Add0~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add0~19_combout\ = (\timer_fsm|Mult0|mult_core|romout[0][28]~0_combout\ & (!\timer_fsm|Add0~17\)) # (!\timer_fsm|Mult0|mult_core|romout[0][28]~0_combout\ & (\timer_fsm|Add0~17\ & VCC))
-- \timer_fsm|Add0~20\ = CARRY((\timer_fsm|Mult0|mult_core|romout[0][28]~0_combout\ & !\timer_fsm|Add0~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \timer_fsm|Mult0|mult_core|romout[0][28]~0_combout\,
	datad => VCC,
	cin => \timer_fsm|Add0~17\,
	combout => \timer_fsm|Add0~19_combout\,
	cout => \timer_fsm|Add0~20\);

-- Location: LCCOMB_X110_Y19_N26
\timer_fsm|Add0~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add0~21_combout\ = (\main_fsm|WideOr10~0_combout\ & (\timer_fsm|Add0~20\ $ (GND))) # (!\main_fsm|WideOr10~0_combout\ & ((GND) # (!\timer_fsm|Add0~20\)))
-- \timer_fsm|Add0~22\ = CARRY((!\timer_fsm|Add0~20\) # (!\main_fsm|WideOr10~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \main_fsm|WideOr10~0_combout\,
	datad => VCC,
	cin => \timer_fsm|Add0~20\,
	combout => \timer_fsm|Add0~21_combout\,
	cout => \timer_fsm|Add0~22\);

-- Location: LCCOMB_X110_Y19_N28
\timer_fsm|Add0~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add0~23_combout\ = (\timer_fsm|Mult0|mult_core|_~1_combout\ & (\timer_fsm|Add0~22\ & VCC)) # (!\timer_fsm|Mult0|mult_core|_~1_combout\ & (!\timer_fsm|Add0~22\))
-- \timer_fsm|Add0~24\ = CARRY((!\timer_fsm|Mult0|mult_core|_~1_combout\ & !\timer_fsm|Add0~22\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|Mult0|mult_core|_~1_combout\,
	datad => VCC,
	cin => \timer_fsm|Add0~22\,
	combout => \timer_fsm|Add0~23_combout\,
	cout => \timer_fsm|Add0~24\);

-- Location: LCCOMB_X110_Y19_N30
\timer_fsm|Add0~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add0~25_combout\ = (\timer_fsm|Mult0|mult_core|_~1_combout\ & ((GND) # (!\timer_fsm|Add0~24\))) # (!\timer_fsm|Mult0|mult_core|_~1_combout\ & (\timer_fsm|Add0~24\ $ (GND)))
-- \timer_fsm|Add0~26\ = CARRY((\timer_fsm|Mult0|mult_core|_~1_combout\) # (!\timer_fsm|Add0~24\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|Mult0|mult_core|_~1_combout\,
	datad => VCC,
	cin => \timer_fsm|Add0~24\,
	combout => \timer_fsm|Add0~25_combout\,
	cout => \timer_fsm|Add0~26\);

-- Location: LCCOMB_X112_Y19_N2
\timer_fsm|Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~0_combout\ = \timer_fsm|s_counter\(0) $ (VCC)
-- \timer_fsm|Add1~1\ = CARRY(\timer_fsm|s_counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \timer_fsm|s_counter\(0),
	datad => VCC,
	combout => \timer_fsm|Add1~0_combout\,
	cout => \timer_fsm|Add1~1\);

-- Location: LCCOMB_X113_Y19_N0
\timer_fsm|s_counter~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|s_counter~15_combout\ = (!\SW[0]~input_o\ & ((\timer_fsm|Add1~0_combout\) # (\main_fsm|Selector1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datac => \timer_fsm|Add1~0_combout\,
	datad => \main_fsm|Selector1~0_combout\,
	combout => \timer_fsm|s_counter~15_combout\);

-- Location: LCCOMB_X111_Y19_N30
\timer_fsm|s_counter[2]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|s_counter[2]~16_combout\ = (\SW[0]~input_o\) # ((!\main_fsm|selModoGelo~0_combout\ & ((\main_fsm|Selector1~0_combout\) # (!\timer_fsm|Equal0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \main_fsm|Selector1~0_combout\,
	datac => \main_fsm|selModoGelo~0_combout\,
	datad => \timer_fsm|Equal0~9_combout\,
	combout => \timer_fsm|s_counter[2]~16_combout\);

-- Location: FF_X112_Y19_N25
\timer_fsm|s_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \timer_fsm|s_counter~15_combout\,
	sload => VCC,
	ena => \timer_fsm|s_counter[2]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_fsm|s_counter\(0));

-- Location: LCCOMB_X112_Y19_N4
\timer_fsm|Add1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~2_combout\ = (\timer_fsm|s_counter\(1) & (\timer_fsm|Add1~1\ & VCC)) # (!\timer_fsm|s_counter\(1) & (!\timer_fsm|Add1~1\))
-- \timer_fsm|Add1~3\ = CARRY((!\timer_fsm|s_counter\(1) & !\timer_fsm|Add1~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \timer_fsm|s_counter\(1),
	datad => VCC,
	cin => \timer_fsm|Add1~1\,
	combout => \timer_fsm|Add1~2_combout\,
	cout => \timer_fsm|Add1~3\);

-- Location: LCCOMB_X112_Y19_N0
\timer_fsm|s_counter~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|s_counter~17_combout\ = (!\SW[0]~input_o\ & ((\timer_fsm|Add1~2_combout\) # (\main_fsm|Selector1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datac => \timer_fsm|Add1~2_combout\,
	datad => \main_fsm|Selector1~0_combout\,
	combout => \timer_fsm|s_counter~17_combout\);

-- Location: FF_X112_Y19_N1
\timer_fsm|s_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \timer_fsm|s_counter~17_combout\,
	ena => \timer_fsm|s_counter[2]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_fsm|s_counter\(1));

-- Location: LCCOMB_X112_Y19_N6
\timer_fsm|Add1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~4_combout\ = (\timer_fsm|s_counter\(2) & ((GND) # (!\timer_fsm|Add1~3\))) # (!\timer_fsm|s_counter\(2) & (\timer_fsm|Add1~3\ $ (GND)))
-- \timer_fsm|Add1~5\ = CARRY((\timer_fsm|s_counter\(2)) # (!\timer_fsm|Add1~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|s_counter\(2),
	datad => VCC,
	cin => \timer_fsm|Add1~3\,
	combout => \timer_fsm|Add1~4_combout\,
	cout => \timer_fsm|Add1~5\);

-- Location: LCCOMB_X113_Y19_N30
\timer_fsm|s_counter~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|s_counter~18_combout\ = (!\SW[0]~input_o\ & ((\timer_fsm|Add1~4_combout\) # (\main_fsm|Selector1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datac => \timer_fsm|Add1~4_combout\,
	datad => \main_fsm|Selector1~0_combout\,
	combout => \timer_fsm|s_counter~18_combout\);

-- Location: FF_X112_Y19_N11
\timer_fsm|s_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \timer_fsm|s_counter~18_combout\,
	sload => VCC,
	ena => \timer_fsm|s_counter[2]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_fsm|s_counter\(2));

-- Location: LCCOMB_X112_Y19_N8
\timer_fsm|Add1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~6_combout\ = (\timer_fsm|s_counter\(3) & (\timer_fsm|Add1~5\ & VCC)) # (!\timer_fsm|s_counter\(3) & (!\timer_fsm|Add1~5\))
-- \timer_fsm|Add1~7\ = CARRY((!\timer_fsm|s_counter\(3) & !\timer_fsm|Add1~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|s_counter\(3),
	datad => VCC,
	cin => \timer_fsm|Add1~5\,
	combout => \timer_fsm|Add1~6_combout\,
	cout => \timer_fsm|Add1~7\);

-- Location: LCCOMB_X111_Y19_N16
\timer_fsm|s_counter~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|s_counter~19_combout\ = (!\SW[0]~input_o\ & ((\timer_fsm|Add1~6_combout\) # (\main_fsm|Selector1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datac => \timer_fsm|Add1~6_combout\,
	datad => \main_fsm|Selector1~0_combout\,
	combout => \timer_fsm|s_counter~19_combout\);

-- Location: FF_X112_Y19_N13
\timer_fsm|s_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \timer_fsm|s_counter~19_combout\,
	sload => VCC,
	ena => \timer_fsm|s_counter[2]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_fsm|s_counter\(3));

-- Location: LCCOMB_X112_Y19_N10
\timer_fsm|Add1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~8_combout\ = (\timer_fsm|s_counter\(4) & ((GND) # (!\timer_fsm|Add1~7\))) # (!\timer_fsm|s_counter\(4) & (\timer_fsm|Add1~7\ $ (GND)))
-- \timer_fsm|Add1~9\ = CARRY((\timer_fsm|s_counter\(4)) # (!\timer_fsm|Add1~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|s_counter\(4),
	datad => VCC,
	cin => \timer_fsm|Add1~7\,
	combout => \timer_fsm|Add1~8_combout\,
	cout => \timer_fsm|Add1~9\);

-- Location: LCCOMB_X113_Y19_N4
\timer_fsm|s_counter~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|s_counter~20_combout\ = (!\SW[0]~input_o\ & ((\timer_fsm|Add1~8_combout\) # (\main_fsm|Selector1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \timer_fsm|Add1~8_combout\,
	datac => \main_fsm|Selector1~0_combout\,
	combout => \timer_fsm|s_counter~20_combout\);

-- Location: FF_X113_Y19_N5
\timer_fsm|s_counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \timer_fsm|s_counter~20_combout\,
	ena => \timer_fsm|s_counter[2]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_fsm|s_counter\(4));

-- Location: LCCOMB_X112_Y19_N12
\timer_fsm|Add1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~10_combout\ = (\timer_fsm|s_counter\(5) & (\timer_fsm|Add1~9\ & VCC)) # (!\timer_fsm|s_counter\(5) & (!\timer_fsm|Add1~9\))
-- \timer_fsm|Add1~11\ = CARRY((!\timer_fsm|s_counter\(5) & !\timer_fsm|Add1~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \timer_fsm|s_counter\(5),
	datad => VCC,
	cin => \timer_fsm|Add1~9\,
	combout => \timer_fsm|Add1~10_combout\,
	cout => \timer_fsm|Add1~11\);

-- Location: LCCOMB_X113_Y19_N12
\timer_fsm|s_counter~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|s_counter~21_combout\ = (!\SW[0]~input_o\ & ((\main_fsm|Selector1~0_combout\) # (\timer_fsm|Add1~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datac => \main_fsm|Selector1~0_combout\,
	datad => \timer_fsm|Add1~10_combout\,
	combout => \timer_fsm|s_counter~21_combout\);

-- Location: FF_X112_Y19_N3
\timer_fsm|s_counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \timer_fsm|s_counter~21_combout\,
	sload => VCC,
	ena => \timer_fsm|s_counter[2]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_fsm|s_counter\(5));

-- Location: LCCOMB_X112_Y19_N14
\timer_fsm|Add1~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~12_combout\ = (\timer_fsm|s_counter\(6) & ((GND) # (!\timer_fsm|Add1~11\))) # (!\timer_fsm|s_counter\(6) & (\timer_fsm|Add1~11\ $ (GND)))
-- \timer_fsm|Add1~13\ = CARRY((\timer_fsm|s_counter\(6)) # (!\timer_fsm|Add1~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|s_counter\(6),
	datad => VCC,
	cin => \timer_fsm|Add1~11\,
	combout => \timer_fsm|Add1~12_combout\,
	cout => \timer_fsm|Add1~13\);

-- Location: LCCOMB_X113_Y19_N6
\timer_fsm|s_counter~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|s_counter~22_combout\ = (!\SW[0]~input_o\ & ((\main_fsm|Selector1~0_combout\) # (\timer_fsm|Add1~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datac => \main_fsm|Selector1~0_combout\,
	datad => \timer_fsm|Add1~12_combout\,
	combout => \timer_fsm|s_counter~22_combout\);

-- Location: FF_X113_Y19_N7
\timer_fsm|s_counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \timer_fsm|s_counter~22_combout\,
	ena => \timer_fsm|s_counter[2]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_fsm|s_counter\(6));

-- Location: LCCOMB_X112_Y19_N16
\timer_fsm|Add1~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~14_combout\ = (\timer_fsm|s_counter\(7) & (\timer_fsm|Add1~13\ & VCC)) # (!\timer_fsm|s_counter\(7) & (!\timer_fsm|Add1~13\))
-- \timer_fsm|Add1~15\ = CARRY((!\timer_fsm|s_counter\(7) & !\timer_fsm|Add1~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \timer_fsm|s_counter\(7),
	datad => VCC,
	cin => \timer_fsm|Add1~13\,
	combout => \timer_fsm|Add1~14_combout\,
	cout => \timer_fsm|Add1~15\);

-- Location: LCCOMB_X113_Y19_N28
\timer_fsm|s_counter~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|s_counter~23_combout\ = (!\SW[0]~input_o\ & ((\timer_fsm|Add1~14_combout\) # (\main_fsm|Selector1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datac => \timer_fsm|Add1~14_combout\,
	datad => \main_fsm|Selector1~0_combout\,
	combout => \timer_fsm|s_counter~23_combout\);

-- Location: FF_X113_Y19_N29
\timer_fsm|s_counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \timer_fsm|s_counter~23_combout\,
	ena => \timer_fsm|s_counter[2]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_fsm|s_counter\(7));

-- Location: LCCOMB_X112_Y19_N18
\timer_fsm|Add1~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~16_combout\ = (\timer_fsm|s_counter\(8) & ((GND) # (!\timer_fsm|Add1~15\))) # (!\timer_fsm|s_counter\(8) & (\timer_fsm|Add1~15\ $ (GND)))
-- \timer_fsm|Add1~17\ = CARRY((\timer_fsm|s_counter\(8)) # (!\timer_fsm|Add1~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \timer_fsm|s_counter\(8),
	datad => VCC,
	cin => \timer_fsm|Add1~15\,
	combout => \timer_fsm|Add1~16_combout\,
	cout => \timer_fsm|Add1~17\);

-- Location: LCCOMB_X113_Y19_N18
\timer_fsm|s_counter~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|s_counter~24_combout\ = (\main_fsm|s_currentState.START~q\ & ((\timer_fsm|Add1~16_combout\) # ((\main_fsm|s_currentState.EREF~q\ & !\main_fsm|Selector2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_currentState.EREF~q\,
	datab => \main_fsm|s_currentState.START~q\,
	datac => \main_fsm|Selector2~0_combout\,
	datad => \timer_fsm|Add1~16_combout\,
	combout => \timer_fsm|s_counter~24_combout\);

-- Location: LCCOMB_X113_Y19_N8
\timer_fsm|s_counter[8]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|s_counter[8]~feeder_combout\ = \timer_fsm|s_counter~24_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \timer_fsm|s_counter~24_combout\,
	combout => \timer_fsm|s_counter[8]~feeder_combout\);

-- Location: LCCOMB_X111_Y19_N22
\main_fsm|s_currentState.START~_wirecell\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|s_currentState.START~_wirecell_combout\ = !\main_fsm|s_currentState.START~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \main_fsm|s_currentState.START~q\,
	combout => \main_fsm|s_currentState.START~_wirecell_combout\);

-- Location: FF_X113_Y19_N9
\timer_fsm|s_counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \timer_fsm|s_counter[8]~feeder_combout\,
	asdata => \main_fsm|s_currentState.START~_wirecell_combout\,
	sload => \SW[0]~input_o\,
	ena => \timer_fsm|s_counter[2]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_fsm|s_counter\(8));

-- Location: LCCOMB_X112_Y19_N20
\timer_fsm|Add1~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~18_combout\ = (\timer_fsm|s_counter\(9) & (\timer_fsm|Add1~17\ & VCC)) # (!\timer_fsm|s_counter\(9) & (!\timer_fsm|Add1~17\))
-- \timer_fsm|Add1~19\ = CARRY((!\timer_fsm|s_counter\(9) & !\timer_fsm|Add1~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|s_counter\(9),
	datad => VCC,
	cin => \timer_fsm|Add1~17\,
	combout => \timer_fsm|Add1~18_combout\,
	cout => \timer_fsm|Add1~19\);

-- Location: LCCOMB_X113_Y19_N20
\timer_fsm|s_counter~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|s_counter~25_combout\ = (\main_fsm|selModoGelo~0_combout\ & (\timer_fsm|s_counter\(9))) # (!\main_fsm|selModoGelo~0_combout\ & ((\main_fsm|Selector1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \timer_fsm|s_counter\(9),
	datac => \main_fsm|selModoGelo~0_combout\,
	datad => \main_fsm|Selector1~0_combout\,
	combout => \timer_fsm|s_counter~25_combout\);

-- Location: LCCOMB_X113_Y19_N10
\timer_fsm|s_counter~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|s_counter~26_combout\ = (\timer_fsm|s_counter~25_combout\) # ((!\main_fsm|selModoGelo~0_combout\ & (\timer_fsm|Add1~18_combout\ & !\timer_fsm|Equal0~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|selModoGelo~0_combout\,
	datab => \timer_fsm|Add1~18_combout\,
	datac => \timer_fsm|Equal0~9_combout\,
	datad => \timer_fsm|s_counter~25_combout\,
	combout => \timer_fsm|s_counter~26_combout\);

-- Location: LCCOMB_X113_Y19_N2
\timer_fsm|s_counter[9]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|s_counter[9]~feeder_combout\ = \timer_fsm|s_counter~26_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \timer_fsm|s_counter~26_combout\,
	combout => \timer_fsm|s_counter[9]~feeder_combout\);

-- Location: FF_X113_Y19_N3
\timer_fsm|s_counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \timer_fsm|s_counter[9]~feeder_combout\,
	asdata => \main_fsm|s_currentState.START~_wirecell_combout\,
	sload => \SW[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_fsm|s_counter\(9));

-- Location: LCCOMB_X112_Y19_N22
\timer_fsm|Add1~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~20_combout\ = (\timer_fsm|s_counter\(10) & ((GND) # (!\timer_fsm|Add1~19\))) # (!\timer_fsm|s_counter\(10) & (\timer_fsm|Add1~19\ $ (GND)))
-- \timer_fsm|Add1~21\ = CARRY((\timer_fsm|s_counter\(10)) # (!\timer_fsm|Add1~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \timer_fsm|s_counter\(10),
	datad => VCC,
	cin => \timer_fsm|Add1~19\,
	combout => \timer_fsm|Add1~20_combout\,
	cout => \timer_fsm|Add1~21\);

-- Location: LCCOMB_X113_Y19_N16
\timer_fsm|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add0~6_combout\ = (\main_fsm|Selector1~0_combout\ & (\timer_fsm|Add0~4_combout\)) # (!\main_fsm|Selector1~0_combout\ & ((\timer_fsm|Add1~20_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|Selector1~0_combout\,
	datab => \timer_fsm|Add0~4_combout\,
	datad => \timer_fsm|Add1~20_combout\,
	combout => \timer_fsm|Add0~6_combout\);

-- Location: FF_X113_Y19_N17
\timer_fsm|s_counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \timer_fsm|Add0~6_combout\,
	asdata => \main_fsm|s_currentState.EREF~q\,
	sload => \SW[0]~input_o\,
	ena => \timer_fsm|s_counter[2]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_fsm|s_counter\(10));

-- Location: LCCOMB_X112_Y19_N24
\timer_fsm|Add1~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~22_combout\ = (\timer_fsm|s_counter\(11) & (\timer_fsm|Add1~21\ & VCC)) # (!\timer_fsm|s_counter\(11) & (!\timer_fsm|Add1~21\))
-- \timer_fsm|Add1~23\ = CARRY((!\timer_fsm|s_counter\(11) & !\timer_fsm|Add1~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|s_counter\(11),
	datad => VCC,
	cin => \timer_fsm|Add1~21\,
	combout => \timer_fsm|Add1~22_combout\,
	cout => \timer_fsm|Add1~23\);

-- Location: LCCOMB_X111_Y19_N14
\timer_fsm|Add0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add0~9_combout\ = (\main_fsm|Selector1~0_combout\ & (\timer_fsm|Add0~7_combout\)) # (!\main_fsm|Selector1~0_combout\ & ((\timer_fsm|Add1~22_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \main_fsm|Selector1~0_combout\,
	datac => \timer_fsm|Add0~7_combout\,
	datad => \timer_fsm|Add1~22_combout\,
	combout => \timer_fsm|Add0~9_combout\);

-- Location: FF_X111_Y19_N15
\timer_fsm|s_counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \timer_fsm|Add0~9_combout\,
	sclr => \SW[0]~input_o\,
	ena => \timer_fsm|s_counter[2]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_fsm|s_counter\(11));

-- Location: LCCOMB_X112_Y19_N26
\timer_fsm|Add1~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~24_combout\ = (\timer_fsm|s_counter\(12) & ((GND) # (!\timer_fsm|Add1~23\))) # (!\timer_fsm|s_counter\(12) & (\timer_fsm|Add1~23\ $ (GND)))
-- \timer_fsm|Add1~25\ = CARRY((\timer_fsm|s_counter\(12)) # (!\timer_fsm|Add1~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|s_counter\(12),
	datad => VCC,
	cin => \timer_fsm|Add1~23\,
	combout => \timer_fsm|Add1~24_combout\,
	cout => \timer_fsm|Add1~25\);

-- Location: LCCOMB_X111_Y19_N12
\timer_fsm|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add0~12_combout\ = (\main_fsm|Selector1~0_combout\ & (\timer_fsm|Add0~10_combout\)) # (!\main_fsm|Selector1~0_combout\ & ((\timer_fsm|Add1~24_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \timer_fsm|Add0~10_combout\,
	datac => \timer_fsm|Add1~24_combout\,
	datad => \main_fsm|Selector1~0_combout\,
	combout => \timer_fsm|Add0~12_combout\);

-- Location: FF_X111_Y19_N13
\timer_fsm|s_counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \timer_fsm|Add0~12_combout\,
	sclr => \SW[0]~input_o\,
	ena => \timer_fsm|s_counter[2]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_fsm|s_counter\(12));

-- Location: LCCOMB_X112_Y19_N28
\timer_fsm|Add1~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~26_combout\ = (\timer_fsm|s_counter\(13) & (\timer_fsm|Add1~25\ & VCC)) # (!\timer_fsm|s_counter\(13) & (!\timer_fsm|Add1~25\))
-- \timer_fsm|Add1~27\ = CARRY((!\timer_fsm|s_counter\(13) & !\timer_fsm|Add1~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \timer_fsm|s_counter\(13),
	datad => VCC,
	cin => \timer_fsm|Add1~25\,
	combout => \timer_fsm|Add1~26_combout\,
	cout => \timer_fsm|Add1~27\);

-- Location: LCCOMB_X113_Y19_N26
\timer_fsm|Add0~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add0~15_combout\ = (\main_fsm|Selector1~0_combout\ & (\timer_fsm|Add0~13_combout\)) # (!\main_fsm|Selector1~0_combout\ & ((\timer_fsm|Add1~26_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|Selector1~0_combout\,
	datab => \timer_fsm|Add0~13_combout\,
	datad => \timer_fsm|Add1~26_combout\,
	combout => \timer_fsm|Add0~15_combout\);

-- Location: FF_X113_Y19_N27
\timer_fsm|s_counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \timer_fsm|Add0~15_combout\,
	asdata => \main_fsm|s_currentState.START~_wirecell_combout\,
	sload => \SW[0]~input_o\,
	ena => \timer_fsm|s_counter[2]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_fsm|s_counter\(13));

-- Location: LCCOMB_X112_Y19_N30
\timer_fsm|Add1~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~28_combout\ = (\timer_fsm|s_counter\(14) & ((GND) # (!\timer_fsm|Add1~27\))) # (!\timer_fsm|s_counter\(14) & (\timer_fsm|Add1~27\ $ (GND)))
-- \timer_fsm|Add1~29\ = CARRY((\timer_fsm|s_counter\(14)) # (!\timer_fsm|Add1~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \timer_fsm|s_counter\(14),
	datad => VCC,
	cin => \timer_fsm|Add1~27\,
	combout => \timer_fsm|Add1~28_combout\,
	cout => \timer_fsm|Add1~29\);

-- Location: LCCOMB_X111_Y19_N6
\timer_fsm|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add0~18_combout\ = (\main_fsm|Selector1~0_combout\ & ((\timer_fsm|Add0~16_combout\))) # (!\main_fsm|Selector1~0_combout\ & (\timer_fsm|Add1~28_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \main_fsm|Selector1~0_combout\,
	datac => \timer_fsm|Add1~28_combout\,
	datad => \timer_fsm|Add0~16_combout\,
	combout => \timer_fsm|Add0~18_combout\);

-- Location: FF_X111_Y19_N7
\timer_fsm|s_counter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \timer_fsm|Add0~18_combout\,
	sclr => \SW[0]~input_o\,
	ena => \timer_fsm|s_counter[2]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_fsm|s_counter\(14));

-- Location: LCCOMB_X112_Y18_N0
\timer_fsm|Add1~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~30_combout\ = (\timer_fsm|s_counter\(15) & (\timer_fsm|Add1~29\ & VCC)) # (!\timer_fsm|s_counter\(15) & (!\timer_fsm|Add1~29\))
-- \timer_fsm|Add1~31\ = CARRY((!\timer_fsm|s_counter\(15) & !\timer_fsm|Add1~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|s_counter\(15),
	datad => VCC,
	cin => \timer_fsm|Add1~29\,
	combout => \timer_fsm|Add1~30_combout\,
	cout => \timer_fsm|Add1~31\);

-- Location: LCCOMB_X111_Y18_N12
\timer_fsm|s_counter[15]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|s_counter[15]~0_combout\ = (\main_fsm|Selector1~0_combout\ & ((\timer_fsm|Add0~19_combout\))) # (!\main_fsm|Selector1~0_combout\ & (\timer_fsm|Add1~30_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|Selector1~0_combout\,
	datab => \timer_fsm|Add1~30_combout\,
	datad => \timer_fsm|Add0~19_combout\,
	combout => \timer_fsm|s_counter[15]~0_combout\);

-- Location: LCCOMB_X111_Y18_N8
\timer_fsm|Mult0|mult_core|romout[0][28]~0_wirecell\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Mult0|mult_core|romout[0][28]~0_wirecell_combout\ = !\timer_fsm|Mult0|mult_core|romout[0][28]~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \timer_fsm|Mult0|mult_core|romout[0][28]~0_combout\,
	combout => \timer_fsm|Mult0|mult_core|romout[0][28]~0_wirecell_combout\);

-- Location: FF_X111_Y18_N13
\timer_fsm|s_counter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \timer_fsm|s_counter[15]~0_combout\,
	asdata => \timer_fsm|Mult0|mult_core|romout[0][28]~0_wirecell_combout\,
	sload => \SW[0]~input_o\,
	ena => \timer_fsm|s_counter[2]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_fsm|s_counter\(15));

-- Location: LCCOMB_X112_Y18_N2
\timer_fsm|Add1~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~32_combout\ = (\timer_fsm|s_counter\(16) & ((GND) # (!\timer_fsm|Add1~31\))) # (!\timer_fsm|s_counter\(16) & (\timer_fsm|Add1~31\ $ (GND)))
-- \timer_fsm|Add1~33\ = CARRY((\timer_fsm|s_counter\(16)) # (!\timer_fsm|Add1~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \timer_fsm|s_counter\(16),
	datad => VCC,
	cin => \timer_fsm|Add1~31\,
	combout => \timer_fsm|Add1~32_combout\,
	cout => \timer_fsm|Add1~33\);

-- Location: LCCOMB_X111_Y18_N6
\timer_fsm|s_counter[16]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|s_counter[16]~1_combout\ = (\main_fsm|Selector1~0_combout\ & (\timer_fsm|Add0~21_combout\)) # (!\main_fsm|Selector1~0_combout\ & ((\timer_fsm|Add1~32_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|Add0~21_combout\,
	datab => \main_fsm|Selector1~0_combout\,
	datad => \timer_fsm|Add1~32_combout\,
	combout => \timer_fsm|s_counter[16]~1_combout\);

-- Location: LCCOMB_X111_Y18_N22
\main_fsm|WideOr10~0_wirecell\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|WideOr10~0_wirecell_combout\ = !\main_fsm|WideOr10~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \main_fsm|WideOr10~0_combout\,
	combout => \main_fsm|WideOr10~0_wirecell_combout\);

-- Location: FF_X111_Y18_N7
\timer_fsm|s_counter[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \timer_fsm|s_counter[16]~1_combout\,
	asdata => \main_fsm|WideOr10~0_wirecell_combout\,
	sload => \SW[0]~input_o\,
	ena => \timer_fsm|s_counter[2]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_fsm|s_counter\(16));

-- Location: LCCOMB_X112_Y18_N4
\timer_fsm|Add1~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~34_combout\ = (\timer_fsm|s_counter\(17) & (\timer_fsm|Add1~33\ & VCC)) # (!\timer_fsm|s_counter\(17) & (!\timer_fsm|Add1~33\))
-- \timer_fsm|Add1~35\ = CARRY((!\timer_fsm|s_counter\(17) & !\timer_fsm|Add1~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \timer_fsm|s_counter\(17),
	datad => VCC,
	cin => \timer_fsm|Add1~33\,
	combout => \timer_fsm|Add1~34_combout\,
	cout => \timer_fsm|Add1~35\);

-- Location: LCCOMB_X110_Y19_N0
\timer_fsm|s_counter[17]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|s_counter[17]~2_combout\ = (\main_fsm|Selector1~0_combout\ & (\timer_fsm|Add0~23_combout\)) # (!\main_fsm|Selector1~0_combout\ & ((\timer_fsm|Add1~34_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|Selector1~0_combout\,
	datab => \timer_fsm|Add0~23_combout\,
	datad => \timer_fsm|Add1~34_combout\,
	combout => \timer_fsm|s_counter[17]~2_combout\);

-- Location: FF_X110_Y19_N1
\timer_fsm|s_counter[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \timer_fsm|s_counter[17]~2_combout\,
	asdata => \timer_fsm|Mult0|mult_core|_~1_combout\,
	sload => \SW[0]~input_o\,
	ena => \timer_fsm|s_counter[2]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_fsm|s_counter\(17));

-- Location: LCCOMB_X112_Y18_N6
\timer_fsm|Add1~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~36_combout\ = (\timer_fsm|s_counter\(18) & ((GND) # (!\timer_fsm|Add1~35\))) # (!\timer_fsm|s_counter\(18) & (\timer_fsm|Add1~35\ $ (GND)))
-- \timer_fsm|Add1~37\ = CARRY((\timer_fsm|s_counter\(18)) # (!\timer_fsm|Add1~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|s_counter\(18),
	datad => VCC,
	cin => \timer_fsm|Add1~35\,
	combout => \timer_fsm|Add1~36_combout\,
	cout => \timer_fsm|Add1~37\);

-- Location: LCCOMB_X110_Y19_N2
\timer_fsm|s_counter[18]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|s_counter[18]~3_combout\ = (\main_fsm|Selector1~0_combout\ & (\timer_fsm|Add0~25_combout\)) # (!\main_fsm|Selector1~0_combout\ & ((\timer_fsm|Add1~36_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|Add0~25_combout\,
	datab => \main_fsm|Selector1~0_combout\,
	datad => \timer_fsm|Add1~36_combout\,
	combout => \timer_fsm|s_counter[18]~3_combout\);

-- Location: FF_X110_Y19_N3
\timer_fsm|s_counter[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \timer_fsm|s_counter[18]~3_combout\,
	asdata => \timer_fsm|Mult0|mult_core|_~1_combout\,
	sload => \SW[0]~input_o\,
	ena => \timer_fsm|s_counter[2]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_fsm|s_counter\(18));

-- Location: LCCOMB_X111_Y19_N26
\timer_fsm|Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Equal0~5_combout\ = (!\timer_fsm|s_counter\(18) & (!\timer_fsm|s_counter\(15) & (!\timer_fsm|s_counter\(17) & !\timer_fsm|s_counter\(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|s_counter\(18),
	datab => \timer_fsm|s_counter\(15),
	datac => \timer_fsm|s_counter\(17),
	datad => \timer_fsm|s_counter\(16),
	combout => \timer_fsm|Equal0~5_combout\);

-- Location: LCCOMB_X110_Y18_N30
\timer_fsm|Mult0|mult_core|_~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Mult0|mult_core|_~0_combout\ = (\main_fsm|s_currentState.EREF~q\ & !\main_fsm|s_currentState.START~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \main_fsm|s_currentState.EREF~q\,
	datad => \main_fsm|s_currentState.START~q\,
	combout => \timer_fsm|Mult0|mult_core|_~0_combout\);

-- Location: LCCOMB_X110_Y18_N0
\timer_fsm|Add0~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add0~27_combout\ = (\timer_fsm|Mult0|mult_core|_~0_combout\ & (\timer_fsm|Add0~26\ & VCC)) # (!\timer_fsm|Mult0|mult_core|_~0_combout\ & (!\timer_fsm|Add0~26\))
-- \timer_fsm|Add0~28\ = CARRY((!\timer_fsm|Mult0|mult_core|_~0_combout\ & !\timer_fsm|Add0~26\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|Mult0|mult_core|_~0_combout\,
	datad => VCC,
	cin => \timer_fsm|Add0~26\,
	combout => \timer_fsm|Add0~27_combout\,
	cout => \timer_fsm|Add0~28\);

-- Location: LCCOMB_X110_Y18_N2
\timer_fsm|Add0~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add0~29_combout\ = (\main_fsm|s_currentState.EREF~q\ & ((GND) # (!\timer_fsm|Add0~28\))) # (!\main_fsm|s_currentState.EREF~q\ & (\timer_fsm|Add0~28\ $ (GND)))
-- \timer_fsm|Add0~30\ = CARRY((\main_fsm|s_currentState.EREF~q\) # (!\timer_fsm|Add0~28\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_currentState.EREF~q\,
	datad => VCC,
	cin => \timer_fsm|Add0~28\,
	combout => \timer_fsm|Add0~29_combout\,
	cout => \timer_fsm|Add0~30\);

-- Location: LCCOMB_X112_Y18_N8
\timer_fsm|Add1~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~38_combout\ = (\timer_fsm|s_counter\(19) & (\timer_fsm|Add1~37\ & VCC)) # (!\timer_fsm|s_counter\(19) & (!\timer_fsm|Add1~37\))
-- \timer_fsm|Add1~39\ = CARRY((!\timer_fsm|s_counter\(19) & !\timer_fsm|Add1~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|s_counter\(19),
	datad => VCC,
	cin => \timer_fsm|Add1~37\,
	combout => \timer_fsm|Add1~38_combout\,
	cout => \timer_fsm|Add1~39\);

-- Location: LCCOMB_X110_Y18_N28
\timer_fsm|s_counter[19]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|s_counter[19]~4_combout\ = (\main_fsm|Selector1~0_combout\ & (\timer_fsm|Add0~27_combout\)) # (!\main_fsm|Selector1~0_combout\ & ((\timer_fsm|Add1~38_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|Selector1~0_combout\,
	datab => \timer_fsm|Add0~27_combout\,
	datad => \timer_fsm|Add1~38_combout\,
	combout => \timer_fsm|s_counter[19]~4_combout\);

-- Location: FF_X110_Y18_N29
\timer_fsm|s_counter[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \timer_fsm|s_counter[19]~4_combout\,
	asdata => \timer_fsm|Mult0|mult_core|_~0_combout\,
	sload => \SW[0]~input_o\,
	ena => \timer_fsm|s_counter[2]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_fsm|s_counter\(19));

-- Location: LCCOMB_X112_Y18_N10
\timer_fsm|Add1~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~40_combout\ = (\timer_fsm|s_counter\(20) & ((GND) # (!\timer_fsm|Add1~39\))) # (!\timer_fsm|s_counter\(20) & (\timer_fsm|Add1~39\ $ (GND)))
-- \timer_fsm|Add1~41\ = CARRY((\timer_fsm|s_counter\(20)) # (!\timer_fsm|Add1~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|s_counter\(20),
	datad => VCC,
	cin => \timer_fsm|Add1~39\,
	combout => \timer_fsm|Add1~40_combout\,
	cout => \timer_fsm|Add1~41\);

-- Location: LCCOMB_X111_Y18_N16
\timer_fsm|s_counter[20]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|s_counter[20]~5_combout\ = (\main_fsm|Selector1~0_combout\ & (\timer_fsm|Add0~29_combout\)) # (!\main_fsm|Selector1~0_combout\ & ((\timer_fsm|Add1~40_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|Add0~29_combout\,
	datab => \timer_fsm|Add1~40_combout\,
	datad => \main_fsm|Selector1~0_combout\,
	combout => \timer_fsm|s_counter[20]~5_combout\);

-- Location: FF_X111_Y18_N17
\timer_fsm|s_counter[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \timer_fsm|s_counter[20]~5_combout\,
	asdata => \main_fsm|s_currentState.EREF~q\,
	sload => \SW[0]~input_o\,
	ena => \timer_fsm|s_counter[2]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_fsm|s_counter\(20));

-- Location: LCCOMB_X112_Y18_N12
\timer_fsm|Add1~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~42_combout\ = (\timer_fsm|s_counter\(21) & (\timer_fsm|Add1~41\ & VCC)) # (!\timer_fsm|s_counter\(21) & (!\timer_fsm|Add1~41\))
-- \timer_fsm|Add1~43\ = CARRY((!\timer_fsm|s_counter\(21) & !\timer_fsm|Add1~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|s_counter\(21),
	datad => VCC,
	cin => \timer_fsm|Add1~41\,
	combout => \timer_fsm|Add1~42_combout\,
	cout => \timer_fsm|Add1~43\);

-- Location: LCCOMB_X110_Y18_N4
\timer_fsm|Add0~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add0~31_combout\ = (\main_fsm|s_currentState.START~q\ & (!\timer_fsm|Add0~30\)) # (!\main_fsm|s_currentState.START~q\ & (\timer_fsm|Add0~30\ & VCC))
-- \timer_fsm|Add0~32\ = CARRY((\main_fsm|s_currentState.START~q\ & !\timer_fsm|Add0~30\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \main_fsm|s_currentState.START~q\,
	datad => VCC,
	cin => \timer_fsm|Add0~30\,
	combout => \timer_fsm|Add0~31_combout\,
	cout => \timer_fsm|Add0~32\);

-- Location: LCCOMB_X111_Y18_N10
\timer_fsm|s_counter[21]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|s_counter[21]~6_combout\ = (\main_fsm|Selector1~0_combout\ & ((\timer_fsm|Add0~31_combout\))) # (!\main_fsm|Selector1~0_combout\ & (\timer_fsm|Add1~42_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|Selector1~0_combout\,
	datab => \timer_fsm|Add1~42_combout\,
	datad => \timer_fsm|Add0~31_combout\,
	combout => \timer_fsm|s_counter[21]~6_combout\);

-- Location: FF_X111_Y18_N11
\timer_fsm|s_counter[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \timer_fsm|s_counter[21]~6_combout\,
	asdata => \main_fsm|s_currentState.START~_wirecell_combout\,
	sload => \SW[0]~input_o\,
	ena => \timer_fsm|s_counter[2]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_fsm|s_counter\(21));

-- Location: LCCOMB_X112_Y18_N14
\timer_fsm|Add1~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~44_combout\ = (\timer_fsm|s_counter\(22) & ((GND) # (!\timer_fsm|Add1~43\))) # (!\timer_fsm|s_counter\(22) & (\timer_fsm|Add1~43\ $ (GND)))
-- \timer_fsm|Add1~45\ = CARRY((\timer_fsm|s_counter\(22)) # (!\timer_fsm|Add1~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \timer_fsm|s_counter\(22),
	datad => VCC,
	cin => \timer_fsm|Add1~43\,
	combout => \timer_fsm|Add1~44_combout\,
	cout => \timer_fsm|Add1~45\);

-- Location: LCCOMB_X110_Y18_N6
\timer_fsm|Add0~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add0~33_combout\ = (\timer_fsm|Mult0|mult_core|romout[0][28]~0_combout\ & (\timer_fsm|Add0~32\ $ (GND))) # (!\timer_fsm|Mult0|mult_core|romout[0][28]~0_combout\ & ((GND) # (!\timer_fsm|Add0~32\)))
-- \timer_fsm|Add0~34\ = CARRY((!\timer_fsm|Add0~32\) # (!\timer_fsm|Mult0|mult_core|romout[0][28]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|Mult0|mult_core|romout[0][28]~0_combout\,
	datad => VCC,
	cin => \timer_fsm|Add0~32\,
	combout => \timer_fsm|Add0~33_combout\,
	cout => \timer_fsm|Add0~34\);

-- Location: LCCOMB_X111_Y18_N28
\timer_fsm|s_counter[22]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|s_counter[22]~7_combout\ = (\main_fsm|Selector1~0_combout\ & ((\timer_fsm|Add0~33_combout\))) # (!\main_fsm|Selector1~0_combout\ & (\timer_fsm|Add1~44_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|Selector1~0_combout\,
	datab => \timer_fsm|Add1~44_combout\,
	datad => \timer_fsm|Add0~33_combout\,
	combout => \timer_fsm|s_counter[22]~7_combout\);

-- Location: FF_X111_Y18_N29
\timer_fsm|s_counter[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \timer_fsm|s_counter[22]~7_combout\,
	asdata => \timer_fsm|Mult0|mult_core|romout[0][28]~0_wirecell_combout\,
	sload => \SW[0]~input_o\,
	ena => \timer_fsm|s_counter[2]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_fsm|s_counter\(22));

-- Location: LCCOMB_X111_Y18_N0
\timer_fsm|Equal0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Equal0~6_combout\ = (!\timer_fsm|s_counter\(21) & (!\timer_fsm|s_counter\(22) & (!\timer_fsm|s_counter\(19) & !\timer_fsm|s_counter\(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|s_counter\(21),
	datab => \timer_fsm|s_counter\(22),
	datac => \timer_fsm|s_counter\(19),
	datad => \timer_fsm|s_counter\(20),
	combout => \timer_fsm|Equal0~6_combout\);

-- Location: LCCOMB_X113_Y19_N22
\timer_fsm|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Equal0~1_combout\ = (!\timer_fsm|s_counter\(6) & (!\timer_fsm|s_counter\(7) & (!\timer_fsm|s_counter\(4) & !\timer_fsm|s_counter\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|s_counter\(6),
	datab => \timer_fsm|s_counter\(7),
	datac => \timer_fsm|s_counter\(4),
	datad => \timer_fsm|s_counter\(5),
	combout => \timer_fsm|Equal0~1_combout\);

-- Location: LCCOMB_X111_Y19_N18
\timer_fsm|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Equal0~0_combout\ = (!\timer_fsm|s_counter\(0) & (!\timer_fsm|s_counter\(3) & (!\timer_fsm|s_counter\(1) & !\timer_fsm|s_counter\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|s_counter\(0),
	datab => \timer_fsm|s_counter\(3),
	datac => \timer_fsm|s_counter\(1),
	datad => \timer_fsm|s_counter\(2),
	combout => \timer_fsm|Equal0~0_combout\);

-- Location: LCCOMB_X111_Y19_N4
\timer_fsm|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Equal0~2_combout\ = (!\timer_fsm|s_counter\(9) & (!\timer_fsm|s_counter\(11) & (!\timer_fsm|s_counter\(8) & !\timer_fsm|s_counter\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|s_counter\(9),
	datab => \timer_fsm|s_counter\(11),
	datac => \timer_fsm|s_counter\(8),
	datad => \timer_fsm|s_counter\(10),
	combout => \timer_fsm|Equal0~2_combout\);

-- Location: LCCOMB_X110_Y18_N8
\timer_fsm|Add0~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add0~35_combout\ = (\main_fsm|WideOr10~0_combout\ & (!\timer_fsm|Add0~34\)) # (!\main_fsm|WideOr10~0_combout\ & (\timer_fsm|Add0~34\ & VCC))
-- \timer_fsm|Add0~36\ = CARRY((\main_fsm|WideOr10~0_combout\ & !\timer_fsm|Add0~34\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|WideOr10~0_combout\,
	datad => VCC,
	cin => \timer_fsm|Add0~34\,
	combout => \timer_fsm|Add0~35_combout\,
	cout => \timer_fsm|Add0~36\);

-- Location: LCCOMB_X110_Y18_N10
\timer_fsm|Add0~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add0~37_combout\ = (\main_fsm|WideOr10~0_combout\ & (\timer_fsm|Add0~36\ $ (GND))) # (!\main_fsm|WideOr10~0_combout\ & ((GND) # (!\timer_fsm|Add0~36\)))
-- \timer_fsm|Add0~38\ = CARRY((!\timer_fsm|Add0~36\) # (!\main_fsm|WideOr10~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|WideOr10~0_combout\,
	datad => VCC,
	cin => \timer_fsm|Add0~36\,
	combout => \timer_fsm|Add0~37_combout\,
	cout => \timer_fsm|Add0~38\);

-- Location: LCCOMB_X110_Y18_N12
\timer_fsm|Add0~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add0~39_combout\ = (\timer_fsm|Mult0|mult_core|_~1_combout\ & (\timer_fsm|Add0~38\ & VCC)) # (!\timer_fsm|Mult0|mult_core|_~1_combout\ & (!\timer_fsm|Add0~38\))
-- \timer_fsm|Add0~40\ = CARRY((!\timer_fsm|Mult0|mult_core|_~1_combout\ & !\timer_fsm|Add0~38\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \timer_fsm|Mult0|mult_core|_~1_combout\,
	datad => VCC,
	cin => \timer_fsm|Add0~38\,
	combout => \timer_fsm|Add0~39_combout\,
	cout => \timer_fsm|Add0~40\);

-- Location: LCCOMB_X110_Y18_N14
\timer_fsm|Add0~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add0~41_combout\ = (\timer_fsm|Mult0|mult_core|_~1_combout\ & ((GND) # (!\timer_fsm|Add0~40\))) # (!\timer_fsm|Mult0|mult_core|_~1_combout\ & (\timer_fsm|Add0~40\ $ (GND)))
-- \timer_fsm|Add0~42\ = CARRY((\timer_fsm|Mult0|mult_core|_~1_combout\) # (!\timer_fsm|Add0~40\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \timer_fsm|Mult0|mult_core|_~1_combout\,
	datad => VCC,
	cin => \timer_fsm|Add0~40\,
	combout => \timer_fsm|Add0~41_combout\,
	cout => \timer_fsm|Add0~42\);

-- Location: LCCOMB_X110_Y18_N16
\timer_fsm|Add0~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add0~43_combout\ = (\timer_fsm|Mult0|mult_core|_~0_combout\ & (\timer_fsm|Add0~42\ & VCC)) # (!\timer_fsm|Mult0|mult_core|_~0_combout\ & (!\timer_fsm|Add0~42\))
-- \timer_fsm|Add0~44\ = CARRY((!\timer_fsm|Mult0|mult_core|_~0_combout\ & !\timer_fsm|Add0~42\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|Mult0|mult_core|_~0_combout\,
	datad => VCC,
	cin => \timer_fsm|Add0~42\,
	combout => \timer_fsm|Add0~43_combout\,
	cout => \timer_fsm|Add0~44\);

-- Location: LCCOMB_X110_Y18_N18
\timer_fsm|Add0~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add0~45_combout\ = (\timer_fsm|Mult0|mult_core|romout[0][28]~0_combout\ & (\timer_fsm|Add0~44\ $ (GND))) # (!\timer_fsm|Mult0|mult_core|romout[0][28]~0_combout\ & ((GND) # (!\timer_fsm|Add0~44\)))
-- \timer_fsm|Add0~46\ = CARRY((!\timer_fsm|Add0~44\) # (!\timer_fsm|Mult0|mult_core|romout[0][28]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|Mult0|mult_core|romout[0][28]~0_combout\,
	datad => VCC,
	cin => \timer_fsm|Add0~44\,
	combout => \timer_fsm|Add0~45_combout\,
	cout => \timer_fsm|Add0~46\);

-- Location: LCCOMB_X110_Y18_N20
\timer_fsm|Add0~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add0~47_combout\ = (\timer_fsm|Mult0|mult_core|_~0_combout\ & (\timer_fsm|Add0~46\ & VCC)) # (!\timer_fsm|Mult0|mult_core|_~0_combout\ & (!\timer_fsm|Add0~46\))
-- \timer_fsm|Add0~48\ = CARRY((!\timer_fsm|Mult0|mult_core|_~0_combout\ & !\timer_fsm|Add0~46\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|Mult0|mult_core|_~0_combout\,
	datad => VCC,
	cin => \timer_fsm|Add0~46\,
	combout => \timer_fsm|Add0~47_combout\,
	cout => \timer_fsm|Add0~48\);

-- Location: LCCOMB_X112_Y18_N16
\timer_fsm|Add1~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~46_combout\ = (\timer_fsm|s_counter\(23) & (\timer_fsm|Add1~45\ & VCC)) # (!\timer_fsm|s_counter\(23) & (!\timer_fsm|Add1~45\))
-- \timer_fsm|Add1~47\ = CARRY((!\timer_fsm|s_counter\(23) & !\timer_fsm|Add1~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|s_counter\(23),
	datad => VCC,
	cin => \timer_fsm|Add1~45\,
	combout => \timer_fsm|Add1~46_combout\,
	cout => \timer_fsm|Add1~47\);

-- Location: LCCOMB_X111_Y18_N30
\timer_fsm|s_counter[23]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|s_counter[23]~8_combout\ = (\main_fsm|Selector1~0_combout\ & (\timer_fsm|Add0~35_combout\)) # (!\main_fsm|Selector1~0_combout\ & ((\timer_fsm|Add1~46_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|Selector1~0_combout\,
	datab => \timer_fsm|Add0~35_combout\,
	datad => \timer_fsm|Add1~46_combout\,
	combout => \timer_fsm|s_counter[23]~8_combout\);

-- Location: FF_X111_Y18_N31
\timer_fsm|s_counter[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \timer_fsm|s_counter[23]~8_combout\,
	asdata => \main_fsm|WideOr10~0_wirecell_combout\,
	sload => \SW[0]~input_o\,
	ena => \timer_fsm|s_counter[2]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_fsm|s_counter\(23));

-- Location: LCCOMB_X112_Y18_N18
\timer_fsm|Add1~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~48_combout\ = (\timer_fsm|s_counter\(24) & ((GND) # (!\timer_fsm|Add1~47\))) # (!\timer_fsm|s_counter\(24) & (\timer_fsm|Add1~47\ $ (GND)))
-- \timer_fsm|Add1~49\ = CARRY((\timer_fsm|s_counter\(24)) # (!\timer_fsm|Add1~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \timer_fsm|s_counter\(24),
	datad => VCC,
	cin => \timer_fsm|Add1~47\,
	combout => \timer_fsm|Add1~48_combout\,
	cout => \timer_fsm|Add1~49\);

-- Location: LCCOMB_X111_Y18_N20
\timer_fsm|s_counter[24]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|s_counter[24]~9_combout\ = (\main_fsm|Selector1~0_combout\ & (\timer_fsm|Add0~37_combout\)) # (!\main_fsm|Selector1~0_combout\ & ((\timer_fsm|Add1~48_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|Add0~37_combout\,
	datab => \main_fsm|Selector1~0_combout\,
	datad => \timer_fsm|Add1~48_combout\,
	combout => \timer_fsm|s_counter[24]~9_combout\);

-- Location: FF_X111_Y18_N21
\timer_fsm|s_counter[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \timer_fsm|s_counter[24]~9_combout\,
	asdata => \main_fsm|WideOr10~0_wirecell_combout\,
	sload => \SW[0]~input_o\,
	ena => \timer_fsm|s_counter[2]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_fsm|s_counter\(24));

-- Location: LCCOMB_X112_Y18_N20
\timer_fsm|Add1~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~50_combout\ = (\timer_fsm|s_counter\(25) & (\timer_fsm|Add1~49\ & VCC)) # (!\timer_fsm|s_counter\(25) & (!\timer_fsm|Add1~49\))
-- \timer_fsm|Add1~51\ = CARRY((!\timer_fsm|s_counter\(25) & !\timer_fsm|Add1~49\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|s_counter\(25),
	datad => VCC,
	cin => \timer_fsm|Add1~49\,
	combout => \timer_fsm|Add1~50_combout\,
	cout => \timer_fsm|Add1~51\);

-- Location: LCCOMB_X111_Y18_N14
\timer_fsm|s_counter[25]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|s_counter[25]~10_combout\ = (\main_fsm|Selector1~0_combout\ & ((\timer_fsm|Add0~39_combout\))) # (!\main_fsm|Selector1~0_combout\ & (\timer_fsm|Add1~50_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|Add1~50_combout\,
	datab => \main_fsm|Selector1~0_combout\,
	datad => \timer_fsm|Add0~39_combout\,
	combout => \timer_fsm|s_counter[25]~10_combout\);

-- Location: FF_X111_Y18_N15
\timer_fsm|s_counter[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \timer_fsm|s_counter[25]~10_combout\,
	asdata => \timer_fsm|Mult0|mult_core|_~1_combout\,
	sload => \SW[0]~input_o\,
	ena => \timer_fsm|s_counter[2]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_fsm|s_counter\(25));

-- Location: LCCOMB_X112_Y18_N22
\timer_fsm|Add1~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~52_combout\ = (\timer_fsm|s_counter\(26) & ((GND) # (!\timer_fsm|Add1~51\))) # (!\timer_fsm|s_counter\(26) & (\timer_fsm|Add1~51\ $ (GND)))
-- \timer_fsm|Add1~53\ = CARRY((\timer_fsm|s_counter\(26)) # (!\timer_fsm|Add1~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \timer_fsm|s_counter\(26),
	datad => VCC,
	cin => \timer_fsm|Add1~51\,
	combout => \timer_fsm|Add1~52_combout\,
	cout => \timer_fsm|Add1~53\);

-- Location: LCCOMB_X111_Y18_N24
\timer_fsm|s_counter[26]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|s_counter[26]~11_combout\ = (\main_fsm|Selector1~0_combout\ & (\timer_fsm|Add0~41_combout\)) # (!\main_fsm|Selector1~0_combout\ & ((\timer_fsm|Add1~52_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|Add0~41_combout\,
	datab => \main_fsm|Selector1~0_combout\,
	datad => \timer_fsm|Add1~52_combout\,
	combout => \timer_fsm|s_counter[26]~11_combout\);

-- Location: FF_X111_Y18_N25
\timer_fsm|s_counter[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \timer_fsm|s_counter[26]~11_combout\,
	asdata => \timer_fsm|Mult0|mult_core|_~1_combout\,
	sload => \SW[0]~input_o\,
	ena => \timer_fsm|s_counter[2]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_fsm|s_counter\(26));

-- Location: LCCOMB_X112_Y18_N24
\timer_fsm|Add1~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~54_combout\ = (\timer_fsm|s_counter\(27) & (\timer_fsm|Add1~53\ & VCC)) # (!\timer_fsm|s_counter\(27) & (!\timer_fsm|Add1~53\))
-- \timer_fsm|Add1~55\ = CARRY((!\timer_fsm|s_counter\(27) & !\timer_fsm|Add1~53\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \timer_fsm|s_counter\(27),
	datad => VCC,
	cin => \timer_fsm|Add1~53\,
	combout => \timer_fsm|Add1~54_combout\,
	cout => \timer_fsm|Add1~55\);

-- Location: LCCOMB_X110_Y18_N26
\timer_fsm|s_counter[27]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|s_counter[27]~12_combout\ = (\main_fsm|Selector1~0_combout\ & (\timer_fsm|Add0~43_combout\)) # (!\main_fsm|Selector1~0_combout\ & ((\timer_fsm|Add1~54_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|Selector1~0_combout\,
	datab => \timer_fsm|Add0~43_combout\,
	datad => \timer_fsm|Add1~54_combout\,
	combout => \timer_fsm|s_counter[27]~12_combout\);

-- Location: FF_X110_Y18_N27
\timer_fsm|s_counter[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \timer_fsm|s_counter[27]~12_combout\,
	asdata => \timer_fsm|Mult0|mult_core|_~0_combout\,
	sload => \SW[0]~input_o\,
	ena => \timer_fsm|s_counter[2]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_fsm|s_counter\(27));

-- Location: LCCOMB_X112_Y18_N26
\timer_fsm|Add1~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~56_combout\ = (\timer_fsm|s_counter\(28) & ((GND) # (!\timer_fsm|Add1~55\))) # (!\timer_fsm|s_counter\(28) & (\timer_fsm|Add1~55\ $ (GND)))
-- \timer_fsm|Add1~57\ = CARRY((\timer_fsm|s_counter\(28)) # (!\timer_fsm|Add1~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \timer_fsm|s_counter\(28),
	datad => VCC,
	cin => \timer_fsm|Add1~55\,
	combout => \timer_fsm|Add1~56_combout\,
	cout => \timer_fsm|Add1~57\);

-- Location: LCCOMB_X111_Y18_N18
\timer_fsm|s_counter[28]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|s_counter[28]~13_combout\ = (\main_fsm|Selector1~0_combout\ & (\timer_fsm|Add0~45_combout\)) # (!\main_fsm|Selector1~0_combout\ & ((\timer_fsm|Add1~56_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|Selector1~0_combout\,
	datab => \timer_fsm|Add0~45_combout\,
	datad => \timer_fsm|Add1~56_combout\,
	combout => \timer_fsm|s_counter[28]~13_combout\);

-- Location: FF_X111_Y18_N19
\timer_fsm|s_counter[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \timer_fsm|s_counter[28]~13_combout\,
	asdata => \timer_fsm|Mult0|mult_core|romout[0][28]~0_wirecell_combout\,
	sload => \SW[0]~input_o\,
	ena => \timer_fsm|s_counter[2]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_fsm|s_counter\(28));

-- Location: LCCOMB_X112_Y18_N28
\timer_fsm|Add1~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~58_combout\ = (\timer_fsm|s_counter\(29) & (\timer_fsm|Add1~57\ & VCC)) # (!\timer_fsm|s_counter\(29) & (!\timer_fsm|Add1~57\))
-- \timer_fsm|Add1~59\ = CARRY((!\timer_fsm|s_counter\(29) & !\timer_fsm|Add1~57\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \timer_fsm|s_counter\(29),
	datad => VCC,
	cin => \timer_fsm|Add1~57\,
	combout => \timer_fsm|Add1~58_combout\,
	cout => \timer_fsm|Add1~59\);

-- Location: LCCOMB_X110_Y18_N24
\timer_fsm|s_counter[29]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|s_counter[29]~14_combout\ = (\main_fsm|Selector1~0_combout\ & (\timer_fsm|Add0~47_combout\)) # (!\main_fsm|Selector1~0_combout\ & ((\timer_fsm|Add1~58_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|Selector1~0_combout\,
	datab => \timer_fsm|Add0~47_combout\,
	datad => \timer_fsm|Add1~58_combout\,
	combout => \timer_fsm|s_counter[29]~14_combout\);

-- Location: FF_X110_Y18_N25
\timer_fsm|s_counter[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \timer_fsm|s_counter[29]~14_combout\,
	asdata => \timer_fsm|Mult0|mult_core|_~0_combout\,
	sload => \SW[0]~input_o\,
	ena => \timer_fsm|s_counter[2]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_fsm|s_counter\(29));

-- Location: LCCOMB_X112_Y18_N30
\timer_fsm|Add1~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~60_combout\ = \timer_fsm|s_counter\(30) $ (\timer_fsm|Add1~59\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|s_counter\(30),
	cin => \timer_fsm|Add1~59\,
	combout => \timer_fsm|Add1~60_combout\);

-- Location: LCCOMB_X110_Y18_N22
\timer_fsm|Add0~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add0~49_combout\ = \timer_fsm|Add0~48\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \timer_fsm|Add0~48\,
	combout => \timer_fsm|Add0~49_combout\);

-- Location: LCCOMB_X111_Y19_N20
\timer_fsm|Add0~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add0~51_combout\ = (\main_fsm|Selector1~0_combout\ & ((\timer_fsm|Add0~49_combout\))) # (!\main_fsm|Selector1~0_combout\ & (\timer_fsm|Add1~60_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \main_fsm|Selector1~0_combout\,
	datac => \timer_fsm|Add1~60_combout\,
	datad => \timer_fsm|Add0~49_combout\,
	combout => \timer_fsm|Add0~51_combout\);

-- Location: FF_X111_Y19_N21
\timer_fsm|s_counter[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \timer_fsm|Add0~51_combout\,
	sclr => \SW[0]~input_o\,
	ena => \timer_fsm|s_counter[2]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_fsm|s_counter\(30));

-- Location: LCCOMB_X111_Y19_N2
\timer_fsm|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Equal0~3_combout\ = (!\timer_fsm|s_counter\(14) & (!\timer_fsm|s_counter\(30) & (!\timer_fsm|s_counter\(13) & !\timer_fsm|s_counter\(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|s_counter\(14),
	datab => \timer_fsm|s_counter\(30),
	datac => \timer_fsm|s_counter\(13),
	datad => \timer_fsm|s_counter\(12),
	combout => \timer_fsm|Equal0~3_combout\);

-- Location: LCCOMB_X111_Y19_N8
\timer_fsm|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Equal0~4_combout\ = (\timer_fsm|Equal0~1_combout\ & (\timer_fsm|Equal0~0_combout\ & (\timer_fsm|Equal0~2_combout\ & \timer_fsm|Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|Equal0~1_combout\,
	datab => \timer_fsm|Equal0~0_combout\,
	datac => \timer_fsm|Equal0~2_combout\,
	datad => \timer_fsm|Equal0~3_combout\,
	combout => \timer_fsm|Equal0~4_combout\);

-- Location: LCCOMB_X111_Y18_N26
\timer_fsm|Equal0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Equal0~7_combout\ = (!\timer_fsm|s_counter\(23) & (!\timer_fsm|s_counter\(26) & (!\timer_fsm|s_counter\(25) & !\timer_fsm|s_counter\(24))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|s_counter\(23),
	datab => \timer_fsm|s_counter\(26),
	datac => \timer_fsm|s_counter\(25),
	datad => \timer_fsm|s_counter\(24),
	combout => \timer_fsm|Equal0~7_combout\);

-- Location: LCCOMB_X111_Y18_N4
\timer_fsm|Equal0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Equal0~8_combout\ = (!\timer_fsm|s_counter\(27) & (!\timer_fsm|s_counter\(28) & (\timer_fsm|Equal0~7_combout\ & !\timer_fsm|s_counter\(29))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|s_counter\(27),
	datab => \timer_fsm|s_counter\(28),
	datac => \timer_fsm|Equal0~7_combout\,
	datad => \timer_fsm|s_counter\(29),
	combout => \timer_fsm|Equal0~8_combout\);

-- Location: LCCOMB_X111_Y19_N24
\timer_fsm|Equal0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Equal0~9_combout\ = (\timer_fsm|Equal0~5_combout\ & (\timer_fsm|Equal0~6_combout\ & (\timer_fsm|Equal0~4_combout\ & \timer_fsm|Equal0~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|Equal0~5_combout\,
	datab => \timer_fsm|Equal0~6_combout\,
	datac => \timer_fsm|Equal0~4_combout\,
	datad => \timer_fsm|Equal0~8_combout\,
	combout => \timer_fsm|Equal0~9_combout\);

-- Location: LCCOMB_X111_Y19_N28
\timer_fsm|s_cntZero~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|s_cntZero~0_combout\ = (\main_fsm|selModoGelo~0_combout\ & (((\timer_fsm|s_cntZero~q\)))) # (!\main_fsm|selModoGelo~0_combout\ & (!\main_fsm|Selector1~0_combout\ & ((\timer_fsm|Equal0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|Selector1~0_combout\,
	datab => \main_fsm|selModoGelo~0_combout\,
	datac => \timer_fsm|s_cntZero~q\,
	datad => \timer_fsm|Equal0~9_combout\,
	combout => \timer_fsm|s_cntZero~0_combout\);

-- Location: FF_X111_Y19_N29
\timer_fsm|s_cntZero\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \timer_fsm|s_cntZero~0_combout\,
	sclr => \SW[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_fsm|s_cntZero~q\);

-- Location: LCCOMB_X108_Y19_N6
\main_fsm|s_currentState~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|s_currentState~14_combout\ = (\main_fsm|s_currentState.PREP_SOLI~q\ & ((\register_fsm|dataOut\(4)) # ((\register_fsm|dataOut\(2) & !\timer_fsm|s_cntZero~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_currentState.PREP_SOLI~q\,
	datab => \register_fsm|dataOut\(2),
	datac => \register_fsm|dataOut\(4),
	datad => \timer_fsm|s_cntZero~q\,
	combout => \main_fsm|s_currentState~14_combout\);

-- Location: LCCOMB_X108_Y19_N22
\main_fsm|s_currentState~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|s_currentState~13_combout\ = (!\register_fsm|dataOut\(1) & (\register_fsm|dataOut\(2) & \main_fsm|s_currentState.EREF~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \register_fsm|dataOut\(1),
	datab => \register_fsm|dataOut\(2),
	datad => \main_fsm|s_currentState.EREF~q\,
	combout => \main_fsm|s_currentState~13_combout\);

-- Location: LCCOMB_X108_Y19_N10
\main_fsm|s_currentState~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|s_currentState~15_combout\ = (!\register_fsm|dataOut\(0) & ((\main_fsm|s_currentState~14_combout\) # (\main_fsm|s_currentState~13_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_currentState~14_combout\,
	datab => \main_fsm|s_currentState~13_combout\,
	datad => \register_fsm|dataOut\(0),
	combout => \main_fsm|s_currentState~15_combout\);

-- Location: FF_X108_Y19_N11
\main_fsm|s_currentState.PREP_SOLI\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \main_fsm|s_currentState~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \main_fsm|s_currentState.PREP_SOLI~q\);

-- Location: LCCOMB_X108_Y19_N30
\main_fsm|WideOr18~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|WideOr18~0_combout\ = (\main_fsm|s_currentState.PREP_SOLI~q\) # ((\main_fsm|s_currentState.PREP_SPES~q\) # (\main_fsm|s_currentState.PREP_FAN~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_currentState.PREP_SOLI~q\,
	datac => \main_fsm|s_currentState.PREP_SPES~q\,
	datad => \main_fsm|s_currentState.PREP_FAN~q\,
	combout => \main_fsm|WideOr18~0_combout\);

-- Location: LCCOMB_X109_Y19_N8
\main_fsm|WideOr19~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|WideOr19~0_combout\ = (!\main_fsm|s_currentState.DIS_FAN~q\ & (!\main_fsm|s_currentState.DIS_SPES~q\ & !\main_fsm|s_currentState.DIS_SOLI~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \main_fsm|s_currentState.DIS_FAN~q\,
	datac => \main_fsm|s_currentState.DIS_SPES~q\,
	datad => \main_fsm|s_currentState.DIS_SOLI~q\,
	combout => \main_fsm|WideOr19~0_combout\);

-- Location: LCCOMB_X109_Y24_N2
\clk_div_1hz|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~0_combout\ = \clk_div_1hz|s_divCounter\(0) $ (VCC)
-- \clk_div_1hz|Add0~1\ = CARRY(\clk_div_1hz|s_divCounter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \clk_div_1hz|s_divCounter\(0),
	datad => VCC,
	combout => \clk_div_1hz|Add0~0_combout\,
	cout => \clk_div_1hz|Add0~1\);

-- Location: LCCOMB_X110_Y24_N14
\clk_div_1hz|s_divCounter~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|s_divCounter~10_combout\ = (\clk_div_1hz|Add0~0_combout\ & !\clk_div_1hz|Equal0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|Add0~0_combout\,
	datad => \clk_div_1hz|Equal0~10_combout\,
	combout => \clk_div_1hz|s_divCounter~10_combout\);

-- Location: FF_X109_Y24_N3
\clk_div_1hz|s_divCounter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \clk_div_1hz|s_divCounter~10_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(0));

-- Location: LCCOMB_X109_Y24_N4
\clk_div_1hz|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~2_combout\ = (\clk_div_1hz|s_divCounter\(1) & (!\clk_div_1hz|Add0~1\)) # (!\clk_div_1hz|s_divCounter\(1) & ((\clk_div_1hz|Add0~1\) # (GND)))
-- \clk_div_1hz|Add0~3\ = CARRY((!\clk_div_1hz|Add0~1\) # (!\clk_div_1hz|s_divCounter\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_div_1hz|s_divCounter\(1),
	datad => VCC,
	cin => \clk_div_1hz|Add0~1\,
	combout => \clk_div_1hz|Add0~2_combout\,
	cout => \clk_div_1hz|Add0~3\);

-- Location: FF_X109_Y24_N5
\clk_div_1hz|s_divCounter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clk_div_1hz|Add0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(1));

-- Location: LCCOMB_X109_Y24_N6
\clk_div_1hz|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~4_combout\ = (\clk_div_1hz|s_divCounter\(2) & (\clk_div_1hz|Add0~3\ $ (GND))) # (!\clk_div_1hz|s_divCounter\(2) & (!\clk_div_1hz|Add0~3\ & VCC))
-- \clk_div_1hz|Add0~5\ = CARRY((\clk_div_1hz|s_divCounter\(2) & !\clk_div_1hz|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_div_1hz|s_divCounter\(2),
	datad => VCC,
	cin => \clk_div_1hz|Add0~3\,
	combout => \clk_div_1hz|Add0~4_combout\,
	cout => \clk_div_1hz|Add0~5\);

-- Location: LCCOMB_X110_Y24_N0
\clk_div_1hz|s_divCounter~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|s_divCounter~9_combout\ = (\clk_div_1hz|Add0~4_combout\ & !\clk_div_1hz|Equal0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \clk_div_1hz|Add0~4_combout\,
	datad => \clk_div_1hz|Equal0~10_combout\,
	combout => \clk_div_1hz|s_divCounter~9_combout\);

-- Location: FF_X109_Y24_N29
\clk_div_1hz|s_divCounter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \clk_div_1hz|s_divCounter~9_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(2));

-- Location: LCCOMB_X109_Y24_N8
\clk_div_1hz|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~6_combout\ = (\clk_div_1hz|s_divCounter\(3) & (!\clk_div_1hz|Add0~5\)) # (!\clk_div_1hz|s_divCounter\(3) & ((\clk_div_1hz|Add0~5\) # (GND)))
-- \clk_div_1hz|Add0~7\ = CARRY((!\clk_div_1hz|Add0~5\) # (!\clk_div_1hz|s_divCounter\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_div_1hz|s_divCounter\(3),
	datad => VCC,
	cin => \clk_div_1hz|Add0~5\,
	combout => \clk_div_1hz|Add0~6_combout\,
	cout => \clk_div_1hz|Add0~7\);

-- Location: FF_X109_Y24_N9
\clk_div_1hz|s_divCounter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clk_div_1hz|Add0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(3));

-- Location: LCCOMB_X109_Y24_N10
\clk_div_1hz|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~8_combout\ = (\clk_div_1hz|s_divCounter\(4) & (\clk_div_1hz|Add0~7\ $ (GND))) # (!\clk_div_1hz|s_divCounter\(4) & (!\clk_div_1hz|Add0~7\ & VCC))
-- \clk_div_1hz|Add0~9\ = CARRY((\clk_div_1hz|s_divCounter\(4) & !\clk_div_1hz|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_div_1hz|s_divCounter\(4),
	datad => VCC,
	cin => \clk_div_1hz|Add0~7\,
	combout => \clk_div_1hz|Add0~8_combout\,
	cout => \clk_div_1hz|Add0~9\);

-- Location: LCCOMB_X110_Y24_N12
\clk_div_1hz|s_divCounter~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|s_divCounter~8_combout\ = (!\clk_div_1hz|Equal0~10_combout\ & \clk_div_1hz|Add0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|Equal0~10_combout\,
	datad => \clk_div_1hz|Add0~8_combout\,
	combout => \clk_div_1hz|s_divCounter~8_combout\);

-- Location: FF_X110_Y24_N13
\clk_div_1hz|s_divCounter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clk_div_1hz|s_divCounter~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(4));

-- Location: LCCOMB_X109_Y24_N12
\clk_div_1hz|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~10_combout\ = (\clk_div_1hz|s_divCounter\(5) & (!\clk_div_1hz|Add0~9\)) # (!\clk_div_1hz|s_divCounter\(5) & ((\clk_div_1hz|Add0~9\) # (GND)))
-- \clk_div_1hz|Add0~11\ = CARRY((!\clk_div_1hz|Add0~9\) # (!\clk_div_1hz|s_divCounter\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(5),
	datad => VCC,
	cin => \clk_div_1hz|Add0~9\,
	combout => \clk_div_1hz|Add0~10_combout\,
	cout => \clk_div_1hz|Add0~11\);

-- Location: FF_X109_Y24_N13
\clk_div_1hz|s_divCounter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clk_div_1hz|Add0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(5));

-- Location: LCCOMB_X109_Y24_N14
\clk_div_1hz|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~12_combout\ = (\clk_div_1hz|s_divCounter\(6) & (\clk_div_1hz|Add0~11\ $ (GND))) # (!\clk_div_1hz|s_divCounter\(6) & (!\clk_div_1hz|Add0~11\ & VCC))
-- \clk_div_1hz|Add0~13\ = CARRY((\clk_div_1hz|s_divCounter\(6) & !\clk_div_1hz|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_div_1hz|s_divCounter\(6),
	datad => VCC,
	cin => \clk_div_1hz|Add0~11\,
	combout => \clk_div_1hz|Add0~12_combout\,
	cout => \clk_div_1hz|Add0~13\);

-- Location: FF_X109_Y24_N15
\clk_div_1hz|s_divCounter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clk_div_1hz|Add0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(6));

-- Location: LCCOMB_X109_Y24_N16
\clk_div_1hz|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~14_combout\ = (\clk_div_1hz|s_divCounter\(7) & (!\clk_div_1hz|Add0~13\)) # (!\clk_div_1hz|s_divCounter\(7) & ((\clk_div_1hz|Add0~13\) # (GND)))
-- \clk_div_1hz|Add0~15\ = CARRY((!\clk_div_1hz|Add0~13\) # (!\clk_div_1hz|s_divCounter\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_div_1hz|s_divCounter\(7),
	datad => VCC,
	cin => \clk_div_1hz|Add0~13\,
	combout => \clk_div_1hz|Add0~14_combout\,
	cout => \clk_div_1hz|Add0~15\);

-- Location: FF_X109_Y24_N17
\clk_div_1hz|s_divCounter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clk_div_1hz|Add0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(7));

-- Location: LCCOMB_X109_Y24_N18
\clk_div_1hz|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~16_combout\ = (\clk_div_1hz|s_divCounter\(8) & (\clk_div_1hz|Add0~15\ $ (GND))) # (!\clk_div_1hz|s_divCounter\(8) & (!\clk_div_1hz|Add0~15\ & VCC))
-- \clk_div_1hz|Add0~17\ = CARRY((\clk_div_1hz|s_divCounter\(8) & !\clk_div_1hz|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_div_1hz|s_divCounter\(8),
	datad => VCC,
	cin => \clk_div_1hz|Add0~15\,
	combout => \clk_div_1hz|Add0~16_combout\,
	cout => \clk_div_1hz|Add0~17\);

-- Location: FF_X109_Y24_N19
\clk_div_1hz|s_divCounter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clk_div_1hz|Add0~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(8));

-- Location: LCCOMB_X109_Y24_N20
\clk_div_1hz|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~18_combout\ = (\clk_div_1hz|s_divCounter\(9) & (!\clk_div_1hz|Add0~17\)) # (!\clk_div_1hz|s_divCounter\(9) & ((\clk_div_1hz|Add0~17\) # (GND)))
-- \clk_div_1hz|Add0~19\ = CARRY((!\clk_div_1hz|Add0~17\) # (!\clk_div_1hz|s_divCounter\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_div_1hz|s_divCounter\(9),
	datad => VCC,
	cin => \clk_div_1hz|Add0~17\,
	combout => \clk_div_1hz|Add0~18_combout\,
	cout => \clk_div_1hz|Add0~19\);

-- Location: FF_X109_Y24_N21
\clk_div_1hz|s_divCounter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clk_div_1hz|Add0~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(9));

-- Location: LCCOMB_X109_Y24_N22
\clk_div_1hz|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~20_combout\ = (\clk_div_1hz|s_divCounter\(10) & (\clk_div_1hz|Add0~19\ $ (GND))) # (!\clk_div_1hz|s_divCounter\(10) & (!\clk_div_1hz|Add0~19\ & VCC))
-- \clk_div_1hz|Add0~21\ = CARRY((\clk_div_1hz|s_divCounter\(10) & !\clk_div_1hz|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(10),
	datad => VCC,
	cin => \clk_div_1hz|Add0~19\,
	combout => \clk_div_1hz|Add0~20_combout\,
	cout => \clk_div_1hz|Add0~21\);

-- Location: FF_X109_Y24_N23
\clk_div_1hz|s_divCounter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clk_div_1hz|Add0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(10));

-- Location: LCCOMB_X109_Y24_N24
\clk_div_1hz|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~22_combout\ = (\clk_div_1hz|s_divCounter\(11) & (!\clk_div_1hz|Add0~21\)) # (!\clk_div_1hz|s_divCounter\(11) & ((\clk_div_1hz|Add0~21\) # (GND)))
-- \clk_div_1hz|Add0~23\ = CARRY((!\clk_div_1hz|Add0~21\) # (!\clk_div_1hz|s_divCounter\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_div_1hz|s_divCounter\(11),
	datad => VCC,
	cin => \clk_div_1hz|Add0~21\,
	combout => \clk_div_1hz|Add0~22_combout\,
	cout => \clk_div_1hz|Add0~23\);

-- Location: LCCOMB_X109_Y24_N0
\clk_div_1hz|s_divCounter~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|s_divCounter~7_combout\ = (!\clk_div_1hz|Equal0~10_combout\ & \clk_div_1hz|Add0~22_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \clk_div_1hz|Equal0~10_combout\,
	datad => \clk_div_1hz|Add0~22_combout\,
	combout => \clk_div_1hz|s_divCounter~7_combout\);

-- Location: FF_X109_Y24_N1
\clk_div_1hz|s_divCounter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clk_div_1hz|s_divCounter~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(11));

-- Location: LCCOMB_X109_Y24_N26
\clk_div_1hz|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~24_combout\ = (\clk_div_1hz|s_divCounter\(12) & (\clk_div_1hz|Add0~23\ $ (GND))) # (!\clk_div_1hz|s_divCounter\(12) & (!\clk_div_1hz|Add0~23\ & VCC))
-- \clk_div_1hz|Add0~25\ = CARRY((\clk_div_1hz|s_divCounter\(12) & !\clk_div_1hz|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(12),
	datad => VCC,
	cin => \clk_div_1hz|Add0~23\,
	combout => \clk_div_1hz|Add0~24_combout\,
	cout => \clk_div_1hz|Add0~25\);

-- Location: FF_X109_Y24_N27
\clk_div_1hz|s_divCounter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clk_div_1hz|Add0~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(12));

-- Location: LCCOMB_X109_Y24_N28
\clk_div_1hz|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~26_combout\ = (\clk_div_1hz|s_divCounter\(13) & (!\clk_div_1hz|Add0~25\)) # (!\clk_div_1hz|s_divCounter\(13) & ((\clk_div_1hz|Add0~25\) # (GND)))
-- \clk_div_1hz|Add0~27\ = CARRY((!\clk_div_1hz|Add0~25\) # (!\clk_div_1hz|s_divCounter\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(13),
	datad => VCC,
	cin => \clk_div_1hz|Add0~25\,
	combout => \clk_div_1hz|Add0~26_combout\,
	cout => \clk_div_1hz|Add0~27\);

-- Location: LCCOMB_X110_Y24_N4
\clk_div_1hz|s_divCounter~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|s_divCounter~6_combout\ = (!\clk_div_1hz|Equal0~10_combout\ & \clk_div_1hz|Add0~26_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|Equal0~10_combout\,
	datad => \clk_div_1hz|Add0~26_combout\,
	combout => \clk_div_1hz|s_divCounter~6_combout\);

-- Location: FF_X110_Y24_N5
\clk_div_1hz|s_divCounter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clk_div_1hz|s_divCounter~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(13));

-- Location: LCCOMB_X109_Y24_N30
\clk_div_1hz|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~28_combout\ = (\clk_div_1hz|s_divCounter\(14) & (\clk_div_1hz|Add0~27\ $ (GND))) # (!\clk_div_1hz|s_divCounter\(14) & (!\clk_div_1hz|Add0~27\ & VCC))
-- \clk_div_1hz|Add0~29\ = CARRY((\clk_div_1hz|s_divCounter\(14) & !\clk_div_1hz|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(14),
	datad => VCC,
	cin => \clk_div_1hz|Add0~27\,
	combout => \clk_div_1hz|Add0~28_combout\,
	cout => \clk_div_1hz|Add0~29\);

-- Location: FF_X109_Y24_N31
\clk_div_1hz|s_divCounter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clk_div_1hz|Add0~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(14));

-- Location: LCCOMB_X109_Y23_N0
\clk_div_1hz|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~30_combout\ = (\clk_div_1hz|s_divCounter\(15) & (!\clk_div_1hz|Add0~29\)) # (!\clk_div_1hz|s_divCounter\(15) & ((\clk_div_1hz|Add0~29\) # (GND)))
-- \clk_div_1hz|Add0~31\ = CARRY((!\clk_div_1hz|Add0~29\) # (!\clk_div_1hz|s_divCounter\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_div_1hz|s_divCounter\(15),
	datad => VCC,
	cin => \clk_div_1hz|Add0~29\,
	combout => \clk_div_1hz|Add0~30_combout\,
	cout => \clk_div_1hz|Add0~31\);

-- Location: FF_X109_Y23_N1
\clk_div_1hz|s_divCounter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clk_div_1hz|Add0~30_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(15));

-- Location: LCCOMB_X109_Y23_N2
\clk_div_1hz|Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~32_combout\ = (\clk_div_1hz|s_divCounter\(16) & (\clk_div_1hz|Add0~31\ $ (GND))) # (!\clk_div_1hz|s_divCounter\(16) & (!\clk_div_1hz|Add0~31\ & VCC))
-- \clk_div_1hz|Add0~33\ = CARRY((\clk_div_1hz|s_divCounter\(16) & !\clk_div_1hz|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_div_1hz|s_divCounter\(16),
	datad => VCC,
	cin => \clk_div_1hz|Add0~31\,
	combout => \clk_div_1hz|Add0~32_combout\,
	cout => \clk_div_1hz|Add0~33\);

-- Location: LCCOMB_X110_Y23_N12
\clk_div_1hz|s_divCounter~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|s_divCounter~5_combout\ = (!\clk_div_1hz|Equal0~10_combout\ & \clk_div_1hz|Add0~32_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \clk_div_1hz|Equal0~10_combout\,
	datad => \clk_div_1hz|Add0~32_combout\,
	combout => \clk_div_1hz|s_divCounter~5_combout\);

-- Location: FF_X110_Y23_N13
\clk_div_1hz|s_divCounter[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clk_div_1hz|s_divCounter~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(16));

-- Location: LCCOMB_X109_Y23_N4
\clk_div_1hz|Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~34_combout\ = (\clk_div_1hz|s_divCounter\(17) & (!\clk_div_1hz|Add0~33\)) # (!\clk_div_1hz|s_divCounter\(17) & ((\clk_div_1hz|Add0~33\) # (GND)))
-- \clk_div_1hz|Add0~35\ = CARRY((!\clk_div_1hz|Add0~33\) # (!\clk_div_1hz|s_divCounter\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(17),
	datad => VCC,
	cin => \clk_div_1hz|Add0~33\,
	combout => \clk_div_1hz|Add0~34_combout\,
	cout => \clk_div_1hz|Add0~35\);

-- Location: LCCOMB_X110_Y23_N2
\clk_div_1hz|s_divCounter~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|s_divCounter~4_combout\ = (!\clk_div_1hz|Equal0~10_combout\ & \clk_div_1hz|Add0~34_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|Equal0~10_combout\,
	datac => \clk_div_1hz|Add0~34_combout\,
	combout => \clk_div_1hz|s_divCounter~4_combout\);

-- Location: FF_X110_Y23_N3
\clk_div_1hz|s_divCounter[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clk_div_1hz|s_divCounter~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(17));

-- Location: LCCOMB_X109_Y23_N6
\clk_div_1hz|Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~36_combout\ = (\clk_div_1hz|s_divCounter\(18) & (\clk_div_1hz|Add0~35\ $ (GND))) # (!\clk_div_1hz|s_divCounter\(18) & (!\clk_div_1hz|Add0~35\ & VCC))
-- \clk_div_1hz|Add0~37\ = CARRY((\clk_div_1hz|s_divCounter\(18) & !\clk_div_1hz|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_div_1hz|s_divCounter\(18),
	datad => VCC,
	cin => \clk_div_1hz|Add0~35\,
	combout => \clk_div_1hz|Add0~36_combout\,
	cout => \clk_div_1hz|Add0~37\);

-- Location: LCCOMB_X110_Y23_N18
\clk_div_1hz|s_divCounter~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|s_divCounter~3_combout\ = (!\clk_div_1hz|Equal0~10_combout\ & \clk_div_1hz|Add0~36_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|Equal0~10_combout\,
	datac => \clk_div_1hz|Add0~36_combout\,
	combout => \clk_div_1hz|s_divCounter~3_combout\);

-- Location: FF_X110_Y23_N19
\clk_div_1hz|s_divCounter[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clk_div_1hz|s_divCounter~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(18));

-- Location: LCCOMB_X109_Y23_N8
\clk_div_1hz|Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~38_combout\ = (\clk_div_1hz|s_divCounter\(19) & (!\clk_div_1hz|Add0~37\)) # (!\clk_div_1hz|s_divCounter\(19) & ((\clk_div_1hz|Add0~37\) # (GND)))
-- \clk_div_1hz|Add0~39\ = CARRY((!\clk_div_1hz|Add0~37\) # (!\clk_div_1hz|s_divCounter\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_div_1hz|s_divCounter\(19),
	datad => VCC,
	cin => \clk_div_1hz|Add0~37\,
	combout => \clk_div_1hz|Add0~38_combout\,
	cout => \clk_div_1hz|Add0~39\);

-- Location: LCCOMB_X110_Y23_N24
\clk_div_1hz|s_divCounter~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|s_divCounter~2_combout\ = (!\clk_div_1hz|Equal0~10_combout\ & \clk_div_1hz|Add0~38_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \clk_div_1hz|Equal0~10_combout\,
	datad => \clk_div_1hz|Add0~38_combout\,
	combout => \clk_div_1hz|s_divCounter~2_combout\);

-- Location: FF_X110_Y23_N25
\clk_div_1hz|s_divCounter[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clk_div_1hz|s_divCounter~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(19));

-- Location: LCCOMB_X109_Y23_N10
\clk_div_1hz|Add0~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~40_combout\ = (\clk_div_1hz|s_divCounter\(20) & (\clk_div_1hz|Add0~39\ $ (GND))) # (!\clk_div_1hz|s_divCounter\(20) & (!\clk_div_1hz|Add0~39\ & VCC))
-- \clk_div_1hz|Add0~41\ = CARRY((\clk_div_1hz|s_divCounter\(20) & !\clk_div_1hz|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(20),
	datad => VCC,
	cin => \clk_div_1hz|Add0~39\,
	combout => \clk_div_1hz|Add0~40_combout\,
	cout => \clk_div_1hz|Add0~41\);

-- Location: LCCOMB_X110_Y23_N6
\clk_div_1hz|s_divCounter~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|s_divCounter~1_combout\ = (!\clk_div_1hz|Equal0~10_combout\ & \clk_div_1hz|Add0~40_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \clk_div_1hz|Equal0~10_combout\,
	datad => \clk_div_1hz|Add0~40_combout\,
	combout => \clk_div_1hz|s_divCounter~1_combout\);

-- Location: FF_X110_Y23_N7
\clk_div_1hz|s_divCounter[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clk_div_1hz|s_divCounter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(20));

-- Location: LCCOMB_X109_Y23_N12
\clk_div_1hz|Add0~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~42_combout\ = (\clk_div_1hz|s_divCounter\(21) & (!\clk_div_1hz|Add0~41\)) # (!\clk_div_1hz|s_divCounter\(21) & ((\clk_div_1hz|Add0~41\) # (GND)))
-- \clk_div_1hz|Add0~43\ = CARRY((!\clk_div_1hz|Add0~41\) # (!\clk_div_1hz|s_divCounter\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(21),
	datad => VCC,
	cin => \clk_div_1hz|Add0~41\,
	combout => \clk_div_1hz|Add0~42_combout\,
	cout => \clk_div_1hz|Add0~43\);

-- Location: LCCOMB_X110_Y23_N20
\clk_div_1hz|s_divCounter~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|s_divCounter~0_combout\ = (!\clk_div_1hz|Equal0~10_combout\ & \clk_div_1hz|Add0~42_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \clk_div_1hz|Equal0~10_combout\,
	datad => \clk_div_1hz|Add0~42_combout\,
	combout => \clk_div_1hz|s_divCounter~0_combout\);

-- Location: FF_X110_Y23_N21
\clk_div_1hz|s_divCounter[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clk_div_1hz|s_divCounter~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(21));

-- Location: LCCOMB_X109_Y23_N14
\clk_div_1hz|Add0~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~44_combout\ = (\clk_div_1hz|s_divCounter\(22) & (\clk_div_1hz|Add0~43\ $ (GND))) # (!\clk_div_1hz|s_divCounter\(22) & (!\clk_div_1hz|Add0~43\ & VCC))
-- \clk_div_1hz|Add0~45\ = CARRY((\clk_div_1hz|s_divCounter\(22) & !\clk_div_1hz|Add0~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(22),
	datad => VCC,
	cin => \clk_div_1hz|Add0~43\,
	combout => \clk_div_1hz|Add0~44_combout\,
	cout => \clk_div_1hz|Add0~45\);

-- Location: LCCOMB_X110_Y24_N16
\clk_div_1hz|s_divCounter~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|s_divCounter~11_combout\ = (!\clk_div_1hz|Equal0~10_combout\ & \clk_div_1hz|Add0~44_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|Equal0~10_combout\,
	datad => \clk_div_1hz|Add0~44_combout\,
	combout => \clk_div_1hz|s_divCounter~11_combout\);

-- Location: FF_X110_Y24_N17
\clk_div_1hz|s_divCounter[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clk_div_1hz|s_divCounter~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(22));

-- Location: LCCOMB_X109_Y23_N16
\clk_div_1hz|Add0~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~46_combout\ = (\clk_div_1hz|s_divCounter\(23) & (!\clk_div_1hz|Add0~45\)) # (!\clk_div_1hz|s_divCounter\(23) & ((\clk_div_1hz|Add0~45\) # (GND)))
-- \clk_div_1hz|Add0~47\ = CARRY((!\clk_div_1hz|Add0~45\) # (!\clk_div_1hz|s_divCounter\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_div_1hz|s_divCounter\(23),
	datad => VCC,
	cin => \clk_div_1hz|Add0~45\,
	combout => \clk_div_1hz|Add0~46_combout\,
	cout => \clk_div_1hz|Add0~47\);

-- Location: FF_X109_Y23_N17
\clk_div_1hz|s_divCounter[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clk_div_1hz|Add0~46_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(23));

-- Location: LCCOMB_X109_Y23_N18
\clk_div_1hz|Add0~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~48_combout\ = (\clk_div_1hz|s_divCounter\(24) & (\clk_div_1hz|Add0~47\ $ (GND))) # (!\clk_div_1hz|s_divCounter\(24) & (!\clk_div_1hz|Add0~47\ & VCC))
-- \clk_div_1hz|Add0~49\ = CARRY((\clk_div_1hz|s_divCounter\(24) & !\clk_div_1hz|Add0~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_div_1hz|s_divCounter\(24),
	datad => VCC,
	cin => \clk_div_1hz|Add0~47\,
	combout => \clk_div_1hz|Add0~48_combout\,
	cout => \clk_div_1hz|Add0~49\);

-- Location: FF_X109_Y23_N19
\clk_div_1hz|s_divCounter[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clk_div_1hz|Add0~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(24));

-- Location: LCCOMB_X109_Y23_N20
\clk_div_1hz|Add0~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~50_combout\ = (\clk_div_1hz|s_divCounter\(25) & (!\clk_div_1hz|Add0~49\)) # (!\clk_div_1hz|s_divCounter\(25) & ((\clk_div_1hz|Add0~49\) # (GND)))
-- \clk_div_1hz|Add0~51\ = CARRY((!\clk_div_1hz|Add0~49\) # (!\clk_div_1hz|s_divCounter\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_div_1hz|s_divCounter\(25),
	datad => VCC,
	cin => \clk_div_1hz|Add0~49\,
	combout => \clk_div_1hz|Add0~50_combout\,
	cout => \clk_div_1hz|Add0~51\);

-- Location: FF_X109_Y23_N21
\clk_div_1hz|s_divCounter[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clk_div_1hz|Add0~50_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(25));

-- Location: LCCOMB_X109_Y23_N22
\clk_div_1hz|Add0~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~52_combout\ = (\clk_div_1hz|s_divCounter\(26) & (\clk_div_1hz|Add0~51\ $ (GND))) # (!\clk_div_1hz|s_divCounter\(26) & (!\clk_div_1hz|Add0~51\ & VCC))
-- \clk_div_1hz|Add0~53\ = CARRY((\clk_div_1hz|s_divCounter\(26) & !\clk_div_1hz|Add0~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(26),
	datad => VCC,
	cin => \clk_div_1hz|Add0~51\,
	combout => \clk_div_1hz|Add0~52_combout\,
	cout => \clk_div_1hz|Add0~53\);

-- Location: FF_X109_Y23_N23
\clk_div_1hz|s_divCounter[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clk_div_1hz|Add0~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(26));

-- Location: LCCOMB_X109_Y23_N24
\clk_div_1hz|Add0~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~54_combout\ = (\clk_div_1hz|s_divCounter\(27) & (!\clk_div_1hz|Add0~53\)) # (!\clk_div_1hz|s_divCounter\(27) & ((\clk_div_1hz|Add0~53\) # (GND)))
-- \clk_div_1hz|Add0~55\ = CARRY((!\clk_div_1hz|Add0~53\) # (!\clk_div_1hz|s_divCounter\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_div_1hz|s_divCounter\(27),
	datad => VCC,
	cin => \clk_div_1hz|Add0~53\,
	combout => \clk_div_1hz|Add0~54_combout\,
	cout => \clk_div_1hz|Add0~55\);

-- Location: FF_X109_Y23_N25
\clk_div_1hz|s_divCounter[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clk_div_1hz|Add0~54_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(27));

-- Location: LCCOMB_X109_Y23_N26
\clk_div_1hz|Add0~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~56_combout\ = (\clk_div_1hz|s_divCounter\(28) & (\clk_div_1hz|Add0~55\ $ (GND))) # (!\clk_div_1hz|s_divCounter\(28) & (!\clk_div_1hz|Add0~55\ & VCC))
-- \clk_div_1hz|Add0~57\ = CARRY((\clk_div_1hz|s_divCounter\(28) & !\clk_div_1hz|Add0~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(28),
	datad => VCC,
	cin => \clk_div_1hz|Add0~55\,
	combout => \clk_div_1hz|Add0~56_combout\,
	cout => \clk_div_1hz|Add0~57\);

-- Location: FF_X109_Y23_N27
\clk_div_1hz|s_divCounter[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clk_div_1hz|Add0~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(28));

-- Location: LCCOMB_X109_Y23_N28
\clk_div_1hz|Add0~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~58_combout\ = (\clk_div_1hz|s_divCounter\(29) & (!\clk_div_1hz|Add0~57\)) # (!\clk_div_1hz|s_divCounter\(29) & ((\clk_div_1hz|Add0~57\) # (GND)))
-- \clk_div_1hz|Add0~59\ = CARRY((!\clk_div_1hz|Add0~57\) # (!\clk_div_1hz|s_divCounter\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_div_1hz|s_divCounter\(29),
	datad => VCC,
	cin => \clk_div_1hz|Add0~57\,
	combout => \clk_div_1hz|Add0~58_combout\,
	cout => \clk_div_1hz|Add0~59\);

-- Location: FF_X109_Y23_N29
\clk_div_1hz|s_divCounter[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clk_div_1hz|Add0~58_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(29));

-- Location: LCCOMB_X109_Y23_N30
\clk_div_1hz|Add0~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~60_combout\ = \clk_div_1hz|s_divCounter\(30) $ (!\clk_div_1hz|Add0~59\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(30),
	cin => \clk_div_1hz|Add0~59\,
	combout => \clk_div_1hz|Add0~60_combout\);

-- Location: FF_X109_Y23_N31
\clk_div_1hz|s_divCounter[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clk_div_1hz|Add0~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(30));

-- Location: LCCOMB_X110_Y24_N30
\clk_div_1hz|Equal0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Equal0~8_combout\ = (\clk_div_1hz|s_divCounter\(2) & (\clk_div_1hz|s_divCounter\(4) & (!\clk_div_1hz|s_divCounter\(3) & !\clk_div_1hz|s_divCounter\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(2),
	datab => \clk_div_1hz|s_divCounter\(4),
	datac => \clk_div_1hz|s_divCounter\(3),
	datad => \clk_div_1hz|s_divCounter\(10),
	combout => \clk_div_1hz|Equal0~8_combout\);

-- Location: LCCOMB_X110_Y24_N8
\clk_div_1hz|Equal0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Equal0~7_combout\ = (!\clk_div_1hz|s_divCounter\(12) & (\clk_div_1hz|s_divCounter\(13) & (!\clk_div_1hz|s_divCounter\(15) & \clk_div_1hz|s_divCounter\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(12),
	datab => \clk_div_1hz|s_divCounter\(13),
	datac => \clk_div_1hz|s_divCounter\(15),
	datad => \clk_div_1hz|s_divCounter\(11),
	combout => \clk_div_1hz|Equal0~7_combout\);

-- Location: LCCOMB_X110_Y24_N20
\clk_div_1hz|Equal0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Equal0~9_combout\ = (\clk_div_1hz|Equal0~8_combout\ & (\clk_div_1hz|s_divCounter\(22) & (\clk_div_1hz|Equal0~7_combout\ & !\clk_div_1hz|s_divCounter\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|Equal0~8_combout\,
	datab => \clk_div_1hz|s_divCounter\(22),
	datac => \clk_div_1hz|Equal0~7_combout\,
	datad => \clk_div_1hz|s_divCounter\(0),
	combout => \clk_div_1hz|Equal0~9_combout\);

-- Location: LCCOMB_X110_Y23_N22
\clk_div_1hz|Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Equal0~5_combout\ = (!\clk_div_1hz|s_divCounter\(29) & (!\clk_div_1hz|s_divCounter\(27) & (!\clk_div_1hz|s_divCounter\(28) & !\clk_div_1hz|s_divCounter\(26))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(29),
	datab => \clk_div_1hz|s_divCounter\(27),
	datac => \clk_div_1hz|s_divCounter\(28),
	datad => \clk_div_1hz|s_divCounter\(26),
	combout => \clk_div_1hz|Equal0~5_combout\);

-- Location: LCCOMB_X110_Y24_N26
\clk_div_1hz|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Equal0~2_combout\ = (!\clk_div_1hz|s_divCounter\(6) & (!\clk_div_1hz|s_divCounter\(8) & (!\clk_div_1hz|s_divCounter\(7) & !\clk_div_1hz|s_divCounter\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(6),
	datab => \clk_div_1hz|s_divCounter\(8),
	datac => \clk_div_1hz|s_divCounter\(7),
	datad => \clk_div_1hz|s_divCounter\(5),
	combout => \clk_div_1hz|Equal0~2_combout\);

-- Location: LCCOMB_X110_Y23_N0
\clk_div_1hz|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Equal0~3_combout\ = (!\clk_div_1hz|s_divCounter\(23) & (!\clk_div_1hz|s_divCounter\(25) & (!\clk_div_1hz|s_divCounter\(1) & !\clk_div_1hz|s_divCounter\(24))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(23),
	datab => \clk_div_1hz|s_divCounter\(25),
	datac => \clk_div_1hz|s_divCounter\(1),
	datad => \clk_div_1hz|s_divCounter\(24),
	combout => \clk_div_1hz|Equal0~3_combout\);

-- Location: LCCOMB_X110_Y23_N4
\clk_div_1hz|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Equal0~0_combout\ = (\clk_div_1hz|s_divCounter\(20) & (\clk_div_1hz|s_divCounter\(21) & (\clk_div_1hz|s_divCounter\(19) & \clk_div_1hz|s_divCounter\(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(20),
	datab => \clk_div_1hz|s_divCounter\(21),
	datac => \clk_div_1hz|s_divCounter\(19),
	datad => \clk_div_1hz|s_divCounter\(18),
	combout => \clk_div_1hz|Equal0~0_combout\);

-- Location: LCCOMB_X110_Y23_N14
\clk_div_1hz|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Equal0~1_combout\ = (\clk_div_1hz|s_divCounter\(16) & (\clk_div_1hz|s_divCounter\(17) & (!\clk_div_1hz|s_divCounter\(14) & !\clk_div_1hz|s_divCounter\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(16),
	datab => \clk_div_1hz|s_divCounter\(17),
	datac => \clk_div_1hz|s_divCounter\(14),
	datad => \clk_div_1hz|s_divCounter\(9),
	combout => \clk_div_1hz|Equal0~1_combout\);

-- Location: LCCOMB_X110_Y24_N24
\clk_div_1hz|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Equal0~4_combout\ = (\clk_div_1hz|Equal0~2_combout\ & (\clk_div_1hz|Equal0~3_combout\ & (\clk_div_1hz|Equal0~0_combout\ & \clk_div_1hz|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|Equal0~2_combout\,
	datab => \clk_div_1hz|Equal0~3_combout\,
	datac => \clk_div_1hz|Equal0~0_combout\,
	datad => \clk_div_1hz|Equal0~1_combout\,
	combout => \clk_div_1hz|Equal0~4_combout\);

-- Location: LCCOMB_X110_Y24_N10
\clk_div_1hz|Equal0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Equal0~10_combout\ = (!\clk_div_1hz|s_divCounter\(30) & (\clk_div_1hz|Equal0~9_combout\ & (\clk_div_1hz|Equal0~5_combout\ & \clk_div_1hz|Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(30),
	datab => \clk_div_1hz|Equal0~9_combout\,
	datac => \clk_div_1hz|Equal0~5_combout\,
	datad => \clk_div_1hz|Equal0~4_combout\,
	combout => \clk_div_1hz|Equal0~10_combout\);

-- Location: LCCOMB_X110_Y24_N6
\clk_div_1hz|clkOut~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|clkOut~1_combout\ = (!\clk_div_1hz|s_divCounter\(2) & (!\clk_div_1hz|s_divCounter\(4) & (\clk_div_1hz|s_divCounter\(3) & \clk_div_1hz|s_divCounter\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(2),
	datab => \clk_div_1hz|s_divCounter\(4),
	datac => \clk_div_1hz|s_divCounter\(3),
	datad => \clk_div_1hz|s_divCounter\(10),
	combout => \clk_div_1hz|clkOut~1_combout\);

-- Location: LCCOMB_X110_Y24_N22
\clk_div_1hz|clkOut~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|clkOut~0_combout\ = (\clk_div_1hz|s_divCounter\(15) & (!\clk_div_1hz|s_divCounter\(13) & (\clk_div_1hz|s_divCounter\(12) & !\clk_div_1hz|s_divCounter\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(15),
	datab => \clk_div_1hz|s_divCounter\(13),
	datac => \clk_div_1hz|s_divCounter\(12),
	datad => \clk_div_1hz|s_divCounter\(11),
	combout => \clk_div_1hz|clkOut~0_combout\);

-- Location: LCCOMB_X110_Y24_N2
\clk_div_1hz|clkOut~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|clkOut~2_combout\ = (\clk_div_1hz|clkOut~1_combout\ & (!\clk_div_1hz|s_divCounter\(22) & (\clk_div_1hz|clkOut~0_combout\ & \clk_div_1hz|s_divCounter\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|clkOut~1_combout\,
	datab => \clk_div_1hz|s_divCounter\(22),
	datac => \clk_div_1hz|clkOut~0_combout\,
	datad => \clk_div_1hz|s_divCounter\(0),
	combout => \clk_div_1hz|clkOut~2_combout\);

-- Location: LCCOMB_X110_Y24_N18
\clk_div_1hz|Equal0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Equal0~6_combout\ = (!\clk_div_1hz|s_divCounter\(30) & (\clk_div_1hz|Equal0~5_combout\ & \clk_div_1hz|Equal0~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(30),
	datac => \clk_div_1hz|Equal0~5_combout\,
	datad => \clk_div_1hz|Equal0~4_combout\,
	combout => \clk_div_1hz|Equal0~6_combout\);

-- Location: LCCOMB_X110_Y24_N28
\clk_div_1hz|clkOut~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|clkOut~3_combout\ = (!\clk_div_1hz|Equal0~10_combout\ & ((\clk_div_1hz|clkOut~q\) # ((\clk_div_1hz|clkOut~2_combout\ & \clk_div_1hz|Equal0~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|Equal0~10_combout\,
	datab => \clk_div_1hz|clkOut~2_combout\,
	datac => \clk_div_1hz|clkOut~q\,
	datad => \clk_div_1hz|Equal0~6_combout\,
	combout => \clk_div_1hz|clkOut~3_combout\);

-- Location: FF_X110_Y24_N29
\clk_div_1hz|clkOut\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clk_div_1hz|clkOut~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|clkOut~q\);

-- Location: LCCOMB_X114_Y19_N10
\dec_word0|decOut_n[5]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dec_word0|decOut_n[5]~0_combout\ = (!\main_fsm|s_currentState.DIS_FAN~q\ & (!\main_fsm|s_currentState.PREP_FAN~q\ & ((\clk_div_1hz|clkOut~q\) # (!\main_fsm|s_currentState.START_DONE~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_currentState.START_DONE~q\,
	datab => \main_fsm|s_currentState.DIS_FAN~q\,
	datac => \clk_div_1hz|clkOut~q\,
	datad => \main_fsm|s_currentState.PREP_FAN~q\,
	combout => \dec_word0|decOut_n[5]~0_combout\);

-- Location: LCCOMB_X114_Y19_N24
\main_fsm|WideOr17\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|WideOr17~combout\ = (\main_fsm|s_currentState.PREP_FAN~q\) # ((\main_fsm|s_currentState.EREF~q\) # (\main_fsm|s_currentState.DIS_FAN~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_currentState.PREP_FAN~q\,
	datac => \main_fsm|s_currentState.EREF~q\,
	datad => \main_fsm|s_currentState.DIS_FAN~q\,
	combout => \main_fsm|WideOr17~combout\);

-- Location: LCCOMB_X109_Y19_N22
\dec_word0|decOut_n[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \dec_word0|decOut_n[0]~1_combout\ = ((!\main_fsm|WideOr17~combout\ & (!\main_fsm|s_currentState.DIS_SPES~q\ & !\main_fsm|s_currentState.PREP_SPES~q\))) # (!\dec_word0|decOut_n[5]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dec_word0|decOut_n[5]~0_combout\,
	datab => \main_fsm|WideOr17~combout\,
	datac => \main_fsm|s_currentState.DIS_SPES~q\,
	datad => \main_fsm|s_currentState.PREP_SPES~q\,
	combout => \dec_word0|decOut_n[0]~1_combout\);

-- Location: LCCOMB_X109_Y19_N4
\dec_word0|decOut_n[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \dec_word0|decOut_n[2]~2_combout\ = ((!\main_fsm|s_currentState.PREP_SPES~q\ & !\main_fsm|s_currentState.DIS_SPES~q\)) # (!\dec_word0|decOut_n[5]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_currentState.PREP_SPES~q\,
	datac => \main_fsm|s_currentState.DIS_SPES~q\,
	datad => \dec_word0|decOut_n[5]~0_combout\,
	combout => \dec_word0|decOut_n[2]~2_combout\);

-- Location: LCCOMB_X109_Y19_N26
\dec_word0|decOut_n[4]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \dec_word0|decOut_n[4]~3_combout\ = (\main_fsm|s_currentState.DIS_SPES~q\) # ((\main_fsm|s_currentState.PREP_SPES~q\) # (!\dec_word0|decOut_n[5]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_currentState.DIS_SPES~q\,
	datab => \dec_word0|decOut_n[5]~0_combout\,
	datad => \main_fsm|s_currentState.PREP_SPES~q\,
	combout => \dec_word0|decOut_n[4]~3_combout\);

-- Location: LCCOMB_X114_Y19_N6
\main_fsm|enable~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|enable~0_combout\ = (\clk_div_1hz|clkOut~q\) # (!\main_fsm|s_currentState.START_DONE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_currentState.START_DONE~q\,
	datad => \clk_div_1hz|clkOut~q\,
	combout => \main_fsm|enable~0_combout\);

-- Location: LCCOMB_X114_Y19_N20
\main_fsm|WideOr16~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|WideOr16~0_combout\ = (!\main_fsm|s_currentState.PREP_FAN~q\ & !\main_fsm|s_currentState.DIS_FAN~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_currentState.PREP_FAN~q\,
	datad => \main_fsm|s_currentState.DIS_FAN~q\,
	combout => \main_fsm|WideOr16~0_combout\);

-- Location: LCCOMB_X113_Y19_N24
\main_fsm|WideOr15~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|WideOr15~0_combout\ = (\main_fsm|s_currentState.START_DONE~q\) # ((\main_fsm|s_currentState.PREP_SOLI~q\) # ((\main_fsm|s_currentState.DIS_SOLI~q\) # (!\main_fsm|s_currentState.START~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_currentState.START_DONE~q\,
	datab => \main_fsm|s_currentState.PREP_SOLI~q\,
	datac => \main_fsm|s_currentState.DIS_SOLI~q\,
	datad => \main_fsm|s_currentState.START~q\,
	combout => \main_fsm|WideOr15~0_combout\);

-- Location: LCCOMB_X114_Y23_N12
\dec_word1|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dec_word1|Mux3~0_combout\ = (!\main_fsm|s_currentState.PREP_SOLI~q\ & !\main_fsm|s_currentState.DIS_SOLI~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \main_fsm|s_currentState.PREP_SOLI~q\,
	datad => \main_fsm|s_currentState.DIS_SOLI~q\,
	combout => \dec_word1|Mux3~0_combout\);

-- Location: LCCOMB_X114_Y23_N10
\dec_word1|decOut_n[0]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \dec_word1|decOut_n[0]~2_combout\ = ((\main_fsm|WideOr15~0_combout\ & ((\main_fsm|WideOr16~0_combout\) # (!\dec_word1|Mux3~0_combout\)))) # (!\main_fsm|enable~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010111110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|enable~0_combout\,
	datab => \main_fsm|WideOr16~0_combout\,
	datac => \main_fsm|WideOr15~0_combout\,
	datad => \dec_word1|Mux3~0_combout\,
	combout => \dec_word1|decOut_n[0]~2_combout\);

-- Location: LCCOMB_X114_Y23_N16
\dec_word1|decOut_n[1]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \dec_word1|decOut_n[1]~3_combout\ = (((\main_fsm|WideOr16~0_combout\ & !\main_fsm|WideOr15~0_combout\)) # (!\dec_word1|Mux3~0_combout\)) # (!\main_fsm|enable~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|enable~0_combout\,
	datab => \main_fsm|WideOr16~0_combout\,
	datac => \main_fsm|WideOr15~0_combout\,
	datad => \dec_word1|Mux3~0_combout\,
	combout => \dec_word1|decOut_n[1]~3_combout\);

-- Location: LCCOMB_X114_Y23_N0
\dec_word1|decOut_n[3]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \dec_word1|decOut_n[3]~5_combout\ = ((!\main_fsm|s_currentState.DIS_SOLI~q\ & (\main_fsm|WideOr15~0_combout\ & !\main_fsm|s_currentState.PREP_SOLI~q\))) # (!\dec_word0|decOut_n[5]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001101110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_currentState.DIS_SOLI~q\,
	datab => \dec_word0|decOut_n[5]~0_combout\,
	datac => \main_fsm|WideOr15~0_combout\,
	datad => \main_fsm|s_currentState.PREP_SOLI~q\,
	combout => \dec_word1|decOut_n[3]~5_combout\);

-- Location: LCCOMB_X114_Y23_N22
\dec_word1|decOut_n[6]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \dec_word1|decOut_n[6]~4_combout\ = (((!\main_fsm|WideOr16~0_combout\ & !\main_fsm|WideOr15~0_combout\)) # (!\dec_word1|Mux3~0_combout\)) # (!\main_fsm|enable~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|enable~0_combout\,
	datab => \main_fsm|WideOr16~0_combout\,
	datac => \main_fsm|WideOr15~0_combout\,
	datad => \dec_word1|Mux3~0_combout\,
	combout => \dec_word1|decOut_n[6]~4_combout\);

-- Location: LCCOMB_X109_Y19_N20
\main_fsm|WideOr16\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|WideOr16~combout\ = (\main_fsm|s_currentState.PREP_FAN~q\) # ((\main_fsm|s_currentState.DIS_FAN~q\) # ((\main_fsm|s_currentState.DIS_SPES~q\) # (\main_fsm|s_currentState.PREP_SPES~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_currentState.PREP_FAN~q\,
	datab => \main_fsm|s_currentState.DIS_FAN~q\,
	datac => \main_fsm|s_currentState.DIS_SPES~q\,
	datad => \main_fsm|s_currentState.PREP_SPES~q\,
	combout => \main_fsm|WideOr16~combout\);

-- Location: LCCOMB_X109_Y19_N18
\main_fsm|WideOr12\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|WideOr12~combout\ = (\main_fsm|s_currentState.PREP_SOLI~q\) # ((\main_fsm|s_currentState.DIS_SOLI~q\) # ((\main_fsm|s_currentState.DIS_SPES~q\) # (\main_fsm|s_currentState.PREP_SPES~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_currentState.PREP_SOLI~q\,
	datab => \main_fsm|s_currentState.DIS_SOLI~q\,
	datac => \main_fsm|s_currentState.DIS_SPES~q\,
	datad => \main_fsm|s_currentState.PREP_SPES~q\,
	combout => \main_fsm|WideOr12~combout\);

-- Location: LCCOMB_X114_Y19_N28
\dec_word2|decOut_n[0]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \dec_word2|decOut_n[0]~4_combout\ = ((\main_fsm|WideOr16~combout\ & (\main_fsm|WideOr12~combout\ & \main_fsm|WideOr17~combout\)) # (!\main_fsm|WideOr16~combout\ & (!\main_fsm|WideOr12~combout\))) # (!\main_fsm|enable~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001111100011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|WideOr16~combout\,
	datab => \main_fsm|WideOr12~combout\,
	datac => \main_fsm|enable~0_combout\,
	datad => \main_fsm|WideOr17~combout\,
	combout => \dec_word2|decOut_n[0]~4_combout\);

-- Location: LCCOMB_X114_Y19_N12
\dec_word2|decOut_n[2]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \dec_word2|decOut_n[2]~7_combout\ = (\main_fsm|s_currentState.START_DONE~q\ & ((\main_fsm|WideOr12~combout\ $ (!\main_fsm|WideOr16~combout\)) # (!\clk_div_1hz|clkOut~q\))) # (!\main_fsm|s_currentState.START_DONE~q\ & (\main_fsm|WideOr12~combout\ $ 
-- ((!\main_fsm|WideOr16~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_currentState.START_DONE~q\,
	datab => \main_fsm|WideOr12~combout\,
	datac => \main_fsm|WideOr16~combout\,
	datad => \clk_div_1hz|clkOut~q\,
	combout => \dec_word2|decOut_n[2]~7_combout\);

-- Location: LCCOMB_X114_Y19_N2
\dec_word2|decOut_n[3]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \dec_word2|decOut_n[3]~8_combout\ = ((\main_fsm|WideOr16~combout\) # ((\main_fsm|s_currentState.START_DONE~q\ & !\clk_div_1hz|clkOut~q\))) # (!\main_fsm|WideOr12~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_currentState.START_DONE~q\,
	datab => \main_fsm|WideOr12~combout\,
	datac => \main_fsm|WideOr16~combout\,
	datad => \clk_div_1hz|clkOut~q\,
	combout => \dec_word2|decOut_n[3]~8_combout\);

-- Location: LCCOMB_X114_Y19_N18
\dec_word2|decOut_n[5]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \dec_word2|decOut_n[5]~5_combout\ = ((\main_fsm|WideOr17~combout\ & (\main_fsm|WideOr16~combout\ $ (!\main_fsm|WideOr12~combout\)))) # (!\main_fsm|enable~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|WideOr16~combout\,
	datab => \main_fsm|WideOr12~combout\,
	datac => \main_fsm|enable~0_combout\,
	datad => \main_fsm|WideOr17~combout\,
	combout => \dec_word2|decOut_n[5]~5_combout\);

-- Location: LCCOMB_X114_Y19_N4
\dec_word2|decOut_n[6]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \dec_word2|decOut_n[6]~6_combout\ = ((\main_fsm|WideOr16~combout\ & (\main_fsm|WideOr12~combout\ & \main_fsm|WideOr17~combout\)) # (!\main_fsm|WideOr16~combout\ & ((!\main_fsm|WideOr17~combout\)))) # (!\main_fsm|enable~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|WideOr16~combout\,
	datab => \main_fsm|WideOr12~combout\,
	datac => \main_fsm|enable~0_combout\,
	datad => \main_fsm|WideOr17~combout\,
	combout => \dec_word2|decOut_n[6]~6_combout\);

-- Location: LCCOMB_X113_Y19_N14
\main_fsm|WideOr10\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|WideOr10~combout\ = (\main_fsm|s_currentState.EREF~q\) # ((\main_fsm|s_currentState.START_DONE~q\) # (!\main_fsm|s_currentState.START~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \main_fsm|s_currentState.EREF~q\,
	datac => \main_fsm|s_currentState.START~q\,
	datad => \main_fsm|s_currentState.START_DONE~q\,
	combout => \main_fsm|WideOr10~combout\);

-- Location: LCCOMB_X114_Y19_N14
\dec_word3|decOut_n[0]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \dec_word3|decOut_n[0]~4_combout\ = ((\main_fsm|WideOr17~combout\ & ((\main_fsm|WideOr12~combout\))) # (!\main_fsm|WideOr17~combout\ & (\main_fsm|WideOr10~combout\))) # (!\main_fsm|enable~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|WideOr10~combout\,
	datab => \main_fsm|WideOr12~combout\,
	datac => \main_fsm|enable~0_combout\,
	datad => \main_fsm|WideOr17~combout\,
	combout => \dec_word3|decOut_n[0]~4_combout\);

-- Location: LCCOMB_X114_Y19_N0
\dec_word3|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dec_word3|Mux5~0_combout\ = (\main_fsm|WideOr10~combout\ & (!\main_fsm|WideOr12~combout\ & ((!\main_fsm|WideOr16~0_combout\) # (!\main_fsm|s_currentState.EREF~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|WideOr10~combout\,
	datab => \main_fsm|WideOr12~combout\,
	datac => \main_fsm|s_currentState.EREF~q\,
	datad => \main_fsm|WideOr16~0_combout\,
	combout => \dec_word3|Mux5~0_combout\);

-- Location: LCCOMB_X114_Y19_N16
\dec_word3|decOut_n[1]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \dec_word3|decOut_n[1]~7_combout\ = ((\main_fsm|s_currentState.START_DONE~q\ & !\clk_div_1hz|clkOut~q\)) # (!\dec_word3|Mux5~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_currentState.START_DONE~q\,
	datab => \clk_div_1hz|clkOut~q\,
	datad => \dec_word3|Mux5~0_combout\,
	combout => \dec_word3|decOut_n[1]~7_combout\);

-- Location: LCCOMB_X114_Y19_N30
\dec_word3|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dec_word3|Mux4~0_combout\ = (\main_fsm|WideOr10~combout\ & (\main_fsm|WideOr12~combout\ $ (((\main_fsm|s_currentState.EREF~q\ & \main_fsm|WideOr16~0_combout\))))) # (!\main_fsm|WideOr10~combout\ & (((!\main_fsm|WideOr16~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|WideOr10~combout\,
	datab => \main_fsm|WideOr12~combout\,
	datac => \main_fsm|s_currentState.EREF~q\,
	datad => \main_fsm|WideOr16~0_combout\,
	combout => \dec_word3|Mux4~0_combout\);

-- Location: LCCOMB_X114_Y19_N26
\dec_word3|decOut_n[2]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \dec_word3|decOut_n[2]~8_combout\ = (\dec_word3|Mux4~0_combout\) # ((\main_fsm|s_currentState.START_DONE~q\ & !\clk_div_1hz|clkOut~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_currentState.START_DONE~q\,
	datab => \clk_div_1hz|clkOut~q\,
	datac => \dec_word3|Mux4~0_combout\,
	combout => \dec_word3|decOut_n[2]~8_combout\);

-- Location: LCCOMB_X114_Y19_N8
\dec_word3|decOut_n[3]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \dec_word3|decOut_n[3]~5_combout\ = ((!\main_fsm|WideOr12~combout\ & !\main_fsm|WideOr17~combout\)) # (!\dec_word0|decOut_n[5]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dec_word0|decOut_n[5]~0_combout\,
	datab => \main_fsm|WideOr12~combout\,
	datad => \main_fsm|WideOr17~combout\,
	combout => \dec_word3|decOut_n[3]~5_combout\);

-- Location: LCCOMB_X114_Y19_N22
\dec_word3|decOut_n[4]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \dec_word3|decOut_n[4]~6_combout\ = ((\main_fsm|WideOr12~combout\ & ((\main_fsm|WideOr17~combout\) # (!\main_fsm|WideOr10~combout\)))) # (!\main_fsm|enable~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111101001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|WideOr10~combout\,
	datab => \main_fsm|WideOr12~combout\,
	datac => \main_fsm|enable~0_combout\,
	datad => \main_fsm|WideOr17~combout\,
	combout => \dec_word3|decOut_n[4]~6_combout\);

-- Location: LCCOMB_X103_Y18_N4
\modoGelo_fsm|s_currentState~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \modoGelo_fsm|s_currentState~8_combout\ = (\register_fsm|dataOut\(4) & (\main_fsm|WideOr18~0_combout\ & !\SW[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \register_fsm|dataOut\(4),
	datac => \main_fsm|WideOr18~0_combout\,
	datad => \SW[0]~input_o\,
	combout => \modoGelo_fsm|s_currentState~8_combout\);

-- Location: FF_X103_Y18_N5
\modoGelo_fsm|s_currentState.INICIO\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \modoGelo_fsm|s_currentState~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \modoGelo_fsm|s_currentState.INICIO~q\);

-- Location: IOIBUF_X115_Y40_N8
\KEY[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(0),
	o => \KEY[0]~input_o\);

-- Location: FF_X84_Y20_N1
\debounceDiminuir_fsm|s_dirtyIn\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \KEY[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceDiminuir_fsm|s_dirtyIn~q\);

-- Location: LCCOMB_X85_Y18_N8
\debounceDiminuir_fsm|s_previousIn~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|s_previousIn~feeder_combout\ = \debounceDiminuir_fsm|s_dirtyIn~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \debounceDiminuir_fsm|s_dirtyIn~q\,
	combout => \debounceDiminuir_fsm|s_previousIn~feeder_combout\);

-- Location: FF_X85_Y18_N9
\debounceDiminuir_fsm|s_previousIn\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceDiminuir_fsm|s_previousIn~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceDiminuir_fsm|s_previousIn~q\);

-- Location: LCCOMB_X85_Y20_N10
\debounceDiminuir_fsm|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|Add0~0_combout\ = \debounceDiminuir_fsm|s_debounceCnt\(0) $ (VCC)
-- \debounceDiminuir_fsm|Add0~1\ = CARRY(\debounceDiminuir_fsm|s_debounceCnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|s_debounceCnt\(0),
	datad => VCC,
	combout => \debounceDiminuir_fsm|Add0~0_combout\,
	cout => \debounceDiminuir_fsm|Add0~1\);

-- Location: LCCOMB_X85_Y20_N12
\debounceDiminuir_fsm|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|Add0~2_combout\ = (\debounceDiminuir_fsm|s_debounceCnt\(1) & (\debounceDiminuir_fsm|Add0~1\ & VCC)) # (!\debounceDiminuir_fsm|s_debounceCnt\(1) & (!\debounceDiminuir_fsm|Add0~1\))
-- \debounceDiminuir_fsm|Add0~3\ = CARRY((!\debounceDiminuir_fsm|s_debounceCnt\(1) & !\debounceDiminuir_fsm|Add0~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|s_debounceCnt\(1),
	datad => VCC,
	cin => \debounceDiminuir_fsm|Add0~1\,
	combout => \debounceDiminuir_fsm|Add0~2_combout\,
	cout => \debounceDiminuir_fsm|Add0~3\);

-- Location: LCCOMB_X84_Y20_N12
\debounceDiminuir_fsm|s_debounceCnt~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|s_debounceCnt~20_combout\ = (\debounceDiminuir_fsm|Add0~2_combout\ & \debounceDiminuir_fsm|s_debounceCnt[21]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounceDiminuir_fsm|Add0~2_combout\,
	datac => \debounceDiminuir_fsm|s_debounceCnt[21]~4_combout\,
	combout => \debounceDiminuir_fsm|s_debounceCnt~20_combout\);

-- Location: FF_X84_Y20_N13
\debounceDiminuir_fsm|s_debounceCnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceDiminuir_fsm|s_debounceCnt~20_combout\,
	ena => \debounceDiminuir_fsm|s_debounceCnt[21]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceDiminuir_fsm|s_debounceCnt\(1));

-- Location: LCCOMB_X85_Y20_N14
\debounceDiminuir_fsm|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|Add0~4_combout\ = (\debounceDiminuir_fsm|s_debounceCnt\(2) & ((GND) # (!\debounceDiminuir_fsm|Add0~3\))) # (!\debounceDiminuir_fsm|s_debounceCnt\(2) & (\debounceDiminuir_fsm|Add0~3\ $ (GND)))
-- \debounceDiminuir_fsm|Add0~5\ = CARRY((\debounceDiminuir_fsm|s_debounceCnt\(2)) # (!\debounceDiminuir_fsm|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|s_debounceCnt\(2),
	datad => VCC,
	cin => \debounceDiminuir_fsm|Add0~3\,
	combout => \debounceDiminuir_fsm|Add0~4_combout\,
	cout => \debounceDiminuir_fsm|Add0~5\);

-- Location: LCCOMB_X84_Y20_N2
\debounceDiminuir_fsm|s_debounceCnt~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|s_debounceCnt~21_combout\ = (\debounceDiminuir_fsm|Add0~4_combout\ & \debounceDiminuir_fsm|s_debounceCnt[21]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounceDiminuir_fsm|Add0~4_combout\,
	datac => \debounceDiminuir_fsm|s_debounceCnt[21]~4_combout\,
	combout => \debounceDiminuir_fsm|s_debounceCnt~21_combout\);

-- Location: FF_X84_Y20_N3
\debounceDiminuir_fsm|s_debounceCnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceDiminuir_fsm|s_debounceCnt~21_combout\,
	ena => \debounceDiminuir_fsm|s_debounceCnt[21]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceDiminuir_fsm|s_debounceCnt\(2));

-- Location: LCCOMB_X85_Y20_N16
\debounceDiminuir_fsm|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|Add0~6_combout\ = (\debounceDiminuir_fsm|s_debounceCnt\(3) & (\debounceDiminuir_fsm|Add0~5\ & VCC)) # (!\debounceDiminuir_fsm|s_debounceCnt\(3) & (!\debounceDiminuir_fsm|Add0~5\))
-- \debounceDiminuir_fsm|Add0~7\ = CARRY((!\debounceDiminuir_fsm|s_debounceCnt\(3) & !\debounceDiminuir_fsm|Add0~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounceDiminuir_fsm|s_debounceCnt\(3),
	datad => VCC,
	cin => \debounceDiminuir_fsm|Add0~5\,
	combout => \debounceDiminuir_fsm|Add0~6_combout\,
	cout => \debounceDiminuir_fsm|Add0~7\);

-- Location: LCCOMB_X84_Y20_N4
\debounceDiminuir_fsm|s_debounceCnt~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|s_debounceCnt~22_combout\ = (\debounceDiminuir_fsm|Add0~6_combout\ & \debounceDiminuir_fsm|s_debounceCnt[21]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounceDiminuir_fsm|Add0~6_combout\,
	datac => \debounceDiminuir_fsm|s_debounceCnt[21]~4_combout\,
	combout => \debounceDiminuir_fsm|s_debounceCnt~22_combout\);

-- Location: FF_X84_Y20_N5
\debounceDiminuir_fsm|s_debounceCnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceDiminuir_fsm|s_debounceCnt~22_combout\,
	ena => \debounceDiminuir_fsm|s_debounceCnt[21]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceDiminuir_fsm|s_debounceCnt\(3));

-- Location: LCCOMB_X85_Y20_N18
\debounceDiminuir_fsm|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|Add0~8_combout\ = (\debounceDiminuir_fsm|s_debounceCnt\(4) & ((GND) # (!\debounceDiminuir_fsm|Add0~7\))) # (!\debounceDiminuir_fsm|s_debounceCnt\(4) & (\debounceDiminuir_fsm|Add0~7\ $ (GND)))
-- \debounceDiminuir_fsm|Add0~9\ = CARRY((\debounceDiminuir_fsm|s_debounceCnt\(4)) # (!\debounceDiminuir_fsm|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounceDiminuir_fsm|s_debounceCnt\(4),
	datad => VCC,
	cin => \debounceDiminuir_fsm|Add0~7\,
	combout => \debounceDiminuir_fsm|Add0~8_combout\,
	cout => \debounceDiminuir_fsm|Add0~9\);

-- Location: LCCOMB_X84_Y20_N18
\debounceDiminuir_fsm|s_debounceCnt~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|s_debounceCnt~23_combout\ = (\debounceDiminuir_fsm|Add0~8_combout\ & \debounceDiminuir_fsm|s_debounceCnt[21]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounceDiminuir_fsm|Add0~8_combout\,
	datac => \debounceDiminuir_fsm|s_debounceCnt[21]~4_combout\,
	combout => \debounceDiminuir_fsm|s_debounceCnt~23_combout\);

-- Location: FF_X84_Y20_N19
\debounceDiminuir_fsm|s_debounceCnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceDiminuir_fsm|s_debounceCnt~23_combout\,
	ena => \debounceDiminuir_fsm|s_debounceCnt[21]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceDiminuir_fsm|s_debounceCnt\(4));

-- Location: LCCOMB_X85_Y20_N20
\debounceDiminuir_fsm|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|Add0~10_combout\ = (\debounceDiminuir_fsm|s_debounceCnt\(5) & (\debounceDiminuir_fsm|Add0~9\ & VCC)) # (!\debounceDiminuir_fsm|s_debounceCnt\(5) & (!\debounceDiminuir_fsm|Add0~9\))
-- \debounceDiminuir_fsm|Add0~11\ = CARRY((!\debounceDiminuir_fsm|s_debounceCnt\(5) & !\debounceDiminuir_fsm|Add0~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|s_debounceCnt\(5),
	datad => VCC,
	cin => \debounceDiminuir_fsm|Add0~9\,
	combout => \debounceDiminuir_fsm|Add0~10_combout\,
	cout => \debounceDiminuir_fsm|Add0~11\);

-- Location: LCCOMB_X84_Y20_N14
\debounceDiminuir_fsm|s_debounceCnt~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|s_debounceCnt~27_combout\ = (\debounceDiminuir_fsm|Add0~10_combout\ & \debounceDiminuir_fsm|s_debounceCnt[21]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|Add0~10_combout\,
	datac => \debounceDiminuir_fsm|s_debounceCnt[21]~4_combout\,
	combout => \debounceDiminuir_fsm|s_debounceCnt~27_combout\);

-- Location: FF_X84_Y20_N15
\debounceDiminuir_fsm|s_debounceCnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceDiminuir_fsm|s_debounceCnt~27_combout\,
	ena => \debounceDiminuir_fsm|s_debounceCnt[21]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceDiminuir_fsm|s_debounceCnt\(5));

-- Location: LCCOMB_X85_Y20_N22
\debounceDiminuir_fsm|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|Add0~12_combout\ = (\debounceDiminuir_fsm|s_debounceCnt\(6) & ((GND) # (!\debounceDiminuir_fsm|Add0~11\))) # (!\debounceDiminuir_fsm|s_debounceCnt\(6) & (\debounceDiminuir_fsm|Add0~11\ $ (GND)))
-- \debounceDiminuir_fsm|Add0~13\ = CARRY((\debounceDiminuir_fsm|s_debounceCnt\(6)) # (!\debounceDiminuir_fsm|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|s_debounceCnt\(6),
	datad => VCC,
	cin => \debounceDiminuir_fsm|Add0~11\,
	combout => \debounceDiminuir_fsm|Add0~12_combout\,
	cout => \debounceDiminuir_fsm|Add0~13\);

-- Location: LCCOMB_X83_Y20_N26
\debounceDiminuir_fsm|s_debounceCnt[21]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|s_debounceCnt[21]~0_combout\ = (\debounceDiminuir_fsm|s_dirtyIn~q\ & ((!\debounceDiminuir_fsm|LessThan0~7_combout\) # (!\debounceDiminuir_fsm|s_debounceCnt\(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounceDiminuir_fsm|s_dirtyIn~q\,
	datac => \debounceDiminuir_fsm|s_debounceCnt\(22),
	datad => \debounceDiminuir_fsm|LessThan0~7_combout\,
	combout => \debounceDiminuir_fsm|s_debounceCnt[21]~0_combout\);

-- Location: LCCOMB_X84_Y20_N16
\debounceDiminuir_fsm|s_debounceCnt~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|s_debounceCnt~1_combout\ = (\debounceDiminuir_fsm|s_debounceCnt[21]~0_combout\ & ((\debounceDiminuir_fsm|Add0~12_combout\) # (!\debounceDiminuir_fsm|s_previousIn~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|s_previousIn~q\,
	datab => \debounceDiminuir_fsm|Add0~12_combout\,
	datac => \debounceDiminuir_fsm|s_debounceCnt[21]~0_combout\,
	combout => \debounceDiminuir_fsm|s_debounceCnt~1_combout\);

-- Location: FF_X84_Y20_N17
\debounceDiminuir_fsm|s_debounceCnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceDiminuir_fsm|s_debounceCnt~1_combout\,
	ena => \debounceDiminuir_fsm|s_debounceCnt[21]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceDiminuir_fsm|s_debounceCnt\(6));

-- Location: LCCOMB_X85_Y20_N24
\debounceDiminuir_fsm|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|Add0~14_combout\ = (\debounceDiminuir_fsm|s_debounceCnt\(7) & (\debounceDiminuir_fsm|Add0~13\ & VCC)) # (!\debounceDiminuir_fsm|s_debounceCnt\(7) & (!\debounceDiminuir_fsm|Add0~13\))
-- \debounceDiminuir_fsm|Add0~15\ = CARRY((!\debounceDiminuir_fsm|s_debounceCnt\(7) & !\debounceDiminuir_fsm|Add0~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|s_debounceCnt\(7),
	datad => VCC,
	cin => \debounceDiminuir_fsm|Add0~13\,
	combout => \debounceDiminuir_fsm|Add0~14_combout\,
	cout => \debounceDiminuir_fsm|Add0~15\);

-- Location: LCCOMB_X83_Y20_N30
\debounceDiminuir_fsm|s_debounceCnt~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|s_debounceCnt~12_combout\ = (\debounceDiminuir_fsm|s_debounceCnt[21]~4_combout\ & \debounceDiminuir_fsm|Add0~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \debounceDiminuir_fsm|s_debounceCnt[21]~4_combout\,
	datad => \debounceDiminuir_fsm|Add0~14_combout\,
	combout => \debounceDiminuir_fsm|s_debounceCnt~12_combout\);

-- Location: FF_X83_Y20_N31
\debounceDiminuir_fsm|s_debounceCnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceDiminuir_fsm|s_debounceCnt~12_combout\,
	ena => \debounceDiminuir_fsm|s_debounceCnt[21]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceDiminuir_fsm|s_debounceCnt\(7));

-- Location: LCCOMB_X85_Y20_N26
\debounceDiminuir_fsm|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|Add0~16_combout\ = (\debounceDiminuir_fsm|s_debounceCnt\(8) & ((GND) # (!\debounceDiminuir_fsm|Add0~15\))) # (!\debounceDiminuir_fsm|s_debounceCnt\(8) & (\debounceDiminuir_fsm|Add0~15\ $ (GND)))
-- \debounceDiminuir_fsm|Add0~17\ = CARRY((\debounceDiminuir_fsm|s_debounceCnt\(8)) # (!\debounceDiminuir_fsm|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|s_debounceCnt\(8),
	datad => VCC,
	cin => \debounceDiminuir_fsm|Add0~15\,
	combout => \debounceDiminuir_fsm|Add0~16_combout\,
	cout => \debounceDiminuir_fsm|Add0~17\);

-- Location: LCCOMB_X83_Y20_N20
\debounceDiminuir_fsm|s_debounceCnt~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|s_debounceCnt~13_combout\ = (\debounceDiminuir_fsm|s_debounceCnt[21]~0_combout\ & ((\debounceDiminuir_fsm|Add0~16_combout\) # (!\debounceDiminuir_fsm|s_previousIn~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|Add0~16_combout\,
	datac => \debounceDiminuir_fsm|s_debounceCnt[21]~0_combout\,
	datad => \debounceDiminuir_fsm|s_previousIn~q\,
	combout => \debounceDiminuir_fsm|s_debounceCnt~13_combout\);

-- Location: FF_X83_Y20_N21
\debounceDiminuir_fsm|s_debounceCnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceDiminuir_fsm|s_debounceCnt~13_combout\,
	ena => \debounceDiminuir_fsm|s_debounceCnt[21]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceDiminuir_fsm|s_debounceCnt\(8));

-- Location: LCCOMB_X85_Y20_N28
\debounceDiminuir_fsm|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|Add0~18_combout\ = (\debounceDiminuir_fsm|s_debounceCnt\(9) & (\debounceDiminuir_fsm|Add0~17\ & VCC)) # (!\debounceDiminuir_fsm|s_debounceCnt\(9) & (!\debounceDiminuir_fsm|Add0~17\))
-- \debounceDiminuir_fsm|Add0~19\ = CARRY((!\debounceDiminuir_fsm|s_debounceCnt\(9) & !\debounceDiminuir_fsm|Add0~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounceDiminuir_fsm|s_debounceCnt\(9),
	datad => VCC,
	cin => \debounceDiminuir_fsm|Add0~17\,
	combout => \debounceDiminuir_fsm|Add0~18_combout\,
	cout => \debounceDiminuir_fsm|Add0~19\);

-- Location: LCCOMB_X83_Y20_N10
\debounceDiminuir_fsm|s_debounceCnt~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|s_debounceCnt~14_combout\ = (\debounceDiminuir_fsm|s_debounceCnt[21]~0_combout\ & ((\debounceDiminuir_fsm|Add0~18_combout\) # (!\debounceDiminuir_fsm|s_previousIn~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|s_debounceCnt[21]~0_combout\,
	datac => \debounceDiminuir_fsm|Add0~18_combout\,
	datad => \debounceDiminuir_fsm|s_previousIn~q\,
	combout => \debounceDiminuir_fsm|s_debounceCnt~14_combout\);

-- Location: FF_X83_Y20_N11
\debounceDiminuir_fsm|s_debounceCnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceDiminuir_fsm|s_debounceCnt~14_combout\,
	ena => \debounceDiminuir_fsm|s_debounceCnt[21]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceDiminuir_fsm|s_debounceCnt\(9));

-- Location: LCCOMB_X85_Y20_N30
\debounceDiminuir_fsm|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|Add0~20_combout\ = (\debounceDiminuir_fsm|s_debounceCnt\(10) & ((GND) # (!\debounceDiminuir_fsm|Add0~19\))) # (!\debounceDiminuir_fsm|s_debounceCnt\(10) & (\debounceDiminuir_fsm|Add0~19\ $ (GND)))
-- \debounceDiminuir_fsm|Add0~21\ = CARRY((\debounceDiminuir_fsm|s_debounceCnt\(10)) # (!\debounceDiminuir_fsm|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|s_debounceCnt\(10),
	datad => VCC,
	cin => \debounceDiminuir_fsm|Add0~19\,
	combout => \debounceDiminuir_fsm|Add0~20_combout\,
	cout => \debounceDiminuir_fsm|Add0~21\);

-- Location: LCCOMB_X84_Y20_N26
\debounceDiminuir_fsm|s_debounceCnt~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|s_debounceCnt~15_combout\ = (\debounceDiminuir_fsm|Add0~20_combout\ & \debounceDiminuir_fsm|s_debounceCnt[21]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|Add0~20_combout\,
	datac => \debounceDiminuir_fsm|s_debounceCnt[21]~4_combout\,
	combout => \debounceDiminuir_fsm|s_debounceCnt~15_combout\);

-- Location: FF_X84_Y20_N27
\debounceDiminuir_fsm|s_debounceCnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceDiminuir_fsm|s_debounceCnt~15_combout\,
	ena => \debounceDiminuir_fsm|s_debounceCnt[21]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceDiminuir_fsm|s_debounceCnt\(10));

-- Location: LCCOMB_X85_Y19_N0
\debounceDiminuir_fsm|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|Add0~22_combout\ = (\debounceDiminuir_fsm|s_debounceCnt\(11) & (\debounceDiminuir_fsm|Add0~21\ & VCC)) # (!\debounceDiminuir_fsm|s_debounceCnt\(11) & (!\debounceDiminuir_fsm|Add0~21\))
-- \debounceDiminuir_fsm|Add0~23\ = CARRY((!\debounceDiminuir_fsm|s_debounceCnt\(11) & !\debounceDiminuir_fsm|Add0~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounceDiminuir_fsm|s_debounceCnt\(11),
	datad => VCC,
	cin => \debounceDiminuir_fsm|Add0~21\,
	combout => \debounceDiminuir_fsm|Add0~22_combout\,
	cout => \debounceDiminuir_fsm|Add0~23\);

-- Location: LCCOMB_X83_Y20_N14
\debounceDiminuir_fsm|s_debounceCnt~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|s_debounceCnt~16_combout\ = (\debounceDiminuir_fsm|s_debounceCnt[21]~0_combout\ & ((\debounceDiminuir_fsm|Add0~22_combout\) # (!\debounceDiminuir_fsm|s_previousIn~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|s_previousIn~q\,
	datac => \debounceDiminuir_fsm|s_debounceCnt[21]~0_combout\,
	datad => \debounceDiminuir_fsm|Add0~22_combout\,
	combout => \debounceDiminuir_fsm|s_debounceCnt~16_combout\);

-- Location: FF_X83_Y20_N15
\debounceDiminuir_fsm|s_debounceCnt[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceDiminuir_fsm|s_debounceCnt~16_combout\,
	ena => \debounceDiminuir_fsm|s_debounceCnt[21]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceDiminuir_fsm|s_debounceCnt\(11));

-- Location: LCCOMB_X86_Y20_N28
\debounceDiminuir_fsm|LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|LessThan0~1_combout\ = (\debounceDiminuir_fsm|s_debounceCnt\(9) & \debounceDiminuir_fsm|s_debounceCnt\(11))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \debounceDiminuir_fsm|s_debounceCnt\(9),
	datad => \debounceDiminuir_fsm|s_debounceCnt\(11),
	combout => \debounceDiminuir_fsm|LessThan0~1_combout\);

-- Location: LCCOMB_X85_Y19_N2
\debounceDiminuir_fsm|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|Add0~24_combout\ = (\debounceDiminuir_fsm|s_debounceCnt\(12) & ((GND) # (!\debounceDiminuir_fsm|Add0~23\))) # (!\debounceDiminuir_fsm|s_debounceCnt\(12) & (\debounceDiminuir_fsm|Add0~23\ $ (GND)))
-- \debounceDiminuir_fsm|Add0~25\ = CARRY((\debounceDiminuir_fsm|s_debounceCnt\(12)) # (!\debounceDiminuir_fsm|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|s_debounceCnt\(12),
	datad => VCC,
	cin => \debounceDiminuir_fsm|Add0~23\,
	combout => \debounceDiminuir_fsm|Add0~24_combout\,
	cout => \debounceDiminuir_fsm|Add0~25\);

-- Location: LCCOMB_X83_Y20_N16
\debounceDiminuir_fsm|s_debounceCnt~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|s_debounceCnt~8_combout\ = (\debounceDiminuir_fsm|s_debounceCnt[21]~4_combout\ & \debounceDiminuir_fsm|Add0~24_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \debounceDiminuir_fsm|s_debounceCnt[21]~4_combout\,
	datad => \debounceDiminuir_fsm|Add0~24_combout\,
	combout => \debounceDiminuir_fsm|s_debounceCnt~8_combout\);

-- Location: FF_X83_Y20_N17
\debounceDiminuir_fsm|s_debounceCnt[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceDiminuir_fsm|s_debounceCnt~8_combout\,
	ena => \debounceDiminuir_fsm|s_debounceCnt[21]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceDiminuir_fsm|s_debounceCnt\(12));

-- Location: LCCOMB_X85_Y19_N4
\debounceDiminuir_fsm|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|Add0~26_combout\ = (\debounceDiminuir_fsm|s_debounceCnt\(13) & (\debounceDiminuir_fsm|Add0~25\ & VCC)) # (!\debounceDiminuir_fsm|s_debounceCnt\(13) & (!\debounceDiminuir_fsm|Add0~25\))
-- \debounceDiminuir_fsm|Add0~27\ = CARRY((!\debounceDiminuir_fsm|s_debounceCnt\(13) & !\debounceDiminuir_fsm|Add0~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounceDiminuir_fsm|s_debounceCnt\(13),
	datad => VCC,
	cin => \debounceDiminuir_fsm|Add0~25\,
	combout => \debounceDiminuir_fsm|Add0~26_combout\,
	cout => \debounceDiminuir_fsm|Add0~27\);

-- Location: LCCOMB_X83_Y20_N6
\debounceDiminuir_fsm|s_debounceCnt~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|s_debounceCnt~9_combout\ = (\debounceDiminuir_fsm|s_debounceCnt[21]~4_combout\ & \debounceDiminuir_fsm|Add0~26_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \debounceDiminuir_fsm|s_debounceCnt[21]~4_combout\,
	datad => \debounceDiminuir_fsm|Add0~26_combout\,
	combout => \debounceDiminuir_fsm|s_debounceCnt~9_combout\);

-- Location: FF_X83_Y20_N7
\debounceDiminuir_fsm|s_debounceCnt[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceDiminuir_fsm|s_debounceCnt~9_combout\,
	ena => \debounceDiminuir_fsm|s_debounceCnt[21]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceDiminuir_fsm|s_debounceCnt\(13));

-- Location: LCCOMB_X85_Y19_N6
\debounceDiminuir_fsm|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|Add0~28_combout\ = (\debounceDiminuir_fsm|s_debounceCnt\(14) & ((GND) # (!\debounceDiminuir_fsm|Add0~27\))) # (!\debounceDiminuir_fsm|s_debounceCnt\(14) & (\debounceDiminuir_fsm|Add0~27\ $ (GND)))
-- \debounceDiminuir_fsm|Add0~29\ = CARRY((\debounceDiminuir_fsm|s_debounceCnt\(14)) # (!\debounceDiminuir_fsm|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounceDiminuir_fsm|s_debounceCnt\(14),
	datad => VCC,
	cin => \debounceDiminuir_fsm|Add0~27\,
	combout => \debounceDiminuir_fsm|Add0~28_combout\,
	cout => \debounceDiminuir_fsm|Add0~29\);

-- Location: LCCOMB_X83_Y20_N8
\debounceDiminuir_fsm|s_debounceCnt~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|s_debounceCnt~17_combout\ = (\debounceDiminuir_fsm|s_debounceCnt[21]~0_combout\ & ((\debounceDiminuir_fsm|Add0~28_combout\) # (!\debounceDiminuir_fsm|s_previousIn~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|s_previousIn~q\,
	datac => \debounceDiminuir_fsm|s_debounceCnt[21]~0_combout\,
	datad => \debounceDiminuir_fsm|Add0~28_combout\,
	combout => \debounceDiminuir_fsm|s_debounceCnt~17_combout\);

-- Location: FF_X83_Y20_N9
\debounceDiminuir_fsm|s_debounceCnt[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceDiminuir_fsm|s_debounceCnt~17_combout\,
	ena => \debounceDiminuir_fsm|s_debounceCnt[21]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceDiminuir_fsm|s_debounceCnt\(14));

-- Location: LCCOMB_X85_Y19_N8
\debounceDiminuir_fsm|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|Add0~30_combout\ = (\debounceDiminuir_fsm|s_debounceCnt\(15) & (\debounceDiminuir_fsm|Add0~29\ & VCC)) # (!\debounceDiminuir_fsm|s_debounceCnt\(15) & (!\debounceDiminuir_fsm|Add0~29\))
-- \debounceDiminuir_fsm|Add0~31\ = CARRY((!\debounceDiminuir_fsm|s_debounceCnt\(15) & !\debounceDiminuir_fsm|Add0~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|s_debounceCnt\(15),
	datad => VCC,
	cin => \debounceDiminuir_fsm|Add0~29\,
	combout => \debounceDiminuir_fsm|Add0~30_combout\,
	cout => \debounceDiminuir_fsm|Add0~31\);

-- Location: LCCOMB_X84_Y20_N22
\debounceDiminuir_fsm|s_debounceCnt~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|s_debounceCnt~5_combout\ = (\debounceDiminuir_fsm|Add0~30_combout\ & \debounceDiminuir_fsm|s_debounceCnt[21]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounceDiminuir_fsm|Add0~30_combout\,
	datac => \debounceDiminuir_fsm|s_debounceCnt[21]~4_combout\,
	combout => \debounceDiminuir_fsm|s_debounceCnt~5_combout\);

-- Location: FF_X84_Y20_N23
\debounceDiminuir_fsm|s_debounceCnt[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceDiminuir_fsm|s_debounceCnt~5_combout\,
	ena => \debounceDiminuir_fsm|s_debounceCnt[21]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceDiminuir_fsm|s_debounceCnt\(15));

-- Location: LCCOMB_X85_Y19_N10
\debounceDiminuir_fsm|Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|Add0~32_combout\ = (\debounceDiminuir_fsm|s_debounceCnt\(16) & ((GND) # (!\debounceDiminuir_fsm|Add0~31\))) # (!\debounceDiminuir_fsm|s_debounceCnt\(16) & (\debounceDiminuir_fsm|Add0~31\ $ (GND)))
-- \debounceDiminuir_fsm|Add0~33\ = CARRY((\debounceDiminuir_fsm|s_debounceCnt\(16)) # (!\debounceDiminuir_fsm|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounceDiminuir_fsm|s_debounceCnt\(16),
	datad => VCC,
	cin => \debounceDiminuir_fsm|Add0~31\,
	combout => \debounceDiminuir_fsm|Add0~32_combout\,
	cout => \debounceDiminuir_fsm|Add0~33\);

-- Location: LCCOMB_X84_Y20_N24
\debounceDiminuir_fsm|s_debounceCnt~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|s_debounceCnt~6_combout\ = (\debounceDiminuir_fsm|s_debounceCnt[21]~4_combout\ & \debounceDiminuir_fsm|Add0~32_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|s_debounceCnt[21]~4_combout\,
	datac => \debounceDiminuir_fsm|Add0~32_combout\,
	combout => \debounceDiminuir_fsm|s_debounceCnt~6_combout\);

-- Location: FF_X84_Y20_N25
\debounceDiminuir_fsm|s_debounceCnt[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceDiminuir_fsm|s_debounceCnt~6_combout\,
	ena => \debounceDiminuir_fsm|s_debounceCnt[21]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceDiminuir_fsm|s_debounceCnt\(16));

-- Location: LCCOMB_X85_Y19_N12
\debounceDiminuir_fsm|Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|Add0~34_combout\ = (\debounceDiminuir_fsm|s_debounceCnt\(17) & (\debounceDiminuir_fsm|Add0~33\ & VCC)) # (!\debounceDiminuir_fsm|s_debounceCnt\(17) & (!\debounceDiminuir_fsm|Add0~33\))
-- \debounceDiminuir_fsm|Add0~35\ = CARRY((!\debounceDiminuir_fsm|s_debounceCnt\(17) & !\debounceDiminuir_fsm|Add0~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|s_debounceCnt\(17),
	datad => VCC,
	cin => \debounceDiminuir_fsm|Add0~33\,
	combout => \debounceDiminuir_fsm|Add0~34_combout\,
	cout => \debounceDiminuir_fsm|Add0~35\);

-- Location: LCCOMB_X84_Y20_N6
\debounceDiminuir_fsm|s_debounceCnt~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|s_debounceCnt~7_combout\ = (\debounceDiminuir_fsm|s_debounceCnt[21]~4_combout\ & \debounceDiminuir_fsm|Add0~34_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \debounceDiminuir_fsm|s_debounceCnt[21]~4_combout\,
	datad => \debounceDiminuir_fsm|Add0~34_combout\,
	combout => \debounceDiminuir_fsm|s_debounceCnt~7_combout\);

-- Location: FF_X84_Y20_N7
\debounceDiminuir_fsm|s_debounceCnt[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceDiminuir_fsm|s_debounceCnt~7_combout\,
	ena => \debounceDiminuir_fsm|s_debounceCnt[21]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceDiminuir_fsm|s_debounceCnt\(17));

-- Location: LCCOMB_X85_Y19_N14
\debounceDiminuir_fsm|Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|Add0~36_combout\ = (\debounceDiminuir_fsm|s_debounceCnt\(18) & ((GND) # (!\debounceDiminuir_fsm|Add0~35\))) # (!\debounceDiminuir_fsm|s_debounceCnt\(18) & (\debounceDiminuir_fsm|Add0~35\ $ (GND)))
-- \debounceDiminuir_fsm|Add0~37\ = CARRY((\debounceDiminuir_fsm|s_debounceCnt\(18)) # (!\debounceDiminuir_fsm|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|s_debounceCnt\(18),
	datad => VCC,
	cin => \debounceDiminuir_fsm|Add0~35\,
	combout => \debounceDiminuir_fsm|Add0~36_combout\,
	cout => \debounceDiminuir_fsm|Add0~37\);

-- Location: LCCOMB_X83_Y20_N22
\debounceDiminuir_fsm|s_debounceCnt[18]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|s_debounceCnt[18]~18_combout\ = (\debounceDiminuir_fsm|s_debounceCnt[21]~3_combout\ & (\debounceDiminuir_fsm|s_debounceCnt[21]~0_combout\ & ((\debounceDiminuir_fsm|Add0~36_combout\) # (!\debounceDiminuir_fsm|s_previousIn~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|s_previousIn~q\,
	datab => \debounceDiminuir_fsm|s_debounceCnt[21]~3_combout\,
	datac => \debounceDiminuir_fsm|s_debounceCnt[21]~0_combout\,
	datad => \debounceDiminuir_fsm|Add0~36_combout\,
	combout => \debounceDiminuir_fsm|s_debounceCnt[18]~18_combout\);

-- Location: FF_X83_Y20_N23
\debounceDiminuir_fsm|s_debounceCnt[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceDiminuir_fsm|s_debounceCnt[18]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceDiminuir_fsm|s_debounceCnt\(18));

-- Location: LCCOMB_X83_Y20_N2
\debounceDiminuir_fsm|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|LessThan0~0_combout\ = (\debounceDiminuir_fsm|s_debounceCnt\(18) & (\debounceDiminuir_fsm|s_debounceCnt\(19) & (\debounceDiminuir_fsm|s_debounceCnt\(14) & \debounceDiminuir_fsm|s_debounceCnt\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|s_debounceCnt\(18),
	datab => \debounceDiminuir_fsm|s_debounceCnt\(19),
	datac => \debounceDiminuir_fsm|s_debounceCnt\(14),
	datad => \debounceDiminuir_fsm|s_debounceCnt\(8),
	combout => \debounceDiminuir_fsm|LessThan0~0_combout\);

-- Location: LCCOMB_X84_Y20_N8
\debounceDiminuir_fsm|s_pulsedOut~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|s_pulsedOut~5_combout\ = (!\debounceDiminuir_fsm|s_debounceCnt\(1) & (!\debounceDiminuir_fsm|s_debounceCnt\(2) & (!\debounceDiminuir_fsm|s_debounceCnt\(3) & !\debounceDiminuir_fsm|s_debounceCnt\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|s_debounceCnt\(1),
	datab => \debounceDiminuir_fsm|s_debounceCnt\(2),
	datac => \debounceDiminuir_fsm|s_debounceCnt\(3),
	datad => \debounceDiminuir_fsm|s_debounceCnt\(4),
	combout => \debounceDiminuir_fsm|s_pulsedOut~5_combout\);

-- Location: LCCOMB_X85_Y20_N8
\debounceDiminuir_fsm|LessThan0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|LessThan0~2_combout\ = (\debounceDiminuir_fsm|s_debounceCnt\(6) & ((\debounceDiminuir_fsm|s_debounceCnt\(0)) # ((\debounceDiminuir_fsm|s_debounceCnt\(5)) # (!\debounceDiminuir_fsm|s_pulsedOut~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|s_debounceCnt\(0),
	datab => \debounceDiminuir_fsm|s_debounceCnt\(5),
	datac => \debounceDiminuir_fsm|s_debounceCnt\(6),
	datad => \debounceDiminuir_fsm|s_pulsedOut~5_combout\,
	combout => \debounceDiminuir_fsm|LessThan0~2_combout\);

-- Location: LCCOMB_X86_Y20_N22
\debounceDiminuir_fsm|LessThan0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|LessThan0~3_combout\ = (\debounceDiminuir_fsm|LessThan0~1_combout\ & (\debounceDiminuir_fsm|LessThan0~0_combout\ & ((\debounceDiminuir_fsm|s_debounceCnt\(7)) # (\debounceDiminuir_fsm|LessThan0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|s_debounceCnt\(7),
	datab => \debounceDiminuir_fsm|LessThan0~1_combout\,
	datac => \debounceDiminuir_fsm|LessThan0~0_combout\,
	datad => \debounceDiminuir_fsm|LessThan0~2_combout\,
	combout => \debounceDiminuir_fsm|LessThan0~3_combout\);

-- Location: LCCOMB_X83_Y20_N4
\debounceDiminuir_fsm|LessThan0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|LessThan0~4_combout\ = (\debounceDiminuir_fsm|s_debounceCnt\(13)) # ((\debounceDiminuir_fsm|s_debounceCnt\(12)) # ((\debounceDiminuir_fsm|s_debounceCnt\(11) & \debounceDiminuir_fsm|s_debounceCnt\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|s_debounceCnt\(13),
	datab => \debounceDiminuir_fsm|s_debounceCnt\(12),
	datac => \debounceDiminuir_fsm|s_debounceCnt\(11),
	datad => \debounceDiminuir_fsm|s_debounceCnt\(10),
	combout => \debounceDiminuir_fsm|LessThan0~4_combout\);

-- Location: LCCOMB_X86_Y20_N24
\debounceDiminuir_fsm|LessThan0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|LessThan0~5_combout\ = (\debounceDiminuir_fsm|s_debounceCnt\(15)) # ((\debounceDiminuir_fsm|s_debounceCnt\(16)) # ((\debounceDiminuir_fsm|s_debounceCnt\(14) & \debounceDiminuir_fsm|LessThan0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|s_debounceCnt\(15),
	datab => \debounceDiminuir_fsm|s_debounceCnt\(14),
	datac => \debounceDiminuir_fsm|s_debounceCnt\(16),
	datad => \debounceDiminuir_fsm|LessThan0~4_combout\,
	combout => \debounceDiminuir_fsm|LessThan0~5_combout\);

-- Location: LCCOMB_X86_Y20_N18
\debounceDiminuir_fsm|LessThan0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|LessThan0~6_combout\ = (\debounceDiminuir_fsm|s_debounceCnt\(19) & (\debounceDiminuir_fsm|s_debounceCnt\(18) & ((\debounceDiminuir_fsm|s_debounceCnt\(17)) # (\debounceDiminuir_fsm|LessThan0~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|s_debounceCnt\(19),
	datab => \debounceDiminuir_fsm|s_debounceCnt\(18),
	datac => \debounceDiminuir_fsm|s_debounceCnt\(17),
	datad => \debounceDiminuir_fsm|LessThan0~5_combout\,
	combout => \debounceDiminuir_fsm|LessThan0~6_combout\);

-- Location: LCCOMB_X86_Y20_N16
\debounceDiminuir_fsm|LessThan0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|LessThan0~7_combout\ = (\debounceDiminuir_fsm|s_debounceCnt\(20)) # ((\debounceDiminuir_fsm|s_debounceCnt\(21)) # ((\debounceDiminuir_fsm|LessThan0~3_combout\) # (\debounceDiminuir_fsm|LessThan0~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|s_debounceCnt\(20),
	datab => \debounceDiminuir_fsm|s_debounceCnt\(21),
	datac => \debounceDiminuir_fsm|LessThan0~3_combout\,
	datad => \debounceDiminuir_fsm|LessThan0~6_combout\,
	combout => \debounceDiminuir_fsm|LessThan0~7_combout\);

-- Location: LCCOMB_X84_Y20_N30
\debounceDiminuir_fsm|s_debounceCnt[21]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|s_debounceCnt[21]~4_combout\ = (\debounceDiminuir_fsm|s_dirtyIn~q\ & (\debounceDiminuir_fsm|s_previousIn~q\ & ((!\debounceDiminuir_fsm|LessThan0~7_combout\) # (!\debounceDiminuir_fsm|s_debounceCnt\(22)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|s_debounceCnt\(22),
	datab => \debounceDiminuir_fsm|s_dirtyIn~q\,
	datac => \debounceDiminuir_fsm|LessThan0~7_combout\,
	datad => \debounceDiminuir_fsm|s_previousIn~q\,
	combout => \debounceDiminuir_fsm|s_debounceCnt[21]~4_combout\);

-- Location: LCCOMB_X84_Y20_N10
\debounceDiminuir_fsm|s_debounceCnt~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|s_debounceCnt~24_combout\ = (\debounceDiminuir_fsm|Add0~0_combout\ & \debounceDiminuir_fsm|s_debounceCnt[21]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounceDiminuir_fsm|Add0~0_combout\,
	datac => \debounceDiminuir_fsm|s_debounceCnt[21]~4_combout\,
	combout => \debounceDiminuir_fsm|s_debounceCnt~24_combout\);

-- Location: FF_X84_Y20_N11
\debounceDiminuir_fsm|s_debounceCnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceDiminuir_fsm|s_debounceCnt~24_combout\,
	ena => \debounceDiminuir_fsm|s_debounceCnt[21]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceDiminuir_fsm|s_debounceCnt\(0));

-- Location: LCCOMB_X83_Y20_N12
\debounceDiminuir_fsm|s_pulsedOut~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|s_pulsedOut~2_combout\ = (!\debounceDiminuir_fsm|s_debounceCnt\(9) & (!\debounceDiminuir_fsm|s_debounceCnt\(8) & (!\debounceDiminuir_fsm|s_debounceCnt\(7) & !\debounceDiminuir_fsm|s_debounceCnt\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|s_debounceCnt\(9),
	datab => \debounceDiminuir_fsm|s_debounceCnt\(8),
	datac => \debounceDiminuir_fsm|s_debounceCnt\(7),
	datad => \debounceDiminuir_fsm|s_debounceCnt\(10),
	combout => \debounceDiminuir_fsm|s_pulsedOut~2_combout\);

-- Location: LCCOMB_X83_Y20_N18
\debounceDiminuir_fsm|s_pulsedOut~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|s_pulsedOut~3_combout\ = (!\debounceDiminuir_fsm|s_debounceCnt\(18) & (!\debounceDiminuir_fsm|s_debounceCnt\(14) & (!\debounceDiminuir_fsm|s_debounceCnt\(11) & !\debounceDiminuir_fsm|s_debounceCnt\(19))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|s_debounceCnt\(18),
	datab => \debounceDiminuir_fsm|s_debounceCnt\(14),
	datac => \debounceDiminuir_fsm|s_debounceCnt\(11),
	datad => \debounceDiminuir_fsm|s_debounceCnt\(19),
	combout => \debounceDiminuir_fsm|s_pulsedOut~3_combout\);

-- Location: LCCOMB_X84_Y20_N20
\debounceDiminuir_fsm|s_pulsedOut~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|s_pulsedOut~0_combout\ = (!\debounceDiminuir_fsm|s_debounceCnt\(17) & (!\debounceDiminuir_fsm|s_debounceCnt\(6) & (!\debounceDiminuir_fsm|s_debounceCnt\(15) & !\debounceDiminuir_fsm|s_debounceCnt\(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|s_debounceCnt\(17),
	datab => \debounceDiminuir_fsm|s_debounceCnt\(6),
	datac => \debounceDiminuir_fsm|s_debounceCnt\(15),
	datad => \debounceDiminuir_fsm|s_debounceCnt\(16),
	combout => \debounceDiminuir_fsm|s_pulsedOut~0_combout\);

-- Location: LCCOMB_X83_Y20_N0
\debounceDiminuir_fsm|s_pulsedOut~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|s_pulsedOut~1_combout\ = (!\debounceDiminuir_fsm|s_debounceCnt\(13) & (!\debounceDiminuir_fsm|s_debounceCnt\(12) & (!\debounceDiminuir_fsm|s_debounceCnt\(21) & !\debounceDiminuir_fsm|s_debounceCnt\(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|s_debounceCnt\(13),
	datab => \debounceDiminuir_fsm|s_debounceCnt\(12),
	datac => \debounceDiminuir_fsm|s_debounceCnt\(21),
	datad => \debounceDiminuir_fsm|s_debounceCnt\(20),
	combout => \debounceDiminuir_fsm|s_pulsedOut~1_combout\);

-- Location: LCCOMB_X83_Y20_N24
\debounceDiminuir_fsm|s_pulsedOut~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|s_pulsedOut~4_combout\ = (\debounceDiminuir_fsm|s_pulsedOut~2_combout\ & (\debounceDiminuir_fsm|s_pulsedOut~3_combout\ & (\debounceDiminuir_fsm|s_pulsedOut~0_combout\ & \debounceDiminuir_fsm|s_pulsedOut~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|s_pulsedOut~2_combout\,
	datab => \debounceDiminuir_fsm|s_pulsedOut~3_combout\,
	datac => \debounceDiminuir_fsm|s_pulsedOut~0_combout\,
	datad => \debounceDiminuir_fsm|s_pulsedOut~1_combout\,
	combout => \debounceDiminuir_fsm|s_pulsedOut~4_combout\);

-- Location: LCCOMB_X84_Y20_N28
\debounceDiminuir_fsm|s_debounceCnt[21]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|s_debounceCnt[21]~2_combout\ = (\debounceDiminuir_fsm|s_debounceCnt\(0)) # (((\debounceDiminuir_fsm|s_debounceCnt\(5)) # (!\debounceDiminuir_fsm|s_pulsedOut~4_combout\)) # (!\debounceDiminuir_fsm|s_pulsedOut~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|s_debounceCnt\(0),
	datab => \debounceDiminuir_fsm|s_pulsedOut~5_combout\,
	datac => \debounceDiminuir_fsm|s_debounceCnt\(5),
	datad => \debounceDiminuir_fsm|s_pulsedOut~4_combout\,
	combout => \debounceDiminuir_fsm|s_debounceCnt[21]~2_combout\);

-- Location: LCCOMB_X84_Y20_N0
\debounceDiminuir_fsm|s_debounceCnt[21]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|s_debounceCnt[21]~3_combout\ = ((\debounceDiminuir_fsm|s_debounceCnt\(22)) # ((\debounceDiminuir_fsm|s_debounceCnt[21]~2_combout\) # (!\debounceDiminuir_fsm|s_dirtyIn~q\))) # (!\debounceDiminuir_fsm|s_previousIn~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|s_previousIn~q\,
	datab => \debounceDiminuir_fsm|s_debounceCnt\(22),
	datac => \debounceDiminuir_fsm|s_dirtyIn~q\,
	datad => \debounceDiminuir_fsm|s_debounceCnt[21]~2_combout\,
	combout => \debounceDiminuir_fsm|s_debounceCnt[21]~3_combout\);

-- Location: LCCOMB_X85_Y19_N16
\debounceDiminuir_fsm|Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|Add0~38_combout\ = (\debounceDiminuir_fsm|s_debounceCnt\(19) & (\debounceDiminuir_fsm|Add0~37\ & VCC)) # (!\debounceDiminuir_fsm|s_debounceCnt\(19) & (!\debounceDiminuir_fsm|Add0~37\))
-- \debounceDiminuir_fsm|Add0~39\ = CARRY((!\debounceDiminuir_fsm|s_debounceCnt\(19) & !\debounceDiminuir_fsm|Add0~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounceDiminuir_fsm|s_debounceCnt\(19),
	datad => VCC,
	cin => \debounceDiminuir_fsm|Add0~37\,
	combout => \debounceDiminuir_fsm|Add0~38_combout\,
	cout => \debounceDiminuir_fsm|Add0~39\);

-- Location: LCCOMB_X83_Y20_N28
\debounceDiminuir_fsm|s_debounceCnt[19]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|s_debounceCnt[19]~19_combout\ = (\debounceDiminuir_fsm|s_debounceCnt[21]~3_combout\ & (\debounceDiminuir_fsm|s_debounceCnt[21]~0_combout\ & ((\debounceDiminuir_fsm|Add0~38_combout\) # (!\debounceDiminuir_fsm|s_previousIn~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|s_previousIn~q\,
	datab => \debounceDiminuir_fsm|s_debounceCnt[21]~3_combout\,
	datac => \debounceDiminuir_fsm|s_debounceCnt[21]~0_combout\,
	datad => \debounceDiminuir_fsm|Add0~38_combout\,
	combout => \debounceDiminuir_fsm|s_debounceCnt[19]~19_combout\);

-- Location: FF_X83_Y20_N29
\debounceDiminuir_fsm|s_debounceCnt[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceDiminuir_fsm|s_debounceCnt[19]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceDiminuir_fsm|s_debounceCnt\(19));

-- Location: LCCOMB_X85_Y19_N18
\debounceDiminuir_fsm|Add0~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|Add0~40_combout\ = (\debounceDiminuir_fsm|s_debounceCnt\(20) & ((GND) # (!\debounceDiminuir_fsm|Add0~39\))) # (!\debounceDiminuir_fsm|s_debounceCnt\(20) & (\debounceDiminuir_fsm|Add0~39\ $ (GND)))
-- \debounceDiminuir_fsm|Add0~41\ = CARRY((\debounceDiminuir_fsm|s_debounceCnt\(20)) # (!\debounceDiminuir_fsm|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounceDiminuir_fsm|s_debounceCnt\(20),
	datad => VCC,
	cin => \debounceDiminuir_fsm|Add0~39\,
	combout => \debounceDiminuir_fsm|Add0~40_combout\,
	cout => \debounceDiminuir_fsm|Add0~41\);

-- Location: LCCOMB_X85_Y19_N28
\debounceDiminuir_fsm|s_debounceCnt[20]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|s_debounceCnt[20]~10_combout\ = (\debounceDiminuir_fsm|Add0~40_combout\ & (\debounceDiminuir_fsm|s_debounceCnt[21]~3_combout\ & \debounceDiminuir_fsm|s_debounceCnt[21]~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|Add0~40_combout\,
	datac => \debounceDiminuir_fsm|s_debounceCnt[21]~3_combout\,
	datad => \debounceDiminuir_fsm|s_debounceCnt[21]~4_combout\,
	combout => \debounceDiminuir_fsm|s_debounceCnt[20]~10_combout\);

-- Location: FF_X85_Y19_N29
\debounceDiminuir_fsm|s_debounceCnt[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceDiminuir_fsm|s_debounceCnt[20]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceDiminuir_fsm|s_debounceCnt\(20));

-- Location: LCCOMB_X85_Y19_N20
\debounceDiminuir_fsm|Add0~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|Add0~42_combout\ = (\debounceDiminuir_fsm|s_debounceCnt\(21) & (\debounceDiminuir_fsm|Add0~41\ & VCC)) # (!\debounceDiminuir_fsm|s_debounceCnt\(21) & (!\debounceDiminuir_fsm|Add0~41\))
-- \debounceDiminuir_fsm|Add0~43\ = CARRY((!\debounceDiminuir_fsm|s_debounceCnt\(21) & !\debounceDiminuir_fsm|Add0~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|s_debounceCnt\(21),
	datad => VCC,
	cin => \debounceDiminuir_fsm|Add0~41\,
	combout => \debounceDiminuir_fsm|Add0~42_combout\,
	cout => \debounceDiminuir_fsm|Add0~43\);

-- Location: LCCOMB_X85_Y19_N26
\debounceDiminuir_fsm|s_debounceCnt[21]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|s_debounceCnt[21]~11_combout\ = (\debounceDiminuir_fsm|Add0~42_combout\ & (\debounceDiminuir_fsm|s_debounceCnt[21]~3_combout\ & \debounceDiminuir_fsm|s_debounceCnt[21]~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounceDiminuir_fsm|Add0~42_combout\,
	datac => \debounceDiminuir_fsm|s_debounceCnt[21]~3_combout\,
	datad => \debounceDiminuir_fsm|s_debounceCnt[21]~4_combout\,
	combout => \debounceDiminuir_fsm|s_debounceCnt[21]~11_combout\);

-- Location: FF_X85_Y19_N27
\debounceDiminuir_fsm|s_debounceCnt[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceDiminuir_fsm|s_debounceCnt[21]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceDiminuir_fsm|s_debounceCnt\(21));

-- Location: LCCOMB_X85_Y19_N22
\debounceDiminuir_fsm|Add0~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|Add0~44_combout\ = \debounceDiminuir_fsm|Add0~43\ $ (\debounceDiminuir_fsm|s_debounceCnt\(22))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \debounceDiminuir_fsm|s_debounceCnt\(22),
	cin => \debounceDiminuir_fsm|Add0~43\,
	combout => \debounceDiminuir_fsm|Add0~44_combout\);

-- Location: LCCOMB_X85_Y19_N30
\debounceDiminuir_fsm|s_debounceCnt[22]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|s_debounceCnt[22]~25_combout\ = (\debounceDiminuir_fsm|s_debounceCnt\(22) & (!\debounceDiminuir_fsm|LessThan0~7_combout\)) # (!\debounceDiminuir_fsm|s_debounceCnt\(22) & (((\debounceDiminuir_fsm|s_debounceCnt[21]~2_combout\) # 
-- (!\debounceDiminuir_fsm|s_previousIn~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011101000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|LessThan0~7_combout\,
	datab => \debounceDiminuir_fsm|s_debounceCnt\(22),
	datac => \debounceDiminuir_fsm|s_previousIn~q\,
	datad => \debounceDiminuir_fsm|s_debounceCnt[21]~2_combout\,
	combout => \debounceDiminuir_fsm|s_debounceCnt[22]~25_combout\);

-- Location: LCCOMB_X85_Y19_N24
\debounceDiminuir_fsm|s_debounceCnt[22]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|s_debounceCnt[22]~26_combout\ = (\debounceDiminuir_fsm|s_dirtyIn~q\ & (\debounceDiminuir_fsm|s_debounceCnt[22]~25_combout\ & ((\debounceDiminuir_fsm|Add0~44_combout\) # (!\debounceDiminuir_fsm|s_previousIn~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|s_previousIn~q\,
	datab => \debounceDiminuir_fsm|s_dirtyIn~q\,
	datac => \debounceDiminuir_fsm|Add0~44_combout\,
	datad => \debounceDiminuir_fsm|s_debounceCnt[22]~25_combout\,
	combout => \debounceDiminuir_fsm|s_debounceCnt[22]~26_combout\);

-- Location: FF_X85_Y19_N25
\debounceDiminuir_fsm|s_debounceCnt[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceDiminuir_fsm|s_debounceCnt[22]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceDiminuir_fsm|s_debounceCnt\(22));

-- Location: LCCOMB_X85_Y20_N6
\debounceDiminuir_fsm|s_pulsedOut~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|s_pulsedOut~6_combout\ = (\debounceDiminuir_fsm|s_dirtyIn~q\ & (!\debounceDiminuir_fsm|s_debounceCnt\(22) & (\debounceDiminuir_fsm|s_previousIn~q\ & \debounceDiminuir_fsm|s_debounceCnt\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|s_dirtyIn~q\,
	datab => \debounceDiminuir_fsm|s_debounceCnt\(22),
	datac => \debounceDiminuir_fsm|s_previousIn~q\,
	datad => \debounceDiminuir_fsm|s_debounceCnt\(0),
	combout => \debounceDiminuir_fsm|s_pulsedOut~6_combout\);

-- Location: LCCOMB_X85_Y20_N4
\debounceDiminuir_fsm|s_pulsedOut~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceDiminuir_fsm|s_pulsedOut~7_combout\ = (\debounceDiminuir_fsm|s_pulsedOut~6_combout\ & (!\debounceDiminuir_fsm|s_debounceCnt\(5) & (\debounceDiminuir_fsm|s_pulsedOut~4_combout\ & \debounceDiminuir_fsm|s_pulsedOut~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceDiminuir_fsm|s_pulsedOut~6_combout\,
	datab => \debounceDiminuir_fsm|s_debounceCnt\(5),
	datac => \debounceDiminuir_fsm|s_pulsedOut~4_combout\,
	datad => \debounceDiminuir_fsm|s_pulsedOut~5_combout\,
	combout => \debounceDiminuir_fsm|s_pulsedOut~7_combout\);

-- Location: FF_X85_Y20_N5
\debounceDiminuir_fsm|s_pulsedOut\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceDiminuir_fsm|s_pulsedOut~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceDiminuir_fsm|s_pulsedOut~q\);

-- Location: LCCOMB_X101_Y30_N10
\debounceAumentar_fsm|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|Add0~0_combout\ = \debounceAumentar_fsm|s_debounceCnt\(0) $ (VCC)
-- \debounceAumentar_fsm|Add0~1\ = CARRY(\debounceAumentar_fsm|s_debounceCnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounceAumentar_fsm|s_debounceCnt\(0),
	datad => VCC,
	combout => \debounceAumentar_fsm|Add0~0_combout\,
	cout => \debounceAumentar_fsm|Add0~1\);

-- Location: IOIBUF_X115_Y53_N15
\KEY[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(1),
	o => \KEY[1]~input_o\);

-- Location: FF_X103_Y30_N25
\debounceAumentar_fsm|s_dirtyIn\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \KEY[1]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceAumentar_fsm|s_dirtyIn~q\);

-- Location: LCCOMB_X103_Y30_N30
\debounceAumentar_fsm|s_previousIn~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|s_previousIn~feeder_combout\ = \debounceAumentar_fsm|s_dirtyIn~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \debounceAumentar_fsm|s_dirtyIn~q\,
	combout => \debounceAumentar_fsm|s_previousIn~feeder_combout\);

-- Location: FF_X103_Y30_N31
\debounceAumentar_fsm|s_previousIn\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceAumentar_fsm|s_previousIn~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceAumentar_fsm|s_previousIn~q\);

-- Location: LCCOMB_X101_Y30_N12
\debounceAumentar_fsm|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|Add0~2_combout\ = (\debounceAumentar_fsm|s_debounceCnt\(1) & (\debounceAumentar_fsm|Add0~1\ & VCC)) # (!\debounceAumentar_fsm|s_debounceCnt\(1) & (!\debounceAumentar_fsm|Add0~1\))
-- \debounceAumentar_fsm|Add0~3\ = CARRY((!\debounceAumentar_fsm|s_debounceCnt\(1) & !\debounceAumentar_fsm|Add0~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|s_debounceCnt\(1),
	datad => VCC,
	cin => \debounceAumentar_fsm|Add0~1\,
	combout => \debounceAumentar_fsm|Add0~2_combout\,
	cout => \debounceAumentar_fsm|Add0~3\);

-- Location: LCCOMB_X101_Y30_N14
\debounceAumentar_fsm|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|Add0~4_combout\ = (\debounceAumentar_fsm|s_debounceCnt\(2) & ((GND) # (!\debounceAumentar_fsm|Add0~3\))) # (!\debounceAumentar_fsm|s_debounceCnt\(2) & (\debounceAumentar_fsm|Add0~3\ $ (GND)))
-- \debounceAumentar_fsm|Add0~5\ = CARRY((\debounceAumentar_fsm|s_debounceCnt\(2)) # (!\debounceAumentar_fsm|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounceAumentar_fsm|s_debounceCnt\(2),
	datad => VCC,
	cin => \debounceAumentar_fsm|Add0~3\,
	combout => \debounceAumentar_fsm|Add0~4_combout\,
	cout => \debounceAumentar_fsm|Add0~5\);

-- Location: LCCOMB_X101_Y30_N0
\debounceAumentar_fsm|s_debounceCnt~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|s_debounceCnt~20_combout\ = (\debounceAumentar_fsm|s_previousIn~q\ & (\debounceAumentar_fsm|Add0~4_combout\ & \debounceAumentar_fsm|s_debounceCnt[5]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|s_previousIn~q\,
	datac => \debounceAumentar_fsm|Add0~4_combout\,
	datad => \debounceAumentar_fsm|s_debounceCnt[5]~0_combout\,
	combout => \debounceAumentar_fsm|s_debounceCnt~20_combout\);

-- Location: FF_X101_Y30_N1
\debounceAumentar_fsm|s_debounceCnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceAumentar_fsm|s_debounceCnt~20_combout\,
	ena => \debounceAumentar_fsm|s_debounceCnt[5]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceAumentar_fsm|s_debounceCnt\(2));

-- Location: LCCOMB_X101_Y30_N16
\debounceAumentar_fsm|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|Add0~6_combout\ = (\debounceAumentar_fsm|s_debounceCnt\(3) & (\debounceAumentar_fsm|Add0~5\ & VCC)) # (!\debounceAumentar_fsm|s_debounceCnt\(3) & (!\debounceAumentar_fsm|Add0~5\))
-- \debounceAumentar_fsm|Add0~7\ = CARRY((!\debounceAumentar_fsm|s_debounceCnt\(3) & !\debounceAumentar_fsm|Add0~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|s_debounceCnt\(3),
	datad => VCC,
	cin => \debounceAumentar_fsm|Add0~5\,
	combout => \debounceAumentar_fsm|Add0~6_combout\,
	cout => \debounceAumentar_fsm|Add0~7\);

-- Location: LCCOMB_X101_Y30_N6
\debounceAumentar_fsm|s_debounceCnt~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|s_debounceCnt~21_combout\ = (\debounceAumentar_fsm|Add0~6_combout\ & (\debounceAumentar_fsm|s_previousIn~q\ & \debounceAumentar_fsm|s_debounceCnt[5]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounceAumentar_fsm|Add0~6_combout\,
	datac => \debounceAumentar_fsm|s_previousIn~q\,
	datad => \debounceAumentar_fsm|s_debounceCnt[5]~0_combout\,
	combout => \debounceAumentar_fsm|s_debounceCnt~21_combout\);

-- Location: FF_X101_Y30_N7
\debounceAumentar_fsm|s_debounceCnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceAumentar_fsm|s_debounceCnt~21_combout\,
	ena => \debounceAumentar_fsm|s_debounceCnt[5]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceAumentar_fsm|s_debounceCnt\(3));

-- Location: LCCOMB_X101_Y30_N18
\debounceAumentar_fsm|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|Add0~8_combout\ = (\debounceAumentar_fsm|s_debounceCnt\(4) & ((GND) # (!\debounceAumentar_fsm|Add0~7\))) # (!\debounceAumentar_fsm|s_debounceCnt\(4) & (\debounceAumentar_fsm|Add0~7\ $ (GND)))
-- \debounceAumentar_fsm|Add0~9\ = CARRY((\debounceAumentar_fsm|s_debounceCnt\(4)) # (!\debounceAumentar_fsm|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounceAumentar_fsm|s_debounceCnt\(4),
	datad => VCC,
	cin => \debounceAumentar_fsm|Add0~7\,
	combout => \debounceAumentar_fsm|Add0~8_combout\,
	cout => \debounceAumentar_fsm|Add0~9\);

-- Location: LCCOMB_X101_Y30_N8
\debounceAumentar_fsm|s_debounceCnt~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|s_debounceCnt~22_combout\ = (\debounceAumentar_fsm|Add0~8_combout\ & (\debounceAumentar_fsm|s_previousIn~q\ & \debounceAumentar_fsm|s_debounceCnt[5]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounceAumentar_fsm|Add0~8_combout\,
	datac => \debounceAumentar_fsm|s_previousIn~q\,
	datad => \debounceAumentar_fsm|s_debounceCnt[5]~0_combout\,
	combout => \debounceAumentar_fsm|s_debounceCnt~22_combout\);

-- Location: FF_X101_Y30_N9
\debounceAumentar_fsm|s_debounceCnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceAumentar_fsm|s_debounceCnt~22_combout\,
	ena => \debounceAumentar_fsm|s_debounceCnt[5]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceAumentar_fsm|s_debounceCnt\(4));

-- Location: LCCOMB_X101_Y30_N20
\debounceAumentar_fsm|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|Add0~10_combout\ = (\debounceAumentar_fsm|s_debounceCnt\(5) & (\debounceAumentar_fsm|Add0~9\ & VCC)) # (!\debounceAumentar_fsm|s_debounceCnt\(5) & (!\debounceAumentar_fsm|Add0~9\))
-- \debounceAumentar_fsm|Add0~11\ = CARRY((!\debounceAumentar_fsm|s_debounceCnt\(5) & !\debounceAumentar_fsm|Add0~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounceAumentar_fsm|s_debounceCnt\(5),
	datad => VCC,
	cin => \debounceAumentar_fsm|Add0~9\,
	combout => \debounceAumentar_fsm|Add0~10_combout\,
	cout => \debounceAumentar_fsm|Add0~11\);

-- Location: LCCOMB_X101_Y30_N4
\debounceAumentar_fsm|s_debounceCnt~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|s_debounceCnt~27_combout\ = (\debounceAumentar_fsm|Add0~10_combout\ & (\debounceAumentar_fsm|s_previousIn~q\ & \debounceAumentar_fsm|s_debounceCnt[5]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounceAumentar_fsm|Add0~10_combout\,
	datac => \debounceAumentar_fsm|s_previousIn~q\,
	datad => \debounceAumentar_fsm|s_debounceCnt[5]~0_combout\,
	combout => \debounceAumentar_fsm|s_debounceCnt~27_combout\);

-- Location: FF_X101_Y30_N5
\debounceAumentar_fsm|s_debounceCnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceAumentar_fsm|s_debounceCnt~27_combout\,
	ena => \debounceAumentar_fsm|s_debounceCnt[5]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceAumentar_fsm|s_debounceCnt\(5));

-- Location: LCCOMB_X101_Y30_N22
\debounceAumentar_fsm|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|Add0~12_combout\ = (\debounceAumentar_fsm|s_debounceCnt\(6) & ((GND) # (!\debounceAumentar_fsm|Add0~11\))) # (!\debounceAumentar_fsm|s_debounceCnt\(6) & (\debounceAumentar_fsm|Add0~11\ $ (GND)))
-- \debounceAumentar_fsm|Add0~13\ = CARRY((\debounceAumentar_fsm|s_debounceCnt\(6)) # (!\debounceAumentar_fsm|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|s_debounceCnt\(6),
	datad => VCC,
	cin => \debounceAumentar_fsm|Add0~11\,
	combout => \debounceAumentar_fsm|Add0~12_combout\,
	cout => \debounceAumentar_fsm|Add0~13\);

-- Location: LCCOMB_X102_Y29_N24
\debounceAumentar_fsm|s_debounceCnt~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|s_debounceCnt~1_combout\ = (\debounceAumentar_fsm|s_debounceCnt[5]~0_combout\ & ((\debounceAumentar_fsm|Add0~12_combout\) # (!\debounceAumentar_fsm|s_previousIn~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounceAumentar_fsm|s_previousIn~q\,
	datac => \debounceAumentar_fsm|Add0~12_combout\,
	datad => \debounceAumentar_fsm|s_debounceCnt[5]~0_combout\,
	combout => \debounceAumentar_fsm|s_debounceCnt~1_combout\);

-- Location: FF_X102_Y29_N25
\debounceAumentar_fsm|s_debounceCnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceAumentar_fsm|s_debounceCnt~1_combout\,
	ena => \debounceAumentar_fsm|s_debounceCnt[5]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceAumentar_fsm|s_debounceCnt\(6));

-- Location: LCCOMB_X101_Y30_N24
\debounceAumentar_fsm|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|Add0~14_combout\ = (\debounceAumentar_fsm|s_debounceCnt\(7) & (\debounceAumentar_fsm|Add0~13\ & VCC)) # (!\debounceAumentar_fsm|s_debounceCnt\(7) & (!\debounceAumentar_fsm|Add0~13\))
-- \debounceAumentar_fsm|Add0~15\ = CARRY((!\debounceAumentar_fsm|s_debounceCnt\(7) & !\debounceAumentar_fsm|Add0~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounceAumentar_fsm|s_debounceCnt\(7),
	datad => VCC,
	cin => \debounceAumentar_fsm|Add0~13\,
	combout => \debounceAumentar_fsm|Add0~14_combout\,
	cout => \debounceAumentar_fsm|Add0~15\);

-- Location: LCCOMB_X102_Y30_N12
\debounceAumentar_fsm|s_debounceCnt~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|s_debounceCnt~11_combout\ = (\debounceAumentar_fsm|s_previousIn~q\ & (\debounceAumentar_fsm|Add0~14_combout\ & \debounceAumentar_fsm|s_debounceCnt[5]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|s_previousIn~q\,
	datab => \debounceAumentar_fsm|Add0~14_combout\,
	datad => \debounceAumentar_fsm|s_debounceCnt[5]~0_combout\,
	combout => \debounceAumentar_fsm|s_debounceCnt~11_combout\);

-- Location: FF_X102_Y30_N13
\debounceAumentar_fsm|s_debounceCnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceAumentar_fsm|s_debounceCnt~11_combout\,
	ena => \debounceAumentar_fsm|s_debounceCnt[5]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceAumentar_fsm|s_debounceCnt\(7));

-- Location: LCCOMB_X101_Y30_N26
\debounceAumentar_fsm|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|Add0~16_combout\ = (\debounceAumentar_fsm|s_debounceCnt\(8) & ((GND) # (!\debounceAumentar_fsm|Add0~15\))) # (!\debounceAumentar_fsm|s_debounceCnt\(8) & (\debounceAumentar_fsm|Add0~15\ $ (GND)))
-- \debounceAumentar_fsm|Add0~17\ = CARRY((\debounceAumentar_fsm|s_debounceCnt\(8)) # (!\debounceAumentar_fsm|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|s_debounceCnt\(8),
	datad => VCC,
	cin => \debounceAumentar_fsm|Add0~15\,
	combout => \debounceAumentar_fsm|Add0~16_combout\,
	cout => \debounceAumentar_fsm|Add0~17\);

-- Location: LCCOMB_X102_Y30_N30
\debounceAumentar_fsm|s_debounceCnt~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|s_debounceCnt~12_combout\ = (\debounceAumentar_fsm|s_debounceCnt[5]~0_combout\ & ((\debounceAumentar_fsm|Add0~16_combout\) # (!\debounceAumentar_fsm|s_previousIn~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|s_previousIn~q\,
	datac => \debounceAumentar_fsm|Add0~16_combout\,
	datad => \debounceAumentar_fsm|s_debounceCnt[5]~0_combout\,
	combout => \debounceAumentar_fsm|s_debounceCnt~12_combout\);

-- Location: FF_X102_Y30_N31
\debounceAumentar_fsm|s_debounceCnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceAumentar_fsm|s_debounceCnt~12_combout\,
	ena => \debounceAumentar_fsm|s_debounceCnt[5]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceAumentar_fsm|s_debounceCnt\(8));

-- Location: LCCOMB_X101_Y30_N28
\debounceAumentar_fsm|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|Add0~18_combout\ = (\debounceAumentar_fsm|s_debounceCnt\(9) & (\debounceAumentar_fsm|Add0~17\ & VCC)) # (!\debounceAumentar_fsm|s_debounceCnt\(9) & (!\debounceAumentar_fsm|Add0~17\))
-- \debounceAumentar_fsm|Add0~19\ = CARRY((!\debounceAumentar_fsm|s_debounceCnt\(9) & !\debounceAumentar_fsm|Add0~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounceAumentar_fsm|s_debounceCnt\(9),
	datad => VCC,
	cin => \debounceAumentar_fsm|Add0~17\,
	combout => \debounceAumentar_fsm|Add0~18_combout\,
	cout => \debounceAumentar_fsm|Add0~19\);

-- Location: LCCOMB_X102_Y30_N8
\debounceAumentar_fsm|s_debounceCnt~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|s_debounceCnt~13_combout\ = (\debounceAumentar_fsm|s_debounceCnt[5]~0_combout\ & ((\debounceAumentar_fsm|Add0~18_combout\) # (!\debounceAumentar_fsm|s_previousIn~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounceAumentar_fsm|Add0~18_combout\,
	datac => \debounceAumentar_fsm|s_previousIn~q\,
	datad => \debounceAumentar_fsm|s_debounceCnt[5]~0_combout\,
	combout => \debounceAumentar_fsm|s_debounceCnt~13_combout\);

-- Location: FF_X102_Y30_N9
\debounceAumentar_fsm|s_debounceCnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceAumentar_fsm|s_debounceCnt~13_combout\,
	ena => \debounceAumentar_fsm|s_debounceCnt[5]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceAumentar_fsm|s_debounceCnt\(9));

-- Location: LCCOMB_X101_Y30_N30
\debounceAumentar_fsm|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|Add0~20_combout\ = (\debounceAumentar_fsm|s_debounceCnt\(10) & ((GND) # (!\debounceAumentar_fsm|Add0~19\))) # (!\debounceAumentar_fsm|s_debounceCnt\(10) & (\debounceAumentar_fsm|Add0~19\ $ (GND)))
-- \debounceAumentar_fsm|Add0~21\ = CARRY((\debounceAumentar_fsm|s_debounceCnt\(10)) # (!\debounceAumentar_fsm|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounceAumentar_fsm|s_debounceCnt\(10),
	datad => VCC,
	cin => \debounceAumentar_fsm|Add0~19\,
	combout => \debounceAumentar_fsm|Add0~20_combout\,
	cout => \debounceAumentar_fsm|Add0~21\);

-- Location: LCCOMB_X102_Y29_N12
\debounceAumentar_fsm|s_debounceCnt~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|s_debounceCnt~14_combout\ = (\debounceAumentar_fsm|s_previousIn~q\ & (\debounceAumentar_fsm|Add0~20_combout\ & \debounceAumentar_fsm|s_debounceCnt[5]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounceAumentar_fsm|s_previousIn~q\,
	datac => \debounceAumentar_fsm|Add0~20_combout\,
	datad => \debounceAumentar_fsm|s_debounceCnt[5]~0_combout\,
	combout => \debounceAumentar_fsm|s_debounceCnt~14_combout\);

-- Location: FF_X102_Y29_N13
\debounceAumentar_fsm|s_debounceCnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceAumentar_fsm|s_debounceCnt~14_combout\,
	ena => \debounceAumentar_fsm|s_debounceCnt[5]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceAumentar_fsm|s_debounceCnt\(10));

-- Location: LCCOMB_X102_Y30_N10
\debounceAumentar_fsm|s_pulsedOut~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|s_pulsedOut~2_combout\ = (!\debounceAumentar_fsm|s_debounceCnt\(7) & (!\debounceAumentar_fsm|s_debounceCnt\(9) & (!\debounceAumentar_fsm|s_debounceCnt\(8) & !\debounceAumentar_fsm|s_debounceCnt\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|s_debounceCnt\(7),
	datab => \debounceAumentar_fsm|s_debounceCnt\(9),
	datac => \debounceAumentar_fsm|s_debounceCnt\(8),
	datad => \debounceAumentar_fsm|s_debounceCnt\(10),
	combout => \debounceAumentar_fsm|s_pulsedOut~2_combout\);

-- Location: LCCOMB_X101_Y29_N0
\debounceAumentar_fsm|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|Add0~22_combout\ = (\debounceAumentar_fsm|s_debounceCnt\(11) & (\debounceAumentar_fsm|Add0~21\ & VCC)) # (!\debounceAumentar_fsm|s_debounceCnt\(11) & (!\debounceAumentar_fsm|Add0~21\))
-- \debounceAumentar_fsm|Add0~23\ = CARRY((!\debounceAumentar_fsm|s_debounceCnt\(11) & !\debounceAumentar_fsm|Add0~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounceAumentar_fsm|s_debounceCnt\(11),
	datad => VCC,
	cin => \debounceAumentar_fsm|Add0~21\,
	combout => \debounceAumentar_fsm|Add0~22_combout\,
	cout => \debounceAumentar_fsm|Add0~23\);

-- Location: LCCOMB_X102_Y29_N26
\debounceAumentar_fsm|s_debounceCnt~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|s_debounceCnt~15_combout\ = (\debounceAumentar_fsm|s_debounceCnt[5]~0_combout\ & ((\debounceAumentar_fsm|Add0~22_combout\) # (!\debounceAumentar_fsm|s_previousIn~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|Add0~22_combout\,
	datab => \debounceAumentar_fsm|s_previousIn~q\,
	datad => \debounceAumentar_fsm|s_debounceCnt[5]~0_combout\,
	combout => \debounceAumentar_fsm|s_debounceCnt~15_combout\);

-- Location: FF_X102_Y29_N27
\debounceAumentar_fsm|s_debounceCnt[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceAumentar_fsm|s_debounceCnt~15_combout\,
	ena => \debounceAumentar_fsm|s_debounceCnt[5]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceAumentar_fsm|s_debounceCnt\(11));

-- Location: LCCOMB_X101_Y29_N2
\debounceAumentar_fsm|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|Add0~24_combout\ = (\debounceAumentar_fsm|s_debounceCnt\(12) & ((GND) # (!\debounceAumentar_fsm|Add0~23\))) # (!\debounceAumentar_fsm|s_debounceCnt\(12) & (\debounceAumentar_fsm|Add0~23\ $ (GND)))
-- \debounceAumentar_fsm|Add0~25\ = CARRY((\debounceAumentar_fsm|s_debounceCnt\(12)) # (!\debounceAumentar_fsm|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|s_debounceCnt\(12),
	datad => VCC,
	cin => \debounceAumentar_fsm|Add0~23\,
	combout => \debounceAumentar_fsm|Add0~24_combout\,
	cout => \debounceAumentar_fsm|Add0~25\);

-- Location: LCCOMB_X102_Y29_N6
\debounceAumentar_fsm|s_debounceCnt~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|s_debounceCnt~7_combout\ = (\debounceAumentar_fsm|Add0~24_combout\ & (\debounceAumentar_fsm|s_previousIn~q\ & \debounceAumentar_fsm|s_debounceCnt[5]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|Add0~24_combout\,
	datab => \debounceAumentar_fsm|s_previousIn~q\,
	datad => \debounceAumentar_fsm|s_debounceCnt[5]~0_combout\,
	combout => \debounceAumentar_fsm|s_debounceCnt~7_combout\);

-- Location: FF_X102_Y29_N7
\debounceAumentar_fsm|s_debounceCnt[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceAumentar_fsm|s_debounceCnt~7_combout\,
	ena => \debounceAumentar_fsm|s_debounceCnt[5]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceAumentar_fsm|s_debounceCnt\(12));

-- Location: LCCOMB_X101_Y29_N4
\debounceAumentar_fsm|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|Add0~26_combout\ = (\debounceAumentar_fsm|s_debounceCnt\(13) & (\debounceAumentar_fsm|Add0~25\ & VCC)) # (!\debounceAumentar_fsm|s_debounceCnt\(13) & (!\debounceAumentar_fsm|Add0~25\))
-- \debounceAumentar_fsm|Add0~27\ = CARRY((!\debounceAumentar_fsm|s_debounceCnt\(13) & !\debounceAumentar_fsm|Add0~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounceAumentar_fsm|s_debounceCnt\(13),
	datad => VCC,
	cin => \debounceAumentar_fsm|Add0~25\,
	combout => \debounceAumentar_fsm|Add0~26_combout\,
	cout => \debounceAumentar_fsm|Add0~27\);

-- Location: LCCOMB_X102_Y29_N8
\debounceAumentar_fsm|s_debounceCnt~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|s_debounceCnt~8_combout\ = (\debounceAumentar_fsm|s_previousIn~q\ & (\debounceAumentar_fsm|Add0~26_combout\ & \debounceAumentar_fsm|s_debounceCnt[5]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounceAumentar_fsm|s_previousIn~q\,
	datac => \debounceAumentar_fsm|Add0~26_combout\,
	datad => \debounceAumentar_fsm|s_debounceCnt[5]~0_combout\,
	combout => \debounceAumentar_fsm|s_debounceCnt~8_combout\);

-- Location: FF_X102_Y29_N9
\debounceAumentar_fsm|s_debounceCnt[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceAumentar_fsm|s_debounceCnt~8_combout\,
	ena => \debounceAumentar_fsm|s_debounceCnt[5]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceAumentar_fsm|s_debounceCnt\(13));

-- Location: LCCOMB_X101_Y29_N6
\debounceAumentar_fsm|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|Add0~28_combout\ = (\debounceAumentar_fsm|s_debounceCnt\(14) & ((GND) # (!\debounceAumentar_fsm|Add0~27\))) # (!\debounceAumentar_fsm|s_debounceCnt\(14) & (\debounceAumentar_fsm|Add0~27\ $ (GND)))
-- \debounceAumentar_fsm|Add0~29\ = CARRY((\debounceAumentar_fsm|s_debounceCnt\(14)) # (!\debounceAumentar_fsm|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|s_debounceCnt\(14),
	datad => VCC,
	cin => \debounceAumentar_fsm|Add0~27\,
	combout => \debounceAumentar_fsm|Add0~28_combout\,
	cout => \debounceAumentar_fsm|Add0~29\);

-- Location: LCCOMB_X102_Y29_N20
\debounceAumentar_fsm|s_debounceCnt~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|s_debounceCnt~16_combout\ = (\debounceAumentar_fsm|s_debounceCnt[5]~0_combout\ & ((\debounceAumentar_fsm|Add0~28_combout\) # (!\debounceAumentar_fsm|s_previousIn~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounceAumentar_fsm|s_previousIn~q\,
	datac => \debounceAumentar_fsm|Add0~28_combout\,
	datad => \debounceAumentar_fsm|s_debounceCnt[5]~0_combout\,
	combout => \debounceAumentar_fsm|s_debounceCnt~16_combout\);

-- Location: FF_X102_Y29_N21
\debounceAumentar_fsm|s_debounceCnt[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceAumentar_fsm|s_debounceCnt~16_combout\,
	ena => \debounceAumentar_fsm|s_debounceCnt[5]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceAumentar_fsm|s_debounceCnt\(14));

-- Location: LCCOMB_X101_Y29_N8
\debounceAumentar_fsm|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|Add0~30_combout\ = (\debounceAumentar_fsm|s_debounceCnt\(15) & (\debounceAumentar_fsm|Add0~29\ & VCC)) # (!\debounceAumentar_fsm|s_debounceCnt\(15) & (!\debounceAumentar_fsm|Add0~29\))
-- \debounceAumentar_fsm|Add0~31\ = CARRY((!\debounceAumentar_fsm|s_debounceCnt\(15) & !\debounceAumentar_fsm|Add0~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|s_debounceCnt\(15),
	datad => VCC,
	cin => \debounceAumentar_fsm|Add0~29\,
	combout => \debounceAumentar_fsm|Add0~30_combout\,
	cout => \debounceAumentar_fsm|Add0~31\);

-- Location: LCCOMB_X102_Y29_N30
\debounceAumentar_fsm|s_debounceCnt~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|s_debounceCnt~4_combout\ = (\debounceAumentar_fsm|Add0~30_combout\ & (\debounceAumentar_fsm|s_previousIn~q\ & \debounceAumentar_fsm|s_debounceCnt[5]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|Add0~30_combout\,
	datab => \debounceAumentar_fsm|s_previousIn~q\,
	datad => \debounceAumentar_fsm|s_debounceCnt[5]~0_combout\,
	combout => \debounceAumentar_fsm|s_debounceCnt~4_combout\);

-- Location: FF_X102_Y29_N31
\debounceAumentar_fsm|s_debounceCnt[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceAumentar_fsm|s_debounceCnt~4_combout\,
	ena => \debounceAumentar_fsm|s_debounceCnt[5]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceAumentar_fsm|s_debounceCnt\(15));

-- Location: LCCOMB_X101_Y29_N10
\debounceAumentar_fsm|Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|Add0~32_combout\ = (\debounceAumentar_fsm|s_debounceCnt\(16) & ((GND) # (!\debounceAumentar_fsm|Add0~31\))) # (!\debounceAumentar_fsm|s_debounceCnt\(16) & (\debounceAumentar_fsm|Add0~31\ $ (GND)))
-- \debounceAumentar_fsm|Add0~33\ = CARRY((\debounceAumentar_fsm|s_debounceCnt\(16)) # (!\debounceAumentar_fsm|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounceAumentar_fsm|s_debounceCnt\(16),
	datad => VCC,
	cin => \debounceAumentar_fsm|Add0~31\,
	combout => \debounceAumentar_fsm|Add0~32_combout\,
	cout => \debounceAumentar_fsm|Add0~33\);

-- Location: LCCOMB_X101_Y29_N24
\debounceAumentar_fsm|s_debounceCnt~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|s_debounceCnt~5_combout\ = (\debounceAumentar_fsm|Add0~32_combout\ & (\debounceAumentar_fsm|s_previousIn~q\ & \debounceAumentar_fsm|s_debounceCnt[5]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|Add0~32_combout\,
	datac => \debounceAumentar_fsm|s_previousIn~q\,
	datad => \debounceAumentar_fsm|s_debounceCnt[5]~0_combout\,
	combout => \debounceAumentar_fsm|s_debounceCnt~5_combout\);

-- Location: FF_X101_Y29_N25
\debounceAumentar_fsm|s_debounceCnt[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceAumentar_fsm|s_debounceCnt~5_combout\,
	ena => \debounceAumentar_fsm|s_debounceCnt[5]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceAumentar_fsm|s_debounceCnt\(16));

-- Location: LCCOMB_X101_Y29_N12
\debounceAumentar_fsm|Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|Add0~34_combout\ = (\debounceAumentar_fsm|s_debounceCnt\(17) & (\debounceAumentar_fsm|Add0~33\ & VCC)) # (!\debounceAumentar_fsm|s_debounceCnt\(17) & (!\debounceAumentar_fsm|Add0~33\))
-- \debounceAumentar_fsm|Add0~35\ = CARRY((!\debounceAumentar_fsm|s_debounceCnt\(17) & !\debounceAumentar_fsm|Add0~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|s_debounceCnt\(17),
	datad => VCC,
	cin => \debounceAumentar_fsm|Add0~33\,
	combout => \debounceAumentar_fsm|Add0~34_combout\,
	cout => \debounceAumentar_fsm|Add0~35\);

-- Location: LCCOMB_X101_Y29_N26
\debounceAumentar_fsm|s_debounceCnt~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|s_debounceCnt~6_combout\ = (\debounceAumentar_fsm|Add0~34_combout\ & (\debounceAumentar_fsm|s_previousIn~q\ & \debounceAumentar_fsm|s_debounceCnt[5]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|Add0~34_combout\,
	datac => \debounceAumentar_fsm|s_previousIn~q\,
	datad => \debounceAumentar_fsm|s_debounceCnt[5]~0_combout\,
	combout => \debounceAumentar_fsm|s_debounceCnt~6_combout\);

-- Location: FF_X101_Y29_N27
\debounceAumentar_fsm|s_debounceCnt[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceAumentar_fsm|s_debounceCnt~6_combout\,
	ena => \debounceAumentar_fsm|s_debounceCnt[5]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceAumentar_fsm|s_debounceCnt\(17));

-- Location: LCCOMB_X101_Y29_N14
\debounceAumentar_fsm|Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|Add0~36_combout\ = (\debounceAumentar_fsm|s_debounceCnt\(18) & ((GND) # (!\debounceAumentar_fsm|Add0~35\))) # (!\debounceAumentar_fsm|s_debounceCnt\(18) & (\debounceAumentar_fsm|Add0~35\ $ (GND)))
-- \debounceAumentar_fsm|Add0~37\ = CARRY((\debounceAumentar_fsm|s_debounceCnt\(18)) # (!\debounceAumentar_fsm|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounceAumentar_fsm|s_debounceCnt\(18),
	datad => VCC,
	cin => \debounceAumentar_fsm|Add0~35\,
	combout => \debounceAumentar_fsm|Add0~36_combout\,
	cout => \debounceAumentar_fsm|Add0~37\);

-- Location: LCCOMB_X102_Y29_N22
\debounceAumentar_fsm|s_debounceCnt[18]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|s_debounceCnt[18]~17_combout\ = (\debounceAumentar_fsm|s_debounceCnt[5]~3_combout\ & (\debounceAumentar_fsm|s_debounceCnt[5]~0_combout\ & ((\debounceAumentar_fsm|Add0~36_combout\) # (!\debounceAumentar_fsm|s_previousIn~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|Add0~36_combout\,
	datab => \debounceAumentar_fsm|s_previousIn~q\,
	datac => \debounceAumentar_fsm|s_debounceCnt[5]~3_combout\,
	datad => \debounceAumentar_fsm|s_debounceCnt[5]~0_combout\,
	combout => \debounceAumentar_fsm|s_debounceCnt[18]~17_combout\);

-- Location: FF_X102_Y29_N23
\debounceAumentar_fsm|s_debounceCnt[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceAumentar_fsm|s_debounceCnt[18]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceAumentar_fsm|s_debounceCnt\(18));

-- Location: LCCOMB_X101_Y29_N16
\debounceAumentar_fsm|Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|Add0~38_combout\ = (\debounceAumentar_fsm|s_debounceCnt\(19) & (\debounceAumentar_fsm|Add0~37\ & VCC)) # (!\debounceAumentar_fsm|s_debounceCnt\(19) & (!\debounceAumentar_fsm|Add0~37\))
-- \debounceAumentar_fsm|Add0~39\ = CARRY((!\debounceAumentar_fsm|s_debounceCnt\(19) & !\debounceAumentar_fsm|Add0~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounceAumentar_fsm|s_debounceCnt\(19),
	datad => VCC,
	cin => \debounceAumentar_fsm|Add0~37\,
	combout => \debounceAumentar_fsm|Add0~38_combout\,
	cout => \debounceAumentar_fsm|Add0~39\);

-- Location: LCCOMB_X102_Y29_N16
\debounceAumentar_fsm|s_debounceCnt[19]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|s_debounceCnt[19]~18_combout\ = (\debounceAumentar_fsm|s_debounceCnt[5]~3_combout\ & (\debounceAumentar_fsm|s_debounceCnt[5]~0_combout\ & ((\debounceAumentar_fsm|Add0~38_combout\) # (!\debounceAumentar_fsm|s_previousIn~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|s_debounceCnt[5]~3_combout\,
	datab => \debounceAumentar_fsm|s_previousIn~q\,
	datac => \debounceAumentar_fsm|Add0~38_combout\,
	datad => \debounceAumentar_fsm|s_debounceCnt[5]~0_combout\,
	combout => \debounceAumentar_fsm|s_debounceCnt[19]~18_combout\);

-- Location: FF_X102_Y29_N17
\debounceAumentar_fsm|s_debounceCnt[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceAumentar_fsm|s_debounceCnt[19]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceAumentar_fsm|s_debounceCnt\(19));

-- Location: LCCOMB_X102_Y29_N10
\debounceAumentar_fsm|s_pulsedOut~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|s_pulsedOut~3_combout\ = (!\debounceAumentar_fsm|s_debounceCnt\(18) & (!\debounceAumentar_fsm|s_debounceCnt\(19) & (!\debounceAumentar_fsm|s_debounceCnt\(11) & !\debounceAumentar_fsm|s_debounceCnt\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|s_debounceCnt\(18),
	datab => \debounceAumentar_fsm|s_debounceCnt\(19),
	datac => \debounceAumentar_fsm|s_debounceCnt\(11),
	datad => \debounceAumentar_fsm|s_debounceCnt\(14),
	combout => \debounceAumentar_fsm|s_pulsedOut~3_combout\);

-- Location: LCCOMB_X101_Y29_N18
\debounceAumentar_fsm|Add0~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|Add0~40_combout\ = (\debounceAumentar_fsm|s_debounceCnt\(20) & ((GND) # (!\debounceAumentar_fsm|Add0~39\))) # (!\debounceAumentar_fsm|s_debounceCnt\(20) & (\debounceAumentar_fsm|Add0~39\ $ (GND)))
-- \debounceAumentar_fsm|Add0~41\ = CARRY((\debounceAumentar_fsm|s_debounceCnt\(20)) # (!\debounceAumentar_fsm|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounceAumentar_fsm|s_debounceCnt\(20),
	datad => VCC,
	cin => \debounceAumentar_fsm|Add0~39\,
	combout => \debounceAumentar_fsm|Add0~40_combout\,
	cout => \debounceAumentar_fsm|Add0~41\);

-- Location: LCCOMB_X101_Y29_N20
\debounceAumentar_fsm|Add0~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|Add0~42_combout\ = (\debounceAumentar_fsm|s_debounceCnt\(21) & (\debounceAumentar_fsm|Add0~41\ & VCC)) # (!\debounceAumentar_fsm|s_debounceCnt\(21) & (!\debounceAumentar_fsm|Add0~41\))
-- \debounceAumentar_fsm|Add0~43\ = CARRY((!\debounceAumentar_fsm|s_debounceCnt\(21) & !\debounceAumentar_fsm|Add0~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|s_debounceCnt\(21),
	datad => VCC,
	cin => \debounceAumentar_fsm|Add0~41\,
	combout => \debounceAumentar_fsm|Add0~42_combout\,
	cout => \debounceAumentar_fsm|Add0~43\);

-- Location: LCCOMB_X101_Y29_N30
\debounceAumentar_fsm|s_debounceCnt[21]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|s_debounceCnt[21]~10_combout\ = (\debounceAumentar_fsm|s_debounceCnt[5]~0_combout\ & (\debounceAumentar_fsm|s_previousIn~q\ & (\debounceAumentar_fsm|s_debounceCnt[5]~3_combout\ & \debounceAumentar_fsm|Add0~42_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|s_debounceCnt[5]~0_combout\,
	datab => \debounceAumentar_fsm|s_previousIn~q\,
	datac => \debounceAumentar_fsm|s_debounceCnt[5]~3_combout\,
	datad => \debounceAumentar_fsm|Add0~42_combout\,
	combout => \debounceAumentar_fsm|s_debounceCnt[21]~10_combout\);

-- Location: FF_X101_Y29_N31
\debounceAumentar_fsm|s_debounceCnt[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceAumentar_fsm|s_debounceCnt[21]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceAumentar_fsm|s_debounceCnt\(21));

-- Location: LCCOMB_X102_Y29_N14
\debounceAumentar_fsm|s_pulsedOut~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|s_pulsedOut~1_combout\ = (!\debounceAumentar_fsm|s_debounceCnt\(12) & (!\debounceAumentar_fsm|s_debounceCnt\(20) & (!\debounceAumentar_fsm|s_debounceCnt\(13) & !\debounceAumentar_fsm|s_debounceCnt\(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|s_debounceCnt\(12),
	datab => \debounceAumentar_fsm|s_debounceCnt\(20),
	datac => \debounceAumentar_fsm|s_debounceCnt\(13),
	datad => \debounceAumentar_fsm|s_debounceCnt\(21),
	combout => \debounceAumentar_fsm|s_pulsedOut~1_combout\);

-- Location: LCCOMB_X102_Y29_N0
\debounceAumentar_fsm|s_pulsedOut~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|s_pulsedOut~0_combout\ = (!\debounceAumentar_fsm|s_debounceCnt\(17) & (!\debounceAumentar_fsm|s_debounceCnt\(6) & (!\debounceAumentar_fsm|s_debounceCnt\(15) & !\debounceAumentar_fsm|s_debounceCnt\(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|s_debounceCnt\(17),
	datab => \debounceAumentar_fsm|s_debounceCnt\(6),
	datac => \debounceAumentar_fsm|s_debounceCnt\(15),
	datad => \debounceAumentar_fsm|s_debounceCnt\(16),
	combout => \debounceAumentar_fsm|s_pulsedOut~0_combout\);

-- Location: LCCOMB_X102_Y30_N24
\debounceAumentar_fsm|s_pulsedOut~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|s_pulsedOut~4_combout\ = (\debounceAumentar_fsm|s_pulsedOut~2_combout\ & (\debounceAumentar_fsm|s_pulsedOut~3_combout\ & (\debounceAumentar_fsm|s_pulsedOut~1_combout\ & \debounceAumentar_fsm|s_pulsedOut~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|s_pulsedOut~2_combout\,
	datab => \debounceAumentar_fsm|s_pulsedOut~3_combout\,
	datac => \debounceAumentar_fsm|s_pulsedOut~1_combout\,
	datad => \debounceAumentar_fsm|s_pulsedOut~0_combout\,
	combout => \debounceAumentar_fsm|s_pulsedOut~4_combout\);

-- Location: LCCOMB_X102_Y30_N16
\debounceAumentar_fsm|s_debounceCnt[5]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|s_debounceCnt[5]~2_combout\ = (\debounceAumentar_fsm|s_debounceCnt\(0)) # (((\debounceAumentar_fsm|s_debounceCnt\(5)) # (!\debounceAumentar_fsm|s_pulsedOut~4_combout\)) # (!\debounceAumentar_fsm|s_pulsedOut~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|s_debounceCnt\(0),
	datab => \debounceAumentar_fsm|s_pulsedOut~5_combout\,
	datac => \debounceAumentar_fsm|s_debounceCnt\(5),
	datad => \debounceAumentar_fsm|s_pulsedOut~4_combout\,
	combout => \debounceAumentar_fsm|s_debounceCnt[5]~2_combout\);

-- Location: LCCOMB_X102_Y30_N2
\debounceAumentar_fsm|LessThan0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|LessThan0~6_combout\ = (\debounceAumentar_fsm|s_debounceCnt\(6) & (((\debounceAumentar_fsm|s_debounceCnt\(5)) # (\debounceAumentar_fsm|s_debounceCnt\(0))) # (!\debounceAumentar_fsm|s_pulsedOut~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|s_debounceCnt\(6),
	datab => \debounceAumentar_fsm|s_pulsedOut~5_combout\,
	datac => \debounceAumentar_fsm|s_debounceCnt\(5),
	datad => \debounceAumentar_fsm|s_debounceCnt\(0),
	combout => \debounceAumentar_fsm|LessThan0~6_combout\);

-- Location: LCCOMB_X102_Y29_N18
\debounceAumentar_fsm|LessThan0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|LessThan0~4_combout\ = (\debounceAumentar_fsm|s_debounceCnt\(18) & (\debounceAumentar_fsm|s_debounceCnt\(14) & (\debounceAumentar_fsm|s_debounceCnt\(8) & \debounceAumentar_fsm|s_debounceCnt\(19))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|s_debounceCnt\(18),
	datab => \debounceAumentar_fsm|s_debounceCnt\(14),
	datac => \debounceAumentar_fsm|s_debounceCnt\(8),
	datad => \debounceAumentar_fsm|s_debounceCnt\(19),
	combout => \debounceAumentar_fsm|LessThan0~4_combout\);

-- Location: LCCOMB_X102_Y30_N4
\debounceAumentar_fsm|LessThan0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|LessThan0~5_combout\ = (\debounceAumentar_fsm|s_debounceCnt\(9) & (\debounceAumentar_fsm|s_debounceCnt\(11) & \debounceAumentar_fsm|LessThan0~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounceAumentar_fsm|s_debounceCnt\(9),
	datac => \debounceAumentar_fsm|s_debounceCnt\(11),
	datad => \debounceAumentar_fsm|LessThan0~4_combout\,
	combout => \debounceAumentar_fsm|LessThan0~5_combout\);

-- Location: LCCOMB_X102_Y29_N28
\debounceAumentar_fsm|LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|LessThan0~1_combout\ = (\debounceAumentar_fsm|s_debounceCnt\(12)) # ((\debounceAumentar_fsm|s_debounceCnt\(13)) # ((\debounceAumentar_fsm|s_debounceCnt\(11) & \debounceAumentar_fsm|s_debounceCnt\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|s_debounceCnt\(12),
	datab => \debounceAumentar_fsm|s_debounceCnt\(13),
	datac => \debounceAumentar_fsm|s_debounceCnt\(11),
	datad => \debounceAumentar_fsm|s_debounceCnt\(10),
	combout => \debounceAumentar_fsm|LessThan0~1_combout\);

-- Location: LCCOMB_X102_Y29_N2
\debounceAumentar_fsm|LessThan0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|LessThan0~2_combout\ = (\debounceAumentar_fsm|s_debounceCnt\(15)) # ((\debounceAumentar_fsm|s_debounceCnt\(16)) # ((\debounceAumentar_fsm|s_debounceCnt\(14) & \debounceAumentar_fsm|LessThan0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|s_debounceCnt\(15),
	datab => \debounceAumentar_fsm|s_debounceCnt\(16),
	datac => \debounceAumentar_fsm|s_debounceCnt\(14),
	datad => \debounceAumentar_fsm|LessThan0~1_combout\,
	combout => \debounceAumentar_fsm|LessThan0~2_combout\);

-- Location: LCCOMB_X102_Y29_N4
\debounceAumentar_fsm|LessThan0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|LessThan0~3_combout\ = (\debounceAumentar_fsm|s_debounceCnt\(19) & (\debounceAumentar_fsm|s_debounceCnt\(18) & ((\debounceAumentar_fsm|s_debounceCnt\(17)) # (\debounceAumentar_fsm|LessThan0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|s_debounceCnt\(17),
	datab => \debounceAumentar_fsm|s_debounceCnt\(19),
	datac => \debounceAumentar_fsm|s_debounceCnt\(18),
	datad => \debounceAumentar_fsm|LessThan0~2_combout\,
	combout => \debounceAumentar_fsm|LessThan0~3_combout\);

-- Location: LCCOMB_X102_Y30_N0
\debounceAumentar_fsm|LessThan0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|LessThan0~7_combout\ = (\debounceAumentar_fsm|LessThan0~3_combout\) # ((\debounceAumentar_fsm|LessThan0~5_combout\ & ((\debounceAumentar_fsm|s_debounceCnt\(7)) # (\debounceAumentar_fsm|LessThan0~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|s_debounceCnt\(7),
	datab => \debounceAumentar_fsm|LessThan0~6_combout\,
	datac => \debounceAumentar_fsm|LessThan0~5_combout\,
	datad => \debounceAumentar_fsm|LessThan0~3_combout\,
	combout => \debounceAumentar_fsm|LessThan0~7_combout\);

-- Location: LCCOMB_X102_Y30_N20
\debounceAumentar_fsm|s_debounceCnt[22]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|s_debounceCnt[22]~24_combout\ = (\debounceAumentar_fsm|s_debounceCnt\(22) & (\debounceAumentar_fsm|LessThan0~0_combout\ & ((!\debounceAumentar_fsm|LessThan0~7_combout\)))) # (!\debounceAumentar_fsm|s_debounceCnt\(22) & 
-- (((\debounceAumentar_fsm|s_debounceCnt[5]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|LessThan0~0_combout\,
	datab => \debounceAumentar_fsm|s_debounceCnt[5]~2_combout\,
	datac => \debounceAumentar_fsm|s_debounceCnt\(22),
	datad => \debounceAumentar_fsm|LessThan0~7_combout\,
	combout => \debounceAumentar_fsm|s_debounceCnt[22]~24_combout\);

-- Location: LCCOMB_X102_Y30_N22
\debounceAumentar_fsm|s_debounceCnt[22]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|s_debounceCnt[22]~25_combout\ = (\debounceAumentar_fsm|s_dirtyIn~q\ & \debounceAumentar_fsm|s_debounceCnt[22]~24_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounceAumentar_fsm|s_dirtyIn~q\,
	datad => \debounceAumentar_fsm|s_debounceCnt[22]~24_combout\,
	combout => \debounceAumentar_fsm|s_debounceCnt[22]~25_combout\);

-- Location: LCCOMB_X101_Y29_N22
\debounceAumentar_fsm|Add0~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|Add0~44_combout\ = \debounceAumentar_fsm|Add0~43\ $ (\debounceAumentar_fsm|s_debounceCnt\(22))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \debounceAumentar_fsm|s_debounceCnt\(22),
	cin => \debounceAumentar_fsm|Add0~43\,
	combout => \debounceAumentar_fsm|Add0~44_combout\);

-- Location: LCCOMB_X102_Y30_N26
\debounceAumentar_fsm|s_debounceCnt[22]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|s_debounceCnt[22]~26_combout\ = (\debounceAumentar_fsm|s_previousIn~q\ & (((\debounceAumentar_fsm|s_debounceCnt[22]~25_combout\ & \debounceAumentar_fsm|Add0~44_combout\)))) # (!\debounceAumentar_fsm|s_previousIn~q\ & 
-- (\debounceAumentar_fsm|s_debounceCnt[5]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|s_previousIn~q\,
	datab => \debounceAumentar_fsm|s_debounceCnt[5]~0_combout\,
	datac => \debounceAumentar_fsm|s_debounceCnt[22]~25_combout\,
	datad => \debounceAumentar_fsm|Add0~44_combout\,
	combout => \debounceAumentar_fsm|s_debounceCnt[22]~26_combout\);

-- Location: FF_X102_Y30_N27
\debounceAumentar_fsm|s_debounceCnt[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceAumentar_fsm|s_debounceCnt[22]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceAumentar_fsm|s_debounceCnt\(22));

-- Location: LCCOMB_X102_Y30_N14
\debounceAumentar_fsm|s_debounceCnt[5]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|s_debounceCnt[5]~3_combout\ = (((\debounceAumentar_fsm|s_debounceCnt\(22)) # (\debounceAumentar_fsm|s_debounceCnt[5]~2_combout\)) # (!\debounceAumentar_fsm|s_dirtyIn~q\)) # (!\debounceAumentar_fsm|s_previousIn~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|s_previousIn~q\,
	datab => \debounceAumentar_fsm|s_dirtyIn~q\,
	datac => \debounceAumentar_fsm|s_debounceCnt\(22),
	datad => \debounceAumentar_fsm|s_debounceCnt[5]~2_combout\,
	combout => \debounceAumentar_fsm|s_debounceCnt[5]~3_combout\);

-- Location: LCCOMB_X101_Y29_N28
\debounceAumentar_fsm|s_debounceCnt[20]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|s_debounceCnt[20]~9_combout\ = (\debounceAumentar_fsm|s_debounceCnt[5]~0_combout\ & (\debounceAumentar_fsm|s_previousIn~q\ & (\debounceAumentar_fsm|s_debounceCnt[5]~3_combout\ & \debounceAumentar_fsm|Add0~40_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|s_debounceCnt[5]~0_combout\,
	datab => \debounceAumentar_fsm|s_previousIn~q\,
	datac => \debounceAumentar_fsm|s_debounceCnt[5]~3_combout\,
	datad => \debounceAumentar_fsm|Add0~40_combout\,
	combout => \debounceAumentar_fsm|s_debounceCnt[20]~9_combout\);

-- Location: FF_X101_Y29_N29
\debounceAumentar_fsm|s_debounceCnt[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceAumentar_fsm|s_debounceCnt[20]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceAumentar_fsm|s_debounceCnt\(20));

-- Location: LCCOMB_X103_Y29_N24
\debounceAumentar_fsm|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|LessThan0~0_combout\ = (!\debounceAumentar_fsm|s_debounceCnt\(20) & !\debounceAumentar_fsm|s_debounceCnt\(21))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|s_debounceCnt\(20),
	datac => \debounceAumentar_fsm|s_debounceCnt\(21),
	combout => \debounceAumentar_fsm|LessThan0~0_combout\);

-- Location: LCCOMB_X102_Y30_N18
\debounceAumentar_fsm|s_debounceCnt[5]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|s_debounceCnt[5]~0_combout\ = (\debounceAumentar_fsm|s_dirtyIn~q\ & (((\debounceAumentar_fsm|LessThan0~0_combout\ & !\debounceAumentar_fsm|LessThan0~7_combout\)) # (!\debounceAumentar_fsm|s_debounceCnt\(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|LessThan0~0_combout\,
	datab => \debounceAumentar_fsm|s_dirtyIn~q\,
	datac => \debounceAumentar_fsm|s_debounceCnt\(22),
	datad => \debounceAumentar_fsm|LessThan0~7_combout\,
	combout => \debounceAumentar_fsm|s_debounceCnt[5]~0_combout\);

-- Location: LCCOMB_X101_Y30_N2
\debounceAumentar_fsm|s_debounceCnt~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|s_debounceCnt~23_combout\ = (\debounceAumentar_fsm|Add0~0_combout\ & (\debounceAumentar_fsm|s_previousIn~q\ & \debounceAumentar_fsm|s_debounceCnt[5]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|Add0~0_combout\,
	datac => \debounceAumentar_fsm|s_previousIn~q\,
	datad => \debounceAumentar_fsm|s_debounceCnt[5]~0_combout\,
	combout => \debounceAumentar_fsm|s_debounceCnt~23_combout\);

-- Location: FF_X101_Y30_N3
\debounceAumentar_fsm|s_debounceCnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceAumentar_fsm|s_debounceCnt~23_combout\,
	ena => \debounceAumentar_fsm|s_debounceCnt[5]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceAumentar_fsm|s_debounceCnt\(0));

-- Location: LCCOMB_X102_Y30_N6
\debounceAumentar_fsm|s_debounceCnt~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|s_debounceCnt~19_combout\ = (\debounceAumentar_fsm|Add0~2_combout\ & (\debounceAumentar_fsm|s_previousIn~q\ & \debounceAumentar_fsm|s_debounceCnt[5]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|Add0~2_combout\,
	datac => \debounceAumentar_fsm|s_previousIn~q\,
	datad => \debounceAumentar_fsm|s_debounceCnt[5]~0_combout\,
	combout => \debounceAumentar_fsm|s_debounceCnt~19_combout\);

-- Location: FF_X102_Y30_N7
\debounceAumentar_fsm|s_debounceCnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceAumentar_fsm|s_debounceCnt~19_combout\,
	ena => \debounceAumentar_fsm|s_debounceCnt[5]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceAumentar_fsm|s_debounceCnt\(1));

-- Location: LCCOMB_X102_Y30_N28
\debounceAumentar_fsm|s_pulsedOut~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|s_pulsedOut~5_combout\ = (!\debounceAumentar_fsm|s_debounceCnt\(1) & (!\debounceAumentar_fsm|s_debounceCnt\(3) & (!\debounceAumentar_fsm|s_debounceCnt\(2) & !\debounceAumentar_fsm|s_debounceCnt\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|s_debounceCnt\(1),
	datab => \debounceAumentar_fsm|s_debounceCnt\(3),
	datac => \debounceAumentar_fsm|s_debounceCnt\(2),
	datad => \debounceAumentar_fsm|s_debounceCnt\(4),
	combout => \debounceAumentar_fsm|s_pulsedOut~5_combout\);

-- Location: LCCOMB_X103_Y30_N18
\debounceAumentar_fsm|s_pulsedOut~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|s_pulsedOut~6_combout\ = (!\debounceAumentar_fsm|s_debounceCnt\(22) & (\debounceAumentar_fsm|s_previousIn~q\ & (\debounceAumentar_fsm|s_debounceCnt\(0) & \debounceAumentar_fsm|s_dirtyIn~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|s_debounceCnt\(22),
	datab => \debounceAumentar_fsm|s_previousIn~q\,
	datac => \debounceAumentar_fsm|s_debounceCnt\(0),
	datad => \debounceAumentar_fsm|s_dirtyIn~q\,
	combout => \debounceAumentar_fsm|s_pulsedOut~6_combout\);

-- Location: LCCOMB_X103_Y30_N20
\debounceAumentar_fsm|s_pulsedOut~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounceAumentar_fsm|s_pulsedOut~7_combout\ = (\debounceAumentar_fsm|s_pulsedOut~5_combout\ & (\debounceAumentar_fsm|s_pulsedOut~6_combout\ & (!\debounceAumentar_fsm|s_debounceCnt\(5) & \debounceAumentar_fsm|s_pulsedOut~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounceAumentar_fsm|s_pulsedOut~5_combout\,
	datab => \debounceAumentar_fsm|s_pulsedOut~6_combout\,
	datac => \debounceAumentar_fsm|s_debounceCnt\(5),
	datad => \debounceAumentar_fsm|s_pulsedOut~4_combout\,
	combout => \debounceAumentar_fsm|s_pulsedOut~7_combout\);

-- Location: FF_X103_Y30_N21
\debounceAumentar_fsm|s_pulsedOut\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounceAumentar_fsm|s_pulsedOut~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounceAumentar_fsm|s_pulsedOut~q\);

-- Location: LCCOMB_X103_Y18_N16
\modoGelo_fsm|comb_proc~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \modoGelo_fsm|comb_proc~0_combout\ = (\register_fsm|dataOut\(4) & (\main_fsm|WideOr18~0_combout\ & \debounceAumentar_fsm|s_pulsedOut~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \register_fsm|dataOut\(4),
	datac => \main_fsm|WideOr18~0_combout\,
	datad => \debounceAumentar_fsm|s_pulsedOut~q\,
	combout => \modoGelo_fsm|comb_proc~0_combout\);

-- Location: LCCOMB_X103_Y18_N14
\modoGelo_fsm|Selector4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \modoGelo_fsm|Selector4~0_combout\ = (\modoGelo_fsm|s_currentState.QUATROCUBOS~q\ & (!\debounceDiminuir_fsm|s_pulsedOut~q\ & (\main_fsm|WideOr18~0_combout\ & \register_fsm|dataOut\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \modoGelo_fsm|s_currentState.QUATROCUBOS~q\,
	datab => \debounceDiminuir_fsm|s_pulsedOut~q\,
	datac => \main_fsm|WideOr18~0_combout\,
	datad => \register_fsm|dataOut\(4),
	combout => \modoGelo_fsm|Selector4~0_combout\);

-- Location: LCCOMB_X103_Y18_N12
\modoGelo_fsm|Selector4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \modoGelo_fsm|Selector4~1_combout\ = (\modoGelo_fsm|Selector4~0_combout\) # ((\modoGelo_fsm|s_currentState.TRESCUBOS~q\ & \modoGelo_fsm|comb_proc~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \modoGelo_fsm|s_currentState.TRESCUBOS~q\,
	datab => \modoGelo_fsm|Selector4~0_combout\,
	datad => \modoGelo_fsm|comb_proc~0_combout\,
	combout => \modoGelo_fsm|Selector4~1_combout\);

-- Location: FF_X103_Y18_N13
\modoGelo_fsm|s_currentState.QUATROCUBOS\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \modoGelo_fsm|Selector4~1_combout\,
	sclr => \SW[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \modoGelo_fsm|s_currentState.QUATROCUBOS~q\);

-- Location: LCCOMB_X103_Y18_N22
\modoGelo_fsm|Selector3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \modoGelo_fsm|Selector3~0_combout\ = (\modoGelo_fsm|s_currentState.QUATROCUBOS~q\ & (\debounceDiminuir_fsm|s_pulsedOut~q\ & (\main_fsm|WideOr18~0_combout\ & \register_fsm|dataOut\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \modoGelo_fsm|s_currentState.QUATROCUBOS~q\,
	datab => \debounceDiminuir_fsm|s_pulsedOut~q\,
	datac => \main_fsm|WideOr18~0_combout\,
	datad => \register_fsm|dataOut\(4),
	combout => \modoGelo_fsm|Selector3~0_combout\);

-- Location: LCCOMB_X103_Y18_N24
\modoGelo_fsm|Selector3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \modoGelo_fsm|Selector3~1_combout\ = (\modoGelo_fsm|s_currentState.TRESCUBOS~q\ & (!\debounceDiminuir_fsm|s_pulsedOut~q\ & (\main_fsm|WideOr18~0_combout\ & \register_fsm|dataOut\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \modoGelo_fsm|s_currentState.TRESCUBOS~q\,
	datab => \debounceDiminuir_fsm|s_pulsedOut~q\,
	datac => \main_fsm|WideOr18~0_combout\,
	datad => \register_fsm|dataOut\(4),
	combout => \modoGelo_fsm|Selector3~1_combout\);

-- Location: LCCOMB_X103_Y18_N6
\modoGelo_fsm|Selector3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \modoGelo_fsm|Selector3~2_combout\ = (\modoGelo_fsm|Selector3~0_combout\) # ((\modoGelo_fsm|comb_proc~0_combout\ & (\modoGelo_fsm|s_currentState.DOISCUBOS~q\)) # (!\modoGelo_fsm|comb_proc~0_combout\ & ((\modoGelo_fsm|Selector3~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \modoGelo_fsm|s_currentState.DOISCUBOS~q\,
	datab => \modoGelo_fsm|comb_proc~0_combout\,
	datac => \modoGelo_fsm|Selector3~0_combout\,
	datad => \modoGelo_fsm|Selector3~1_combout\,
	combout => \modoGelo_fsm|Selector3~2_combout\);

-- Location: FF_X103_Y18_N7
\modoGelo_fsm|s_currentState.TRESCUBOS\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \modoGelo_fsm|Selector3~2_combout\,
	sclr => \SW[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \modoGelo_fsm|s_currentState.TRESCUBOS~q\);

-- Location: LCCOMB_X103_Y18_N20
\modoGelo_fsm|Selector0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \modoGelo_fsm|Selector0~0_combout\ = (\debounceDiminuir_fsm|s_pulsedOut~q\ & ((\modoGelo_fsm|s_currentState.TRESCUBOS~q\) # ((\modoGelo_fsm|s_currentState.DOISCUBOS~q\ & !\main_fsm|selModoGelo~0_combout\)))) # (!\debounceDiminuir_fsm|s_pulsedOut~q\ & 
-- (\modoGelo_fsm|s_currentState.DOISCUBOS~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \modoGelo_fsm|s_currentState.DOISCUBOS~q\,
	datab => \debounceDiminuir_fsm|s_pulsedOut~q\,
	datac => \main_fsm|selModoGelo~0_combout\,
	datad => \modoGelo_fsm|s_currentState.TRESCUBOS~q\,
	combout => \modoGelo_fsm|Selector0~0_combout\);

-- Location: LCCOMB_X103_Y18_N30
\modoGelo_fsm|Selector0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \modoGelo_fsm|Selector0~1_combout\ = (\main_fsm|selModoGelo~0_combout\ & (((\modoGelo_fsm|Selector0~0_combout\ & !\debounceAumentar_fsm|s_pulsedOut~q\)) # (!\modoGelo_fsm|s_currentState.INICIO~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|selModoGelo~0_combout\,
	datab => \modoGelo_fsm|Selector0~0_combout\,
	datac => \modoGelo_fsm|s_currentState.INICIO~q\,
	datad => \debounceAumentar_fsm|s_pulsedOut~q\,
	combout => \modoGelo_fsm|Selector0~1_combout\);

-- Location: LCCOMB_X103_Y18_N10
\modoGelo_fsm|Selector0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \modoGelo_fsm|Selector0~2_combout\ = (\modoGelo_fsm|Selector0~1_combout\) # ((\modoGelo_fsm|s_currentState.UMCUBO~q\ & \modoGelo_fsm|comb_proc~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \modoGelo_fsm|Selector0~1_combout\,
	datab => \modoGelo_fsm|s_currentState.UMCUBO~q\,
	datad => \modoGelo_fsm|comb_proc~0_combout\,
	combout => \modoGelo_fsm|Selector0~2_combout\);

-- Location: FF_X103_Y18_N11
\modoGelo_fsm|s_currentState.DOISCUBOS\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \modoGelo_fsm|Selector0~2_combout\,
	sclr => \SW[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \modoGelo_fsm|s_currentState.DOISCUBOS~q\);

-- Location: LCCOMB_X103_Y18_N26
\modoGelo_fsm|Selector1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \modoGelo_fsm|Selector1~0_combout\ = (\main_fsm|selModoGelo~0_combout\ & ((\debounceDiminuir_fsm|s_pulsedOut~q\ & (\modoGelo_fsm|s_currentState.DOISCUBOS~q\)) # (!\debounceDiminuir_fsm|s_pulsedOut~q\ & ((\modoGelo_fsm|s_currentState.UMCUBO~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \modoGelo_fsm|s_currentState.DOISCUBOS~q\,
	datab => \debounceDiminuir_fsm|s_pulsedOut~q\,
	datac => \main_fsm|selModoGelo~0_combout\,
	datad => \modoGelo_fsm|s_currentState.UMCUBO~q\,
	combout => \modoGelo_fsm|Selector1~0_combout\);

-- Location: LCCOMB_X103_Y18_N0
\modoGelo_fsm|Selector1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \modoGelo_fsm|Selector1~1_combout\ = (\modoGelo_fsm|comb_proc~0_combout\ & ((\modoGelo_fsm|s_currentState.ZEROCUBOS~q\))) # (!\modoGelo_fsm|comb_proc~0_combout\ & (\modoGelo_fsm|Selector1~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \modoGelo_fsm|Selector1~0_combout\,
	datab => \modoGelo_fsm|s_currentState.ZEROCUBOS~q\,
	datad => \modoGelo_fsm|comb_proc~0_combout\,
	combout => \modoGelo_fsm|Selector1~1_combout\);

-- Location: FF_X103_Y18_N1
\modoGelo_fsm|s_currentState.UMCUBO\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \modoGelo_fsm|Selector1~1_combout\,
	sclr => \SW[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \modoGelo_fsm|s_currentState.UMCUBO~q\);

-- Location: LCCOMB_X103_Y18_N28
\modoGelo_fsm|s_currentState~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \modoGelo_fsm|s_currentState~9_combout\ = (!\debounceAumentar_fsm|s_pulsedOut~q\ & ((\modoGelo_fsm|s_currentState.ZEROCUBOS~q\) # ((\modoGelo_fsm|s_currentState.UMCUBO~q\ & \debounceDiminuir_fsm|s_pulsedOut~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \modoGelo_fsm|s_currentState.UMCUBO~q\,
	datab => \modoGelo_fsm|s_currentState.ZEROCUBOS~q\,
	datac => \debounceDiminuir_fsm|s_pulsedOut~q\,
	datad => \debounceAumentar_fsm|s_pulsedOut~q\,
	combout => \modoGelo_fsm|s_currentState~9_combout\);

-- Location: LCCOMB_X103_Y18_N18
\modoGelo_fsm|s_currentState~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \modoGelo_fsm|s_currentState~10_combout\ = (!\SW[0]~input_o\ & (\modoGelo_fsm|s_currentState~9_combout\ & \main_fsm|selModoGelo~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \modoGelo_fsm|s_currentState~9_combout\,
	datac => \main_fsm|selModoGelo~0_combout\,
	combout => \modoGelo_fsm|s_currentState~10_combout\);

-- Location: FF_X103_Y18_N19
\modoGelo_fsm|s_currentState.ZEROCUBOS\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \modoGelo_fsm|s_currentState~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \modoGelo_fsm|s_currentState.ZEROCUBOS~q\);

-- Location: LCCOMB_X103_Y18_N8
\modoGelo_fsm|WideOr4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \modoGelo_fsm|WideOr4~0_combout\ = (\modoGelo_fsm|s_currentState.INICIO~q\ & !\modoGelo_fsm|s_currentState.ZEROCUBOS~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \modoGelo_fsm|s_currentState.INICIO~q\,
	datad => \modoGelo_fsm|s_currentState.ZEROCUBOS~q\,
	combout => \modoGelo_fsm|WideOr4~0_combout\);

-- Location: LCCOMB_X103_Y18_N2
\modoGelo_fsm|WideOr4\ : cycloneive_lcell_comb
-- Equation(s):
-- \modoGelo_fsm|WideOr4~combout\ = (\modoGelo_fsm|s_currentState.UMCUBO~q\) # ((\modoGelo_fsm|s_currentState.ZEROCUBOS~q\) # (!\modoGelo_fsm|s_currentState.INICIO~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \modoGelo_fsm|s_currentState.UMCUBO~q\,
	datac => \modoGelo_fsm|s_currentState.INICIO~q\,
	datad => \modoGelo_fsm|s_currentState.ZEROCUBOS~q\,
	combout => \modoGelo_fsm|WideOr4~combout\);

-- Location: LCCOMB_X91_Y4_N28
\modoGelo_fsm|enable[2]\ : cycloneive_lcell_comb
-- Equation(s):
-- \modoGelo_fsm|enable\(2) = (\modoGelo_fsm|s_currentState.QUATROCUBOS~q\) # (\modoGelo_fsm|s_currentState.TRESCUBOS~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \modoGelo_fsm|s_currentState.QUATROCUBOS~q\,
	datac => \modoGelo_fsm|s_currentState.TRESCUBOS~q\,
	combout => \modoGelo_fsm|enable\(2));

ww_LEDR(0) <= \LEDR[0]~output_o\;

ww_LEDG(0) <= \LEDG[0]~output_o\;

ww_HEX0(0) <= \HEX0[0]~output_o\;

ww_HEX0(1) <= \HEX0[1]~output_o\;

ww_HEX0(2) <= \HEX0[2]~output_o\;

ww_HEX0(3) <= \HEX0[3]~output_o\;

ww_HEX0(4) <= \HEX0[4]~output_o\;

ww_HEX0(5) <= \HEX0[5]~output_o\;

ww_HEX0(6) <= \HEX0[6]~output_o\;

ww_HEX1(0) <= \HEX1[0]~output_o\;

ww_HEX1(1) <= \HEX1[1]~output_o\;

ww_HEX1(2) <= \HEX1[2]~output_o\;

ww_HEX1(3) <= \HEX1[3]~output_o\;

ww_HEX1(4) <= \HEX1[4]~output_o\;

ww_HEX1(5) <= \HEX1[5]~output_o\;

ww_HEX1(6) <= \HEX1[6]~output_o\;

ww_HEX2(0) <= \HEX2[0]~output_o\;

ww_HEX2(1) <= \HEX2[1]~output_o\;

ww_HEX2(2) <= \HEX2[2]~output_o\;

ww_HEX2(3) <= \HEX2[3]~output_o\;

ww_HEX2(4) <= \HEX2[4]~output_o\;

ww_HEX2(5) <= \HEX2[5]~output_o\;

ww_HEX2(6) <= \HEX2[6]~output_o\;

ww_HEX3(0) <= \HEX3[0]~output_o\;

ww_HEX3(1) <= \HEX3[1]~output_o\;

ww_HEX3(2) <= \HEX3[2]~output_o\;

ww_HEX3(3) <= \HEX3[3]~output_o\;

ww_HEX3(4) <= \HEX3[4]~output_o\;

ww_HEX3(5) <= \HEX3[5]~output_o\;

ww_HEX3(6) <= \HEX3[6]~output_o\;

ww_HEX4(0) <= \HEX4[0]~output_o\;

ww_HEX4(1) <= \HEX4[1]~output_o\;

ww_HEX4(2) <= \HEX4[2]~output_o\;

ww_HEX4(3) <= \HEX4[3]~output_o\;

ww_HEX4(4) <= \HEX4[4]~output_o\;

ww_HEX4(5) <= \HEX4[5]~output_o\;

ww_HEX4(6) <= \HEX4[6]~output_o\;

ww_HEX5(0) <= \HEX5[0]~output_o\;

ww_HEX5(1) <= \HEX5[1]~output_o\;

ww_HEX5(2) <= \HEX5[2]~output_o\;

ww_HEX5(3) <= \HEX5[3]~output_o\;

ww_HEX5(4) <= \HEX5[4]~output_o\;

ww_HEX5(5) <= \HEX5[5]~output_o\;

ww_HEX5(6) <= \HEX5[6]~output_o\;

ww_HEX6(0) <= \HEX6[0]~output_o\;

ww_HEX6(1) <= \HEX6[1]~output_o\;

ww_HEX6(2) <= \HEX6[2]~output_o\;

ww_HEX6(3) <= \HEX6[3]~output_o\;

ww_HEX6(4) <= \HEX6[4]~output_o\;

ww_HEX6(5) <= \HEX6[5]~output_o\;

ww_HEX6(6) <= \HEX6[6]~output_o\;

ww_HEX7(0) <= \HEX7[0]~output_o\;

ww_HEX7(1) <= \HEX7[1]~output_o\;

ww_HEX7(2) <= \HEX7[2]~output_o\;

ww_HEX7(3) <= \HEX7[3]~output_o\;

ww_HEX7(4) <= \HEX7[4]~output_o\;

ww_HEX7(5) <= \HEX7[5]~output_o\;

ww_HEX7(6) <= \HEX7[6]~output_o\;
END structure;


