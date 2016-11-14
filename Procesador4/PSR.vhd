----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:04:58 11/06/2014 
-- Design Name: 
-- Module Name:    PSR - Behavioral 
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

entity PSR is
    Port ( clk : in STD_LOGIC;
	        rst : in STD_LOGIC;
			  nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
			  ncwp : in  STD_LOGIC_VECTOR (1 downto 0);
			  cwp :  out  STD_LOGIC_VECTOR (1 downto 0);
           carry_out : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end PSR;

architecture Behavioral of PSR is
signal PSRegister: STD_LOGIC_VECTOR (31 DOWNTO 0):= (others=>'0');
begin

process(clk, nzvc, rst,ncwp)
begin

	if (rising_edge(clk))then
		if (rst = '1')then
			carry_out <= (others => '0');
			carry_out(0) <= '0';
			cwp <= "00";
		else
			carry_out <= (others => '0');
			carry_out(0) <= nzvc(0);
			cwp<=ncwp;
		end if;
	end if;
end process;
end Behavioral;

