library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RegisterRef is
    port(
            reset       : in  std_logic;
            clk      	: in  std_logic;
            fanta     	: in  std_logic;
            sumo_lim    : in  std_logic;
            sumo_pes   	: in  std_logic;
            selGelo	 	: in  std_logic;
            dataOut    	: out std_logic_vector(4 downto 0));
end RegisterRef;

architecture Shell of RegisterRef is 

    begin 
        process(clk)
            begin
                if(rising_edge(clk)) then
                    dataOut(0) <= reset;
                    dataOut(1) <= fanta;
                    dataOut(2) <= sumo_lim;
                    dataOut(3) <= sumo_pes;
                    dataOut(4) <= selGelo;
                end if;
            end process;
    end Shell;