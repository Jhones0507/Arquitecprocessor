--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:27:38 11/26/2014
-- Design Name:   
-- Module Name:   /home/robert/Arquitectura de Computadores/procesador basico 1/4  . Procesador load y store/Data_Memory_tb.vhd
-- Project Name:  ProcesadorBasico
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Data_Memory
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
 
ENTITY Data_Memory_tb IS
END Data_Memory_tb;
 
ARCHITECTURE behavior OF Data_Memory_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Data_Memory
    PORT(
         WRENMEM : IN  std_logic;
         rst : IN  std_logic;
         crd : IN  std_logic_vector(31 downto 0);
         address : IN  std_logic_vector(31 downto 0);
         datoMem : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal WRENMEM : std_logic := '0';
   signal rst : std_logic := '0';
   signal crd : std_logic_vector(31 downto 0) := (others => '0');
   signal address : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal datoMem : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Data_Memory PORT MAP (
          WRENMEM => WRENMEM,
          rst => rst,
          crd => crd,
          address => address,
          datoMem => datoMem
        );

   -- Clock process definitions
  
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		rst<='1';
      wait for 60 ns;
		rst<='0';
		WRENMEM<='1';
		crd<="00000000000000000000000000000010";
		address<="00000000000000000000000000000100";
		
		wait for 60 ns;
		
		WRENMEM<='0';
      -- insert stimulus here 
		wait for 100 ns;
     
   end process;

END;
