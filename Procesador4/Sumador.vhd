
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity Sumador is
    Port ( OPE1 : in  STD_LOGIC_VECTOR (31 downto 0);
           OPE2 : in  STD_LOGIC_VECTOR (31 downto 0);
           RESULTADO : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end Sumador;

architecture Behavioral of Sumador is

begin
process(OPE1,OPE2)
begin

RESULTADO <= OPE1 + OPE2;
end process;

end Behavioral;

