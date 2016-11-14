library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC is
Port (     PC_in : in  STD_LOGIC_VECTOR (31 downto 0);
           RST : in  STD_LOGIC;
		     CLK : in STD_LOGIC;
           PC_out : out  STD_LOGIC_VECTOR (31 downto 0));
end PC;

architecture Behavioral of PC is

begin
 process(PC_in,CLK,RST)
 begin
	if (rising_edge (CLK)) then
		if (RST='1') then
			PC_out <= (others=>'0');
		else
			
				PC_out<= PC_in;
		end if;
	end if;
end process;

end Behavioral;

