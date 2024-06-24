library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Bin7SegDecoder is
	port( enable   : in std_logic;
		   binInput	: in  std_logic_vector(3 downto 0);
		   decOut_n	: out std_logic_vector(6 downto 0));
end Bin7SegDecoder;

architecture Behavioral of Bin7SegDecoder is	

signal s_decOut_n : std_logic_vector(6 downto 0);

begin 
		
		with binInput select
			s_decOut_n <= "1001111" when "0001",	--I
							  "0001001" when "0010",	--H
							  "0000110" when "0011",	--E
							  "0101111" when "0100",	--R
							  "0001110" when "0101",	--F
							  "0001000" when "0110",	--A
							  "1001000" when "0111",	--N
							  "0010010" when "1000",	--S
							  "1000000" when "1001",	--O
							  "1000111" when "1010",	--L
							  "0001100" when "1011",	--P
							  "1111111" when others;	--Nada
							
			decOut_n <= s_decOut_n when (enable = '1') else
				"1111111";
end Behavioral;
