library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity muxWm is
    Port ( 
				  ct : in  STD_LOGIC;
				  rd : in  STD_LOGIC_VECTOR (5 downto 0);
				  fifteen : in  STD_LOGIC_VECTOR (5 downto 0);
				  nrd : out  STD_LOGIC_VECTOR (5 downto 0)
			 );
end muxWm;

architecture Behavioral of muxWm is

begin

process(ct,rd,fifteen)
 begin
 if (ct = '0') then
 nrd <= rd;
 else
 nrd <= fifteen;
 end if;
 end process;
end Behavioral;

