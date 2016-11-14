--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:52:45 03/25/2014
-- Design Name:   
-- Module Name:   /home/alejandra/npc/IM_tb.vhd
-- Project Name:  npc
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: IM
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
 
ENTITY IM_tb IS
END IM_tb;
 
ARCHITECTURE behavior OF IM_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT IM
    PORT(
         Address : IN  std_logic_vector(31 downto 0);
         rst : IN  std_logic;
         Instruction : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Address : std_logic_vector(31 downto 0) := (others => '0');
   signal rst : std_logic := '0';

 	--Outputs
   signal Instruction : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: IM PORT MAP (
          Address => Address,
          rst => rst,
          Instruction => Instruction
        );

     -- Stimulus process
   stim_proc: process
   begin		
--      rst <= '1';
--	   --address <= "00000000000000000000000000000000";
--		wait for 100 ns;
--		
--		rst <= '0';
--		address <= "00000000000000000000000000000011";
--		wait for 100 ns;
--		address <= "00000000000000000000000000010000";
--		wait for 100 ns;
--		address <= "00000000000000000000000000011111";
		
		
		  
      -- insert stimulus here 

      wait;
   end process;

END;
