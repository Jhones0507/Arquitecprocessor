library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity ALU is
    Port ( 
				  operando1 : in  STD_LOGIC_VECTOR (31 downto 0);
				  operando2 : in  STD_LOGIC_VECTOR (31 downto 0);
				  aluop : in  STD_LOGIC_VECTOR (5 downto 0);
				  carry : in  STD_LOGIC;
				  Aluresult : out  STD_LOGIC_VECTOR (31 downto 0)
			);
end ALU;

architecture Behavioral of ALU is

begin
process(operando1,operando2,aluOp,carry)
 begin
 case (aluOP) is 
 when "000000" => ------------------------- add, Save, Restore, JMPL, Load, Store
 AluResult <= operando1 + operando2; when "010000"=> ---------------------------addcc
 AluResult <= operando1 + operando2; when "011000"=> ---------------------------addxcc
 AluResult <= operando1 + operando2 + carry; when "001000"=> ---------------------------------addx
 AluResult <= operando1 + operando2 + carry; when "000001" => ------------------------------and
 AluResult <= operando1 and operando2; when "010001" => -------------------------------andcc
 AluResult <= operando1 and operando2; when "000010" => -------------------------------- or
 AluResult <= operando1 or operando2; when "010010" => ----------------------------- orcc
 AluResult <= operando1 or operando2; when "000100" => ------------------------------ sub
 AluResult <= operando1 - operando2; when "010100" => ------------------------------ subcc
 AluResult <= operando1 - operando2; when "011100" => ------------------------------ subxcc
 AluResult <= operando1 - operando2-carry; when "000011" => --------------------------------xor
 AluResult <= operando1 xor operando2; when "010011" => --------------------------------xorcc
 AluResult <= operando1 xor operando2; when "000110" => ------------------------------- nor 
 AluResult <= not (operando1 or operando2); when "010110" => ------------------------------- norcc 
 AluResult <= not (operando1 or operando2); when "000111" => -----------------------------------xnor
 AluResult <= not(operando1 xor operando2); when "010111" => --------------------------------- xnorcc
 AluResult <= not(operando1 xor operando2); when "000101" => ----------------------------------nand
 AluResult <= not(operando1 and operando2); when "010101" => -----------------------------------Xnandcc
 AluResult <= not(operando1 and operando2); when others => -- Cae el nop
 AluResult <= (others=>'0');
 
 end case;
 end process;

end Behavioral;

