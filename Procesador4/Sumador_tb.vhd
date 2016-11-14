--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   06:08:17 03/28/2014
-- Design Name:   
-- Module Name:   D:/Fabio/Universidad Tecnologica/Arquitectura de Computadores/Mono/Sumador_tb.vhd
-- Project Name:  Mono
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Sumador
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Sumador_tb IS
END Sumador_tb;
 
ARCHITECTURE behavior OF Sumador_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Sumador
    PORT(
         OPE1 : IN  std_logic_vector(31 downto 0);
         OPE2 : IN  std_logic_vector(31 downto 0);
         RESULTADO : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal OPE1 : std_logic_vector(31 downto 0) := (others => '0');
   signal OPE2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal RESULTADO : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Sumador PORT MAP (
          OPE1 => OPE1,
          OPE2 => OPE2,
          RESULTADO => RESULTADO
        );

   
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      --wait for 100 ns;	
		--OPE1 <= "00000000000000000000000000000010";
		--OPE2 <= "00000000000000000000000000000100";
--		wait for 100 ns;
--		OPE1 <= "11111111111111111111111111111110";
--		OPE2 <= "00000000000000000000000000000100";

      

      -- insert stimulus here 

      wait;
   end process;

END;
