library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity PSRModifier is
    Port ( 
				  aluResult : in  STD_LOGIC_VECTOR (31 downto 0);
				  operando1 : in  STD_LOGIC_VECTOR (31 downto 0);
				  operando2 : in  STD_LOGIC_VECTOR (31 downto 0);
				  aluop : in  STD_LOGIC_VECTOR (5 downto 0);
				  nzvc : out  STD_LOGIC_VECTOR (3 downto 0)
			);
end PSRModifier;

architecture Behavioral of PSRModifier is

begin
process(aluResult,operando1,operando2,aluOp)
begin
 --AND, ANDcc, OR, ORcc, XOR, XORcc
 if(aluOp = "000001" or aluOp = "001000" or aluOp ="000010" or aluOp ="010010" or aluOp ="000011" or aluOp ="010011")then
 nzvc(3) <= aluResult(31); 
 if(aluResult = "00000000000000000000000000000000")then
 nzvc(2)<= '1';----z
 else
 nzvc(2) <= '0';----z
 end if;
 nzvc(1) <='0'; ----v
 nzvc(0) <= '0';----c
 end if;
 --ADDcc, ADDxcc
 if(aluOp = "010000"or aluOp ="011000")then
 nzvc(3) <= aluResult(31);
 if(aluResult = "00000000000000000000000000000000")then
 nzvc(2) <= '1';--z
 else
 nzvc(2) <= '0';--z
 end if;
 nzvc(1) <= ((operando1(31) and operando2(31) and (not aluResult(31))) or ((not operando1(31)) and (not operando2(31)) and aluResult(31))); --v
 nzvc(0) <= (operando1(31) and operando2(31)); --c
 end if; 
 --SUBcc, SUBxcc
 if(aluOp = "010100" or aluOp = "011100")then
 nzvc(3) <= aluResult(31);--n
 
 if(aluResult = "00000000000000000000000000000000")then
 nzvc(2) <= '1';--z
 else
 nzvc(2) <= '0';--z
 end if;
 nzvc(1) <= ((operando1(31) and(not operando2(31)) and (not aluResult(31))) or (not operando1(31) and operando2(31) and aluResult(31))); --v
 nzvc(0) <= ((not operando1(31)) and operando2(31)); --c
 --else
 --nzvc &lt;= "1000";
 --end if;
 end if;
 
end process;

end Behavioral;

