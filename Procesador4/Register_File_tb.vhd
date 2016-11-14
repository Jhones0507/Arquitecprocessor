--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:18:32 03/26/2014
-- Design Name:   
-- Module Name:   /home/alejandra/principal/Register_file_tb.vhd
-- Project Name:  principal
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Register_File
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
 
ENTITY Register_file_tb IS
END Register_file_tb;
 
ARCHITECTURE behavior OF Register_file_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Register_File
    PORT(
         RS1 : IN  std_logic_vector(4 downto 0);
         RS2 : IN  std_logic_vector(4 downto 0);
         RD : IN  std_logic_vector(4 downto 0);
         DWR : IN  std_logic_vector(31 downto 0);
         RST : IN  std_logic;
         CRS1 : OUT  std_logic_vector(31 downto 0);
         CRS2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RS1 : std_logic_vector(4 downto 0) := (others => '0');
   signal RS2 : std_logic_vector(4 downto 0) := (others => '0');
   signal RD : std_logic_vector(4 downto 0) := (others => '0');
   signal DWR : std_logic_vector(31 downto 0) := (others => '0');
   signal RST : std_logic := '0';

 	--Outputs
   signal CRS1 : std_logic_vector(31 downto 0);
   signal CRS2 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Register_File PORT MAP (
          RS1 => RS1,
          RS2 => RS2,
          RD => RD,
          DWR => DWR,
          RST => RST,
          CRS1 => CRS1,
          CRS2 => CRS2
        );

   
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      
--		RST <= '1'; 
--		wait for 100 ns;
--		RST <= '0';
--		RD  <= "00001";
--		DWR <= "00000000000000000000000000000011";
--		wait for 100 ns;
--		RS2 <= "00001";
--		RD  <= "00010";
--		DWR <= "00000000000000000000000000000101";
--		wait for 100 ns;
--		RS1 <= "00010";
--		RS2 <= "00010";
--		RD  <= "00011";
--		DWR <= "00000000000000000000000000010101"; 
--		wait for 100 ns;
--		RS2 <= "00011";
--		RD  <= "00100";
--		DWR <= "00000000000000000000000000010001"; 
--		wait for 100 ns;
--		RS1 <= "00100";
--		RS2 <= "00001";
		
  
      -- insert stimulus here 

      wait;
   end process; 

END;
