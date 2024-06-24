library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity CubosGelo is
	port(reset 			: in std_logic;
		  clk				: in std_logic;
		  aumentarGelo	: in std_logic;
		  diminuirGelo	: in std_logic;
		  selModoGelo  : in std_logic;
		  enable       : out std_logic_vector(3 downto 0);
		  selcubo 		: out std_logic_vector(15 downto 0));
end CubosGelo;

architecture Behavioral of CubosGelo is

	constant Dec_0CUBO	: std_logic_vector(15 downto 0) := "1111111111111111"; -- 
	constant Dec_1CUBO	: std_logic_vector(15 downto 0) := "1111111111111001"; -- 0
	constant Dec_2CUBO	: std_logic_vector(15 downto 0) := "1111111110011001"; -- 00
	constant Dec_3CUBO	: std_logic_vector(15 downto 0) := "1111100110011001"; -- 000
	constant Dec_4CUBO	: std_logic_vector(15 downto 0) := "1001100110011001"; -- 0000
	
	type TState is (DOISCUBOS, UMCUBO, ZEROCUBOS , TRESCUBOS, QUATROCUBOS, INICIO);
	signal s_currentState, s_nextState : TState := INICIO;

begin
		
	sync_proc : process(clk)
	begin	
		if (rising_edge(clk)) then
			if (reset = '1') then
				s_currentState <= INICIO;
			else
				s_currentState <= s_nextState;
			end if;
		end if;
	end process;
	comb_proc : process(s_currentState, aumentarGelo, diminuirGelo)
	begin
		
		enable <= "0000";
		
		case (s_currentState) is
		
		when INICIO =>
			selcubo <= DEC_0CUBO;
				
				if (selModoGelo = '1') then
					s_nextState <= DOISCUBOS;
				else
					s_nextState <= INICIO;
				end if;
		
		when DOISCUBOS =>
				enable <= "0011";
				selcubo <= Dec_2CUBO;
				
				if (aumentarGelo = '1' and selModoGelo = '1') then
					s_nextState <= TRESCUBOS;
				elsif (diminuirGelo = '1' and selModoGelo = '1') then
					s_nextState <= UMCUBO;
				elsif (selModoGelo = '0') then
					s_nextState <= INICIO;
				else
					s_nextState <= DOISCUBOS;
				end if;
				
		when UMCUBO =>
				enable <= "0001";
				selcubo <= Dec_1CUBO; 
					
				if (aumentarGelo = '1' and selModoGelo = '1') then
					s_nextState <= DOISCUBOS;
				elsif (diminuirGelo = '1' and selModoGelo = '1') then
					s_nextState <= ZEROCUBOS;
				elsif (selModoGelo = '0') then
					s_nextState <= INICIO;
				else
					s_nextState <= UMCUBO;
				end if;
				
		when ZEROCUBOS =>
				enable <= "0000";
				selcubo <= Dec_0CUBO;
				
				if (aumentarGelo = '1'and selModoGelo = '1') then
					s_nextState <= UMCUBO;
				elsif (selModoGelo = '0') then
					s_nextState <= INICIO;
				else
					s_nextState <= ZEROCUBOS;
				end if;
				
		when TRESCUBOS =>
				enable <= "0111";
				selcubo <= Dec_3CUBO;
					
				if (aumentarGelo = '1' and selModoGelo = '1') then
					s_nextState <= QUATROCUBOS;
				elsif (diminuirGelo = '1' and selModoGelo = '1') then
					s_nextState <= DOISCUBOS;
				elsif (selModoGelo = '0') then
					s_nextState <= INICIO;
				else
					s_nextState <= TRESCUBOS;
				end if;
				
		when QUATROCUBOS =>
				enable <= "1111";
				selcubo <= Dec_4CUBO;
					
				if (diminuirGelo = '1' and selModoGelo = '1') then
					s_nextState <= TRESCUBOS;
				elsif (selModoGelo = '0') then
					s_nextState <= INICIO;
				else
					s_nextState <= QUATROCUBOS;
				end if;
				
		end case;

	end process;

end Behavioral;

		