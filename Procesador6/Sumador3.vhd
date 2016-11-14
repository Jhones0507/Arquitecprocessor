library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Sumador3 is
    Port ( PC : in  STD_LOGIC_VECTOR (31 downto 0);
           SEU22 : in  STD_LOGIC_VECTOR (31 downto 0);
           outa : out  STD_LOGIC_VECTOR (31 downto 0));
end Sumador3;

architecture Behavioral of Sumador3 is

begin

process (PC,SEU22)
 begin
 outa <= PC + SEU22;
 
 end process; 
end Behavioral;

