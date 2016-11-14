library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity muxRFSource is
    Port ( DATAMEM_in : in  STD_LOGIC_VECTOR (31 downto 0);
           ALUResult_in : in  STD_LOGIC_VECTOR (31 downto 0);
           DATATORF : in  STD_LOGIC_VECTOR (1 downto 0);
           PC_in : in  STD_LOGIC_VECTOR (31 downto 0);
           ALUResult_out : out  STD_LOGIC_VECTOR (31 downto 0));
end muxRFSource;

architecture Behavioral of muxRFSource is

begin
process(DATAMEM_in, ALUResult_in, DATATORF)
 
begin
 
if (DATATORF = "01")then
 ALUResult_out <= DATAMEM_in;
else
 if (DATATORF = "00")then
 ALUResult_out <= ALUResult_in;
 else
 if(DATATORF = "10")then
 ALUResult_out <= PC_in;
 end if;
 end if;
end if;
 
end process;

end Behavioral;

