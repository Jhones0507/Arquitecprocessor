----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:14:19 03/26/2014 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( OPE1 : in  STD_LOGIC_VECTOR (31 downto 0);
           OPE2 : in  STD_LOGIC_VECTOR (31 downto 0);
           ALUOP : in  STD_LOGIC_VECTOR (5 downto 0);
			  c : in STD_LOGIC_VECTOR (31 downto 0);
			  ALURESULT : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end ALU;

architecture Behavioral of ALU is

begin
process(OPE1,OPE2,ALUOP,c)
begin 

CASE(ALUOP) is
	when "000000"=>
		ALURESULT<="00000000000000000000000000000000";
	when "000001"=>
		ALURESULT<=OPE1+OPE2; 
	when "000010"=>
		ALURESULT<=OPE1-OPE2;
	when "000011"=>
		ALURESULT<=(OPE1 and OPE2);
	when "000100"=>
		ALURESULT<=OPE1 and (not(OPE2));
	when "000101"=>
		ALURESULT<=(OPE1 or OPE2);
	when "000110"=>
		ALURESULT<=OPE1 or (not(OPE2));
	when "000111"=>
		ALURESULT<=(OPE1 xor OPE2);
	when "001000"=>
		ALURESULT<=OPE1 xor not(OPE2);
	when "001001"=>
	   ALURESULT<=(OPE1 + OPE2 );--addcc
	when "001010"=>
	   ALURESULT<=(OPE1 - OPE2 );--subcc
	when "001011"=>
	   ALURESULT<=(OPE1 and OPE2);--andcc
	when"001100"=>
	   ALURESULT<= OPE1 and (not(OPE2));--andncc
	when "001101"=>
	   ALURESULT<=(OPE1 or OPE2);--orcc
	when "001110"=>		
	   ALURESULT<=OPE1 or (not(OPE2));--orncc
	when "001111"=>
	   ALURESULT<=(OPE1 xor OPE2);--xorcc
	when "010000"=>
	   ALURESULT<=OPE1 xor not(OPE2);--xnorcc
	when "010001"=>
		ALURESULT<=(OPE1 + OPE2) + c;--addxcc
	when "010010"=>
		ALURESULT<=(OPE1 - OPE2) - c;--subxcc
	when "010011"=>
		ALURESULT<=(OPE1 + OPE2) + c;--addx
	when "010100"=>
		ALURESULT<=(OPE1 - OPE2) - c;--subx
	when others =>
	ALURESULT <= "11111111111111110000000000000000";

END CASE;
end process;  



end Behavioral;

