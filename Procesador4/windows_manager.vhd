----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:53:20 11/11/2014 
-- Design Name: 
-- Module Name:    windows_manager - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
                                           
entity windows_manager is
    Port ( op : in  STD_LOGIC_VECTOR(1 downto 0);
           op3 : in  STD_LOGIC_VECTOR(5 downto 0);
           rs1 : in  STD_LOGIC_VECTOR(4 downto 0);
			  RST : in std_logic;
           rs2 : in  STD_LOGIC_VECTOR(4 downto 0);
           rd : in  STD_LOGIC_VECTOR(4 downto 0);
           cwp : in  STD_LOGIC_VECTOR(1 downto 0);
           ncwp : out  STD_LOGIC_vector(1 downto 0);
           nrs1 : out  STD_LOGIC_VECTOR(5 downto 0);
           nrs2 : out  STD_LOGIC_VECTOR(5 downto 0);
           nrd : out  STD_LOGIC_VECTOR(5 downto 0)
			  );
end windows_manager;

architecture Behavioral of windows_manager is

begin
process(op,op3,rs1,rs2,rd,cwp,RST)
begin

if(RST='0')then
	if(op="10" and op3="111100") then --save
		if (cwp/="00")then
			ncwp<= conv_std_logic_vector(conv_integer(cwp)- 1,2);
		else
			ncwp<=cwp;
		end if;
	else 
			if(op="10" and op3="111101") then --restore
			 if (cwp/="01")then
				ncwp<= conv_std_logic_vector(conv_integer(cwp)+ 1,2);
			 else 
			  ncwp<=cwp;
			 end if;
			end if;
	end if;
	
	if(rs1 >="00000" and rs1 <="00111")then
		--auxrs1<=conv_integer(rs1);
		nrs1 <= conv_std_logic_vector(conv_integer(rs1),6);
	else
			if (rs1 >="11000" and rs1 <="11111") then
				nrs1<=conv_std_logic_vector(conv_integer(rs1)-(conv_integer(cwp)*16),6);
			else
				if(rs1>="10000" and rs1<="10111") then
					nrs1<=conv_std_logic_vector(conv_integer(rs1)+(conv_integer(cwp)*16),6);
				else
						if(rs1>="01000"and rs1<="01111")then
							nrs1<=conv_std_logic_vector(conv_integer(rs1)+(conv_integer(cwp)*16),6);
						end if;
				end if;
			end if;
	end if;
	
	if(rs2 >="00000" and rs2 <="00111")then
		--auxrs2<=conv_integer(rs2);
		nrs2<=conv_std_logic_vector(conv_integer(rs2),6);
	else
			if (rs2 >="11000" and rs2 <="11111") then
				nrs2<=conv_std_logic_vector(conv_integer(rs2)-(conv_integer(cwp)*16),6);
			else
				if(rs2>="10000" and rs2<="10111") then
					nrs2<=conv_std_logic_vector(conv_integer(rs2)+(conv_integer(cwp)*16),6);
				else
						if(rs2>="01000"and rs2<="01111")then
							nrs2<=conv_std_logic_vector(conv_integer(rs2)+(conv_integer(cwp)*16),6);
						end if;
				end if;
			end if;
	end if;
  
   if(rd >="00000" and rd <="00111")then
		--auxrd<=conv_integer(rd);
		nrd<=conv_std_logic_vector(conv_integer(rd),6);
	else
			if (rd >="11000" and rd <="11111") then
				nrd<=conv_std_logic_vector(conv_integer(rd)-(conv_integer(cwp)*16),6);
			else
				if(rd>="10000" and rd<="10111") then
					nrd<=conv_std_logic_vector(conv_integer(rd)+(conv_integer(cwp)*16),6);
				else
						if(rd>="01000"and rd<="01111")then
							nrd<=conv_std_logic_vector(conv_integer(rd)+(conv_integer(cwp)*16),6);
						end if;
				end if;
			end if;
	end if;
else
	nrs1<="000000";
	nrs2<="000000";
	nrd<="000000";
	ncwp<="00";
end if;
end process;
--else 	
--	nrs1<="000000";
--	nrs2<="000000";
--	nrd<="000000";
--	ncwp<="00"; 
--end if;
	

end Behavioral;

