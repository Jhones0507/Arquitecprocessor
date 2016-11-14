--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:39:37 03/26/2014
-- Design Name:   
-- Module Name:   /home/alejandra/principal/ALU_tb.vhd
-- Project Name:  principal
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY ALU_tb IS
END ALU_tb;
 
ARCHITECTURE behavior OF ALU_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         OPE1 : IN  std_logic_vector(31 downto 0);
         OPE2 : IN  std_logic_vector(31 downto 0);
         ALUOP : IN  std_logic_vector(4 downto 0);
         ALURESULT : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal OPE1 : std_logic_vector(31 downto 0) := (others => '0');
   signal OPE2 : std_logic_vector(31 downto 0) := (others => '0');
   signal ALUOP : std_logic_vector(4 downto 0) := (others => '0');
   

 	--Outputs
   signal ALURESULT : std_logic_vector(31 downto 0);

   -- Clock period definitions
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          OPE1 => OPE1,
          OPE2 => OPE2,
          ALUOP => ALUOP,
          ALURESULT => ALURESULT
        );

  
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
--      wait for 100 ns;	
--      
--      OPE1 <= "00000000000000000000000000000010";
--		OPE2 <= "00000000000000000000000000000100";
--		ALUOP <= "00000";
--		
--		wait for 100 ns;
--		ALUOP <= "00001";
--		
--		

      -- insert stimulus here 

      wait;
   end process;

END;
