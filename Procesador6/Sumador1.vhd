library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Sumador1 is
    Port ( 
				  op1 : in  STD_LOGIC_VECTOR (31 downto 0);
				  op2 : in  STD_LOGIC_VECTOR (31 downto 0);
				  outa : out  STD_LOGIC_VECTOR (31 downto 0)
			);
end Sumador1;

architecture Behavioral of Sumador1 is

begin

process (op1,op2)
 begin
        outa <= op1 + op2;
 
 end process; 
end Behavioral;

