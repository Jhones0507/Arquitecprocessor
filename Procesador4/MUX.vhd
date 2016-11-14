
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity MUX is
    Port ( Entrada1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Entrada2 : in  STD_LOGIC_VECTOR (31 downto 0);
           i : in  STD_LOGIC;--bit i
           MUXOUT : out  STD_LOGIC_VECTOR (31 downto 0));
end MUX;

architecture Behavioral of MUX is

begin
process(Entrada1,Entrada2,i)
begin

if i <= '0' then
	MUXOUT <= Entrada1;
else
	MUXOUT <= Entrada2;
end if;
end process;


end Behavioral;

