----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:34:23 10/31/2014 
-- Design Name: 
-- Module Name:    PSR_Modifier - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PSR_Modifier is
    Port ( operando1 : in  STD_LOGIC;
           operando2 : in  STD_LOGIC;
           aluop : in  STD_LOGIC_VECTOR (5 downto 0);
           aluResult : in  STD_LOGIC_VECTOR (31 downto 0);
           nzvc : out  STD_LOGIC_VECTOR (3 downto 0));
end PSR_Modifier;

architecture Behavioral of PSR_Modifier is
signal t :std_logic:= '0';
begin
process(operando1, operando2, aluop, aluResult)
begin
--	case aluop is
--		when aluop = "001001" or aluop = "001010"
--		--
--		--
--	if (nzvc(0) != '0' and nzvc(0) != '1' )then
--		nzvc<=(others => '0');
--	end if;
	if (t='0')then
		nzvc <=(others =>'0');
	end if;
	if (aluop = "001001" or aluop = "010001")then --ADDCC ADDXCC
		t<='1';
		nzvc(3) <= aluResult(31);	
		if(aluResult = "00000000000000000000000000000000")then
			nzvc(2) <= '1';
		else
			nzvc(2) <= '0';
		end if;
		nzvc(1) <= (operando1 and operando2 and (not aluResult(31))) or (not(operando1) and (not operando2) and aluResult(31));
		nzvc(0) <= (operando1 and operando2) or ((not aluResult(31)) and (operando1 or operando2));
		
	else
		t<='1';
		if (aluop = "001010" or aluop = "010010")then --SUBCC SUBXCC
			nzvc(3) <= aluResult(31);
			if(aluResult = X"00000000")then
				nzvc(2) <= '1';
			else
				nzvc(2) <= '0';
			end if;
			nzvc(1) <= (operando1 and (not operando2) and (not aluResult(31))) or ((not operando1) and operando2 and aluResult(31));
			nzvc(0) <= ((not operando1) and operando2) or (aluResult(31) and ((not operando1) or operando2));
		
		else
			t<='1';
			if(aluop = "001011" or aluop = "001100" or aluop = "001101" or aluop = "001110" or aluop = "001111" or aluop = "010000")then
				nzvc(3) <= aluResult(31);
				if(aluResult = X"00000000")then
					nzvc(2) <= '1';
				else
					nzvc(2) <= '0';
				end if;
				nzvc(1) <= '0';
				nzvc(0) <= '0';
			end if;
		end if;
	end if;
end process;
end Behavioral;
