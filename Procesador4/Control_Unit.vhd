----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:38:37 03/26/2014 
-- Design Name: 
-- Module Name:    Control_unit - Behavioral 
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

entity Control_unit is
    Port ( OP : in  STD_LOGIC_VECTOR (1 downto 0);
           OP3 : in  STD_LOGIC_VECTOR (5 downto 0);
			  WREN : out STD_LOGIC;
			  WRENMEM : out STD_LOGIC;
			  DataToReg: out std_logic;
			  --enableMem: out std_logic;
			  ALUOP : out  STD_LOGIC_VECTOR (5 downto 0)
			  );
end Control_unit;

architecture Behavioral of Control_unit is
begin
process(OP,OP3)
begin

if(OP="10") then
	case OP3 is
		when "000000" =>
			ALUOP<="000001";--suma
			WREN<='1';
			WRENMEM<='0';
			DataToReg<='0';
		
		when "000100" =>
			ALUOP<="000010";--resta
			WREN<='1';
			WRENMEM<='0';
			DataToReg<='0';
			
		when "000001" => 
			ALUOP<="000011";--esta es la AND
			WREN<='1';
			WRENMEM<='0';
			DataToReg<='0';
		when "000101" =>
			ALUOP<="000100";--esta es la ANDN
			WREN<='1';
			WRENMEM<='0';
			DataToReg<='0';

		when "000010"=>
			ALUOP<="000101";--esta es la OR
			WREN<='1';
			WRENMEM<='0';
			DataToReg<='0';
			
		when "000110"=>
			ALUOP<="000110";--esta es la ORN
			WREN<='1';
			WRENMEM<='0';
			DataToReg<='0';
			
	   when "000011"=>
			ALUOP<="000111";--esta es la XOR
			WREN<='1';
			WRENMEM<='0';
			DataToReg<='0';
			
	   when "000111" =>
			ALUOP<="001000";--esta es la XNOR
			WREN<='1';
			WRENMEM<='0';
			DataToReg<='0';
			
		when "010000" =>
			ALUOP<="001001";--ADDcc
			WREN<='1';
			WRENMEM<='0';
			DataToReg<='0';
	
		when "010100" =>
			ALUOP<="001010";--SUBcc
			WREN<='1';
			WRENMEM<='0';
			DataToReg<='0';
			
		when "010001" =>
			ALUOP<="001011";--ANDcc
			WREN<='1';
			WRENMEM<='0';
			DataToReg<='0';
	
		when "010101" =>
			ALUOP<="001100";--ANDNcc
			WREN<='1';
			WRENMEM<='0';
			DataToReg<='0';
			
		when "010010" =>
			ALUOP<="001101";--ORcc
			WREN<='1';
			WRENMEM<='0';
			DataToReg<='0';
		
		when "010110" =>
			ALUOP<="001110";--ORNcc
			WREN<='1';
			WRENMEM<='0';
			
		when "010011" =>
			ALUOP<="001111";--XORcc
			WREN<='1';
			WRENMEM<='0';
			DataToReg<='0';
			
		when "010111" =>
			ALUOP<="010000";--XNORcc
			WREN<='1';
			WRENMEM<='0';
			DataToReg<='0';
			
		when "011000" =>
			ALUOP<="010001";--ADDxcc
			WREN<='1';
			WRENMEM<='0';
			DataToReg<='0';
			
		when "011100" =>
			ALUOP<="010010";--SUBxcc
			WREN<='1';
			WRENMEM<='0';
			DataToReg<='0';
		
		when "001000" =>
			ALUOP<="010011";--ADDx
			WREN<='1';
			WRENMEM<='0';
			DataToReg<='0';
			
		when "001100" =>
			ALUOP<="010100";--SUBx
			WREN<='1';
			WRENMEM<='0';
			DataToReg<='0';
			
		when "111100" =>
			ALUOP<="000001";--add-save
			WREN<='1';
			WRENMEM<='0';
			DataToReg<='0';
			
		when "111101" =>
			ALUOP<="000001";--add-restore
			WREN<='1';
			WRENMEM<='0';
			DataToReg<='0';
			
		when others => 
			ALUOP<= "000000";
			WREN<='0';
			WRENMEM<='0';
			DataToReg<='0';
		
	end case;
	
else if(OP="11") then
	case OP3 is
		when "000000" =>
			ALUOP<="000001";--load
			WRENMEM<='0';
			WREN<='1';
			DataToReg<='1';
		
		when "000100" =>
			ALUOP<="000001";--store
			WRENMEM<='1';
			WREN<='0';
			DataToReg<='1';
			
		when others => 
			ALUOP<= "000000";
			WRENMEM<='0';
			WREN<='0';
			DataToReg<='0';
	end case;
else
	ALUOP<= "000000";
	WRENMEM<='0';
	WREN<='0';
	DataToReg<='0';
	
end if;
end if;


end process;		
		
		
		end Behavioral;

