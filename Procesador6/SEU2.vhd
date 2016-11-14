library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity SEU2 is
    Port ( 
					simm22 : in  STD_LOGIC_VECTOR (21 downto 0);
					simm32 : out  STD_LOGIC_VECTOR (31 downto 0)
			 );
end SEU2;

architecture Behavioral of SEU2 is

begin

process(simm22)
 begin
 
 if(simm22(21) = '1')then
 simm32(21 downto 0) <= simm22;
 simm32(31 downto 22) <= (others=>'1');
 else
 simm32(21 downto 0) <= simm22;
 simm32(31 downto 22) <= (others=>'0');
 end if;
 end process;

end Behavioral;

