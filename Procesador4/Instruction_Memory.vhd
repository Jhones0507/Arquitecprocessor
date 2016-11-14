library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use std.textio.all;
use IEEE.STD_LOGIC_ARITH.ALL;

entity IM is
    Port ( Address : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
           Instruction : out  STD_LOGIC_VECTOR (31 downto 0));
end IM;

architecture Behavioral of IM is

type matriz is array (0 to 31) of std_logic_vector (31 downto 0);

impure function InitRomFromFile (RomFileName : in string) return matriz is
		FILE RomFile : text open read_mode is RomFileName;
		variable RomFileLine : line;
		variable temp_bv : bit_vector(31 downto 0);
		variable temp_mem : matriz;
		begin
			for I in matriz'range loop
				readline (RomFile, RomFileLine);
				read(RomFileLine, temp_bv);
				temp_mem(i) := to_stdlogicvector(temp_bv);
			end loop;
		return temp_mem;
	end function;
	
    signal Memory : matriz:= InitRomFromFile("mult2.txt");

begin

   process(rst,Address,Memory)
	begin
	   if rst = '1' then
	   Instruction <= (others=>'0');
		else
		Instruction <= Memory(conv_integer(Address(4 downto 0))); 
	end if;
	end process;

end Behavioral;

