library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Ofer_Prod is
	port(reset			: in  std_logic;
		  clk				: in  std_logic;
		  clk6Hz       : in  std_logic;
		  enable       : out std_logic;
		  fanta			: in  std_logic;
		  sumo_lim		: in  std_logic;
		  sumo_pes		: in  std_logic;
		  newTime		: out std_logic;
		  timeVal		: out std_logic_vector(7 downto 0);
		  timeExp		: in  std_logic;
		  timerEnable 	: out std_logic;
		  selGelo  		: in  std_logic;
		  selModoGelo  : out std_logic;
		  selWord  		: out std_logic_vector(15 downto 0);
		  LEDR			: out std_logic;
		  LEDG			: out std_logic);
end Ofer_Prod;

architecture Behavioral of Ofer_Prod is

	constant ONE_TIME	   : std_logic_vector(7 downto 0) := "00000001"; -- 1 s
	constant START_TIME	: std_logic_vector(7 downto 0) := "00000110"; -- 6 s
	constant PREP_TIME	: std_logic_vector(7 downto 0) := "00001000"; -- 8 s
	constant Dec_HIHI		: std_logic_vector(15 downto 0) := "0010000100100001"; -- HIHI
	constant Dec_EREF		: std_logic_vector(15 downto 0) := "0011010000110101"; -- EREF
	constant Dec_FAN		: std_logic_vector(15 downto 0) := "0101011001111111"; -- FAN
	constant Dec_SOLI 	: std_logic_vector(15 downto 0) := "1000100110100001"; -- SOLI
	constant Dec_SPES		: std_logic_vector(15 downto 0) := "1000101100111000"; -- SPES
	constant Dec_III		: std_logic_vector(15 downto 0) := "0001000100011111"; -- III
	constant Dec_NADA    : std_logic_vector(15 downto 0) := "1111111111111111"; -- NADA
	
	
	type TState is (START, EREF, PREP_FAN, PREP_SOLI, PREP_SPES, DIS_FAN, DIS_SOLI, DIS_SPES, START_DONE);
	signal s_currentState, s_nextState : TState;
	signal s_stateChanged : std_logic := '1';

begin
	sync_proc : process(clk)
	begin
		if (rising_edge(clk)) then
			if (reset = '1') then
				s_currentState <= Start;
			else
				s_currentState	<= s_nextState;
			end if;
		end if;
	end process;	
	comb_proc : process(s_currentState, timeExp, fanta, sumo_lim, sumo_pes, selGelo)
	begin
		
		LEDR <= '0';
		LEDG <= '0';
		timeVal <= (others => '0');
		enable <= '1';
		selModoGelo <= '0';

		case (s_currentState) is
		
		when START =>
			timerEnable <= '1';
			newTime <= '1';
			timeVal <= START_TIME;
			s_nextState <= START_DONE;
			selWord <= Dec_HIHI;
			
		when START_DONE =>
			timerEnable <= '1';
			newTime <= '0';
			enable <= clk6Hz;
			selWord <= Dec_HIHI;
			
			if (timeExp = '1') then
				s_nextState <= EREF;
			else
				s_nextState <= START_DONE;
			end if;
		
		when EREF =>
			selWord <= Dec_EREF;
			timerEnable <= '1';
			newtime <= '0';
			timeval <= PREP_TIME;
			
			if (fanta = '1') then
				newtime <= '1';
				s_nextState <= PREP_FAN;
			elsif (sumo_lim = '1') then
				newtime <= '1';
				s_nextState <= PREP_SOLI;
			elsif (sumo_pes = '1') then
				newtime <= '1';
				s_nextState <= PREP_SPES;
			else
				s_nextState <= EREF;
			end if;
			
		when PREP_FAN =>
			newTime <= '0';
			LEDR <= '1';
			selWord <= Dec_FAN;
			timerEnable <= '1';
			
			if (selGelo = '1') then
				timerEnable <= '0';
				selModoGelo <= '1';
				s_nextState <= PREP_FAN;	
			elsif (timeExp = '1') then
				s_nextState <= DIS_FAN;
			elsif ( fanta = '0') then
				s_nextState <= EREF;
			else	
				s_nextState <= PREP_FAN;
			end if;
			
		when DIS_FAN =>
			selWord <= Dec_FAN;
			timerEnable <= '1';
			newTime <= '0';
			LEDG <= '1';
			
			if (fanta = '0' and sumo_lim = '0' and sumo_pes = '0') then
				s_nextState <= EREF;
			else
				s_nextState <= DIS_FAN;
			end if;
			
		when PREP_SOLI =>
			newTime <= '0';
			LEDR <= '1';
			selWord <= Dec_SOLI;
			timerEnable <= '1';
			
			if (selGelo = '1') then
				timerEnable <= '0';
				selModoGelo <= '1';
				s_nextState <= PREP_SOLI;
			elsif (timeExp = '1') then
				s_nextState <= DIS_SOLI;
			elsif (sumo_lim = '0') then
				s_nextState <= EREF;
			else	
				s_nextState <= PREP_SOLI;
			end if;
			
		when DIS_SOLI =>
			selWord <= Dec_SOLI;
			timerEnable <= '1';
			newTime <= '0';
			LEDG <= '1';
			
			if (fanta = '0' and sumo_lim = '0' and sumo_pes = '0') then
				s_nextState <= EREF;
			else
				s_nextState <= DIS_SOLI;
			end if;
		
		when PREP_SPES =>
			newTime <= '0';
			LEDR <= '1';
			selWord <= Dec_SPES;
			timerEnable <= '1';
			
			if (selGelo = '1') then
				timerEnable <= '0';
				selModoGelo <= '1';
				s_nextState <= PREP_SPES;
			elsif (timeExp = '1') then
				s_nextState <= DIS_SPES;
			elsif (sumo_pes = '0') then
				s_nextState <= EREF;
			else	
				s_nextState <= PREP_SPES;
			end if;
			
		when DIS_SPES =>
			selWord <= Dec_SPES;
			timerEnable <= '1';
			newTime <= '0';
			LEDG <= '1';
			
			if (fanta = '0' and sumo_lim = '0' and sumo_pes = '0') then
				s_nextState <= EREF;
			else
				s_nextState <= DIS_SPES;
			end if;
		
		end case;

	end process;

end Behavioral;

		