
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity SignExtensionUnit is
    Port ( simm13 : in  STD_LOGIC_VECTOR (12 downto 0);
           simm32 : out  STD_LOGIC_VECTOR (31 downto 0));
end SignExtensionUnit;

architecture Behavioral of SignExtensionUnit is

begin
process(simm13)
begin

if simm13(12) = '1' then
	simm32 <= "1111111111111111111"&simm13;
else
	simm32 <= "0000000000000000000"&simm13;
end if;
end process;


end Behavioral;

