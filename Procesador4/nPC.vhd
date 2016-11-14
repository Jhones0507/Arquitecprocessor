library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nPC is
Port (     nPC_in : in  STD_LOGIC_VECTOR (31 downto 0);
           RST : in  STD_LOGIC;
		     CLK : in STD_LOGIC;
           nPC_out : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end nPC;

architecture Behavioral of nPC is

begin
 process(nPC_in,CLK,RST)
 begin
if (RST='1') then
   nPC_out <= (others=>'0');
else
	if (rising_edge (CLK)) then
		nPC_out<= nPC_in;
	end if;
end if;
end process;

end Behavioral;

