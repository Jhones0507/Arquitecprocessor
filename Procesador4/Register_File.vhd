----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:13:57 03/26/2014 
-- Design Name: 
-- Module Name:    Register_File - Behavioral 
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

entity Register_File is
    Port ( RS1 : in  STD_LOGIC_VECTOR (5 downto 0);
           RS2 : in  STD_LOGIC_VECTOR (5 downto 0);
           RD : in  STD_LOGIC_VECTOR (5 downto 0);
           DWR : in  STD_LOGIC_VECTOR (31 downto 0);
			  WREN: in std_logic;
			  RST : in  std_logic;
			  CRS1 : out  STD_LOGIC_VECTOR (31 downto 0);
			  CRSD : out  STD_LOGIC_VECTOR (31 downto 0);
           CRS2 : out  STD_LOGIC_VECTOR (31 downto 0));
end Register_File;

architecture Behavioral of Register_File is
type RF is array (0 to 39) of std_logic_vector (31 downto 0);
signal RF_SIGNAL : RF:=(others=>x"00000000");
begin
process(RS1,RS2,RD,DWR,RST)
begin

--RF_SIGNAL(0)  <= "00000000000000000000000000000000"; 

if(RST = '1') then
	CRS1 <= (others => '0');
	CRS2 <= (others => '0');
	CRSD <= (others => '0');
	RF_SIGNAL <= (others => x"00000000");
else
		CRS1 <= RF_SIGNAL(conv_integer(RS1)); 
		CRS2 <= RF_SIGNAL(conv_integer(RS2));
		CRSD <= RF_SIGNAL(conv_integer(RD));
	if ( WREN = '1') then

		if(RD /= "000000") then  
			RF_SIGNAL(conv_integer(RD))<= DWR;
		else
			RF_SIGNAL(0)  <= "00000000000000000000000000000000";   
			
		end if;
	end if;
end if;
 
end process; 

end Behavioral;

