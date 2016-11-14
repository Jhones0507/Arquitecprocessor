--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:36:08 11/06/2014
-- Design Name:   
-- Module Name:   /home/robert/Arquitectura de Computadores/procesador basico 1/2. Procesador con PSR/PSR_Modifier_tb.vhd
-- Project Name:  ProcesadorBasico
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PSR_Modifier
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
 
ENTITY PSR_Modifier_tb IS
END PSR_Modifier_tb;
 
ARCHITECTURE behavior OF PSR_Modifier_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PSR_Modifier
    PORT(
         operando1 : IN  std_logic;
         operando2 : IN  std_logic;
         aluop : IN  std_logic_vector(4 downto 0);
         aluResult : IN  std_logic_vector(31 downto 0);
         nzvc : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal operando1 : std_logic := '0';
   signal operando2 : std_logic := '0';
   signal aluop : std_logic_vector(4 downto 0) := (others => '0');
   signal aluResult : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal nzvc : std_logic_vector(3 downto 0) := (others => '0');
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSR_Modifier PORT MAP (
          operando1 => operando1,
          operando2 => operando2,
          aluop => aluop,
          aluResult => aluResult,
          nzvc => nzvc
        );

   -- Stimulus process
   stim_proc: process
   begin
		wait for 100 ns;
          operando1 <= '0';
          operando2 <= '0';
          aluop <= "10011";
          aluResult <= "11111111111111111111111111111111";
		wait for 100 ns;
          operando1 <= '0';
          operando2 <= '0';
          aluop <= "01001";
          aluResult <= "11111111110111111111111111111111";
		wait for 100 ns;
          operando1 <= '1';
          operando2 <= '1';
          aluop <= "01001";
          aluResult <= "00000000000000000000000000000000";
	 	wait for 100 ns;
          operando1 <= '0';
          operando2 <= '0';
          aluop <= "10011";
          aluResult <= "11111111111111111111111111111111";
		wait for 100 ns;
          operando1 <= '0';
          operando2 <= '0';
          aluop <= "10011";
          aluResult <= "11111111111111111111111111111111";

      wait;
   end process;

END;