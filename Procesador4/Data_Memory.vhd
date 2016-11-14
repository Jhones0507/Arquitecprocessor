----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:22:33 11/25/2014 
-- Design Name: 
-- Module Name:    Data_Memory - Behavioral 
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


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives xin this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Data_Memory is
    Port ( WRENMEM : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  --clk: in std_logic;
           crd : in  STD_LOGIC_VECTOR(31 downto 0);
			  address : in  STD_LOGIC_VECTOR(31 downto 0);
			  datoMem : out  STD_LOGIC_VECTOR(31 downto 0):=(others =>'0')
           );
end Data_Memory;

architecture Behavioral of Data_Memory is
		type ram_type is array (0 to 63) of std_logic_vector(31 downto 0);
		signal ramMemory : ram_type:=(others=> x"00000000");
begin
		process(WRENMEM,rst,crd,address)
		begin
			--if(rising_edge(clk))then
			--		if(enableMem= '1')then
						if(rst='1')then
							datoMem<=(others => '0');
							ramMemory<=(others => x"00000000");
						else
							if(WRENMEM='0')then
								datoMem<=ramMemory(conv_integer(address(5 downto 0)));
							else
								ramMemory(conv_integer(address(5 downto 0)))<=crd;
							end if;
						end if;
					--end if;
			--end if;
		end process;
end Behavioral;
