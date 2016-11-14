--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   06:03:11 03/28/2014
-- Design Name:   
-- Module Name:   D:/Fabio/Universidad Tecnologica/Arquitectura de Computadores/Mono/nPC_tb.vhd
-- Project Name:  Mono
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: nPC
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
 
ENTITY nPC_tb IS
END nPC_tb;
 
ARCHITECTURE behavior OF nPC_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT nPC
    PORT(
         nPC_in : IN  std_logic_vector(31 downto 0);
         RST : IN  std_logic;
         CLK : IN  std_logic;
         nPC_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal nPC_in : std_logic_vector(31 downto 0) := (others => '0');
   signal RST : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal nPC_out : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: nPC PORT MAP (
          nPC_in => nPC_in,
          RST => RST,
          CLK => CLK,
          nPC_out => nPC_out
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
--      rst<='1';
--		wait for 100 ns;
--      
--      rst<='0';
--      nPC_in<= "00000000000000000000000000000100";		
--		wait for 100 ns;	
--		nPC_in<= "00000000000000000000000000101100";		
--		wait for 100 ns;	

      -- insert stimulus here 

      wait;
   end process;

END;
