
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Fin is
    Port ( entrada : in  STD_LOGIC_VECTOR (31 downto 0);
           salida : out  STD_LOGIC_VECTOR (31 downto 0));
end Fin;

architecture Behavioral of Fin is

begin
process(entrada)
begin
salida <= entrada;
end process;


end Behavioral;

