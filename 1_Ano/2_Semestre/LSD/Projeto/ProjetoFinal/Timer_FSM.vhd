library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Timer_FSM is
	port(reset			: in  std_logic;
		  clk				: in  std_logic;
		  timerEnable	: in	std_logic;
		  newTime		: in  std_logic;
		  timeVal		: in  std_logic_vector(7 downto 0);
		  timeExp		: out std_logic);
end Timer_FSM;

architecture Behavioral of Timer_FSM is

	signal s_counter : natural;
	signal time_cycle : natural:=to_integer(unsigned(TimeVal)) * 50000000;
	signal s_cntZero : std_logic := '0';

begin
	process(clk)
	begin
		if (rising_edge(clk)) then
			if (reset = '1') then
				s_counter <= time_cycle;
				s_cntZero <= '0';
				
			elsif (timerEnable = '1') then
			
				if (newTime = '1') then
						s_counter <= time_cycle - 1;
						s_cntZero <= '0';
				else
					if (s_counter = 0) then
						s_cntZero <= '1';
					else
						s_counter <= s_counter  - 1;
						s_cntZero <= '0';
					end if;
				end if;
			end if;
		end if;
	end process;
	
	timeExp <= s_cntZero;
end Behavioral;

 --50 000 000 equivale a 1 segundo!!!(mas em clock 50 Mhz of crosse)