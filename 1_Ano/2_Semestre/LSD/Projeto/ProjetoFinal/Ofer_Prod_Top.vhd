library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Ofer_Prod_Top is
	port(CLOCK_50	: in  std_logic;
		  KEY			: in  std_logic_vector(1 downto 0);
		  SW			: in  std_logic_vector(4 downto 0);
		  LEDR		: out std_logic_vector(0 downto 0);
		  LEDG      : out std_logic_vector(0 downto 0);
		  HEX0		: out std_logic_vector(6 downto 0);
		  HEX1		: out std_logic_vector(6 downto 0);
		  HEX2		: out std_logic_vector(6 downto 0);
		  HEX3		: out std_logic_vector(6 downto 0);
		  HEX4		: out std_logic_vector(6 downto 0);
		  HEX5		: out std_logic_vector(6 downto 0);
		  HEX6		: out std_logic_vector(6 downto 0);
		  HEX7		: out std_logic_vector(6 downto 0));
end Ofer_Prod_Top;

architecture Shell of Ofer_Prod_Top is

	signal s_selModoGelo, s_timerEnable			: std_logic;
	signal s_aumentarGelo, s_diminuirGelo		: std_logic;
	signal s_newTime, s_timeExp					: std_logic;
	signal s_timeVal									: std_logic_vector(7 downto 0);
	signal s_selWord									: std_logic_vector(15 downto 0);
	signal s_selcubo 									: std_logic_vector(15 downto 0);
	signal s_fanta										: std_logic;
	signal s_sumo_lim									: std_logic;
	signal s_sumo_pes   								: std_logic;
	signal s_selGelo   								: std_logic;
	signal s_reset										: std_logic;
	signal s_clk6Hz									: std_logic;
	signal s_enable                           : std_logic;
	signal s_enable4bits                      : std_logic_vector(3 downto 0);
	

begin

					
	clk_div_1hz : entity work.ClkDividerN(RTL)
		generic map(divFactor => 50000000/6)
		port map(clkIn			 => CLOCK_50,
					clkOut		 => s_clk6Hz);
	
	debounceDiminuir_fsm : entity work.DebounceUnit(Behavioral)
		port map(refclk		=> CLOCK_50,
					dirtyIn => Key(0),
					pulsedOut => s_diminuirGelo);
					
	debounceAumentar_fsm : entity work.DebounceUnit(Behavioral)
		port map(refclk		=> CLOCK_50,
					dirtyIn => Key(1),
					pulsedOut => s_aumentarGelo);			
					
	register_fsm : entity work.RegisterRef(Shell)
		port map(clk => CLOCK_50,
					reset  => SW(0),
					fanta  => SW(1),
					sumo_lim  => SW(2),
					sumo_pes  => SW(3),
					selGelo   => SW(4),
					dataout(0) => s_reset,
					dataout(1) => s_fanta,
					dataout(2) => s_sumo_lim,
					dataout(3) => s_sumo_pes,
					dataout(4) => s_selGelo);
					
	
	main_fsm : entity work.Ofer_Prod(Behavioral)
		port map(reset		=> s_reset,
					clk		=> CLOCK_50,
					enable   => s_enable,
					clk6Hz   => s_clk6Hz,
					timerEnable => s_timerEnable,
					newTime	=> s_newTime,
					timeVal	=> s_timeVal,
					timeExp	=> s_timeExp,
					selWord  => s_selWord,
					fanta		=> s_fanta,
					sumo_lim	=> s_sumo_lim,
					sumo_pes	=> s_sumo_pes,
					selGelo  => s_selGelo,
					selModoGelo => s_selModoGelo,
					LEDR		=> LEDR(0),
					LEDG 		=> LEDG(0));
					
	modoGelo_fsm : entity work.CubosGelo(Behavioral)
		port map(reset		=> SW(0),
					clk		=> CLOCK_50,
					enable   => s_enable4bits,
					selModoGelo => s_selModoGelo,
					selcubo => s_selcubo,
					aumentarGelo => s_aumentarGelo,
					diminuirGelo => s_diminuirGelo);

	timer_fsm : entity work.Timer_FSM(Behavioral)
		port map(reset		=> SW(0),
					clk		=> CLOCK_50,
					timerEnable => s_timerEnable,
					newTime	=> s_newTime,
					timeVal	=> s_timeVal,
					timeExp	=> s_timeExp);
					
	dec_word0 : entity work.Bin7SegDecoder(Behavioral)
		port map(enable   => s_enable,
					binInput => s_selWord(3 downto 0),
					decOut_n	=> HEX0);
	
	dec_word1 : entity work.Bin7SegDecoder(Behavioral)
		port map(enable   => s_enable,
					binInput => s_selWord(7 downto 4),
					decOut_n	=> HEX1);
	
	dec_word2 : entity work.Bin7SegDecoder(Behavioral)
		port map(enable   => s_enable,
					binInput => s_selWord(11 downto 8),
					decOut_n	=> HEX2);
	
	dec_word3 : entity work.Bin7SegDecoder(Behavioral)
		port map(enable => s_enable,
					binInput => s_selWord(15 downto 12),
					decOut_n	=> HEX3);
					
	dec_cubo0 : entity work.Bin7SegDecoder(Behavioral)
		port map(enable   => s_enable4bits(3),
					binInput => s_selcubo(15 downto 12),
					decOut_n	=> HEX7);
					
	dec_cubo1 : entity work.Bin7SegDecoder(Behavioral)
		port map(enable   => s_enable4bits(2),
					binInput => s_selcubo(11 downto 8),
					decOut_n	=> HEX6);
	
	dec_cubo2 : entity work.Bin7SegDecoder(Behavioral)
		port map(enable   => s_enable4bits(1),
					binInput => s_selcubo(7 downto 4),
					decOut_n	=> HEX5);
					
	dec_cubo3 : entity work.Bin7SegDecoder(Behavioral)
		port map(enable   => s_enable4bits(0),
					binInput => s_selcubo(3 downto 0),
					decOut_n	=> HEX4);

end Shell;