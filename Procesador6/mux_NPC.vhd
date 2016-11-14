library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity mux_NPC is
    Port (
				  PCD30 : in  STD_LOGIC_VECTOR (31 downto 0);
				  PCD22 : in  STD_LOGIC_VECTOR (31 downto 0);
				  PCAdress : in  STD_LOGIC_VECTOR (31 downto 0);
				  PCsource : in  STD_LOGIC_VECTOR (1 downto 0);
				  PC_in : in  STD_LOGIC_VECTOR (31 downto 0);
				  PCAdress_out : out  STD_LOGIC_VECTOR (31 downto 0)
			);
end mux_NPC;

architecture Behavioral of mux_NPC is

begin
 process(PCD30, PCD22, PCAdress, PCsource, PC_in)
 
begin
 
if(PCsource = "00")then
 PCAdress_out <= PC_in;
else
 if(PCsource = "01")then
 PCAdress_out <= PCAdress;
 else
 if(PCsource = "10")then
 PCAdress_out <= PCD30;
 else
 if(PCsource = "11")then
 PCAdress_out <= PCD22;
 end if;
 end if;
 end if;
end if;
 
end process;

end Behavioral;

