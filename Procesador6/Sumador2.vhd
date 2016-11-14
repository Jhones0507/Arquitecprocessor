library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Sumador2 is
    Port ( 
				  PC : in  STD_LOGIC_VECTOR (31 downto 0);
				  DISP30 : in  STD_LOGIC_VECTOR (31 downto 0);
				  outa : out  STD_LOGIC_VECTOR (31 downto 0)
			 );
end Sumador2;

architecture Behavioral of Sumador2 is

begin

process (PC,DISP30)
begin
 
 outa <= PC + DISP30;
 
 end process; 
end Behavioral;

