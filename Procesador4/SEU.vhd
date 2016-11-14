
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity SEU is
    Port ( EntradaSEU : in  STD_LOGIC_VECTOR (12 downto 0);
           SalidaSEU : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU;

architecture Behavioral of SEU is

begin
process(EntradaSEU)
begin

if EntradaSeu(12) = '1' then
	SalidaSEU <= "1111111111111111111"&EntradaSEU;
else
	SalidaSEU <= "0000000000000000000"&EntradaSEU;
end if;
end process;


end Behavioral;

