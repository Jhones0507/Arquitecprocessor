library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Mux is
    Port ( 
				  Crs2 : in  STD_LOGIC_VECTOR (31 downto 0);
				  SEUOperando : in  STD_LOGIC_VECTOR (31 downto 0);
				  selImmediate : in  STD_LOGIC_VECTOR (0 downto 0);
				  OperandoALU : out  STD_LOGIC_VECTOR (31 downto 0)
			);
end Mux;

architecture Behavioral of Mux is

begin
process(Crs2,SEUOperando,selImmediate)
 begin
 if(selImmediate = "0")then
 OperandoALU <= Crs2;
 else
 if(selImmediate = "1")then
 OperandoALU <= SEUOperando;
 end if;
 end if;
 end process;

end Behavioral;

