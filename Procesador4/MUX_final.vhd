----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:06:31 11/26/2014 
-- Design Name: 
-- Module Name:    MUX_final - Behavioral 
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

entity MUX_final is
    Port ( DataToReg : in  STD_LOGIC;
           SalidaDataMemory : in  STD_LOGIC_vector(31 downto 0);
           SalidaAlu : in  STD_LOGIC_vector(31 downto 0);
           SalidaFinal : out  STD_LOGIC_vector(31 downto 0)
			  );
end MUX_final;

architecture Behavioral of MUX_final is

begin
		process(DataToReg,SalidaDataMemory,SalidaAlu)
		begin
			if(DataToReg='1')then
				SalidaFinal<=SalidaDataMemory;
			else
				SalidaFinal<=SalidaAlu;
			end if;
		end process;

end Behavioral;

