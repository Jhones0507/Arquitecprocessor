library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity uc is
    Port ( 
				  op : in  STD_LOGIC_VECTOR (1 downto 0);
				  op2 : in  STD_LOGIC_VECTOR (2 downto 0);
				  icc : in  STD_LOGIC_VECTOR (3 downto 0);
				  cond : in  STD_LOGIC_VECTOR (3 downto 0);
				  op3 : in  STD_LOGIC_VECTOR (5 downto 0);
				  DATATORF_out : out  STD_LOGIC_VECTOR (1 downto 0);
				  WRENRF_out : out  STD_LOGIC;
				  RFsource : out  STD_LOGIC;
				  WRENMEM_out : out  STD_LOGIC;
				  PCsource : out  STD_LOGIC_VECTOR (1 downto 0);
				  aluop : out  STD_LOGIC_VECTOR (5 downto 0)
			);
end uc;

architecture Behavioral of uc is

begin
process (op,op2,icc,cond,op3)
begin 
case(op) is
	when("10") =>
		case(op3) is
			when "000000" => -- ADD
				aluop <= "000000";
				WRENRF_out <= '1';
				WRENMEM_out <= '0';
				RFsource <= '0';
				PCsource <= "00";
				DATATORF_out <= "00";	
			when "000010" => -- OR
				aluop  <= "000010";
				WRENRF_out <= '1';
				WRENMEM_out <= '0';
				RFsource <= '0';
				PCsource <= "00";
				DATATORF_out <= "00";
			when "000100" => -- SUB
				aluop  <= "000100";
				WRENRF_out <= '1';
				WRENMEM_out <= '0';
				RFsource <= '0';
				PCsource <= "00";
				DATATORF_out <= "00";
			when "000001" => -- AND
				aluop  <= "000001";
				WRENRF_out <= '1';
				WRENMEM_out <= '0';
				RFsource <= '0';
				PCsource <= "00";
			when "000101" => -- NAND
				aluop  <= "000101";
				WRENRF_out <= '1';
				WRENMEM_out <= '0';
				RFsource <= '0';
				PCsource <= "00";
				DATATORF_out <= "00";
			when "000110" => -- ORN
				aluop  <= "000110";
				WRENRF_out <= '1';
				WRENMEM_out <= '0';
				RFsource <= '0';
				PCsource <= "00";
				DATATORF_out <= "00";
			when "000011" => -- XOR
				aluop  <= "000011";
				WRENRF_out <= '1';
				WRENMEM_out <= '0';
				RFsource <= '0';
				PCsource <= "00";
				DATATORF_out <= "00";
			when "000111" => -- XNOR
				aluop  <= "000111";
			when "010000"=>--addcc
				aluop <= "010000";
				WRENRF_out <= '1';
				WRENMEM_out <= '0';
				RFsource <= '1';
				PCsource <= "00";
				DATATORF_out <= "00";
			when "011000"=>--addxcc
				aluop <= "011000";
				WRENRF_out <= '1';
				WRENMEM_out <= '0';
				RFsource <= '1';
				PCsource <= "00";
				DATATORF_out <= "00";
			when "001000"=>--addx
				aluop <= "001000";
				WRENRF_out <= '1';
				WRENMEM_out <= '0';
				RFsource <= '1';
				PCsource <= "00";
				DATATORF_out <= "00";
			when "010001"=>--andcc
				aluop <= "010001";
				WRENRF_out <= '1';
				WRENMEM_out <= '0';
				RFsource <= '1';
				PCsource <= "00";
				DATATORF_out <= "00";
			when "010010"=>--orcc
				aluop <= "010010";
				WRENRF_out <= '1';
				WRENMEM_out <= '0';
				RFsource <= '1';
				PCsource <= "00";
				DATATORF_out <= "00";
			when "010100"=>--subcc
				aluop <= "010100";
				WRENRF_out <= '1';
				WRENMEM_out <= '0';
				RFsource <= '1';
				PCsource <= "00";
				DATATORF_out <= "00";
			when "011100"=>--subxcc
				aluop <= "011100";
				WRENRF_out <= '1';
				WRENMEM_out <= '0';
				RFsource <= '0';
				PCsource <= "00";
				DATATORF_out <= "00";
			when "010011"=>--xorcc
				aluop <= "010011";
				WRENRF_out <= '1';
				WRENMEM_out <= '0';
				RFsource <= '1';
				PCsource <= "00";
				DATATORF_out <= "00";
			when "010110"=>--norcc
				aluop <= "010110";
				WRENRF_out <= '1';
				WRENMEM_out <= '0';
				RFsource <= '1';
				PCsource <= "00";
				DATATORF_out <= "00";
			when "010111"=>--xnorcc
				aluop <= "010111";
				WRENRF_out <= '1';
				WRENMEM_out <= '0';
				RFsource <= '1';
				PCsource <= "00";
				DATATORF_out <= "00";
			when "010101"=>--nandcc
				aluop <= "000101";
				WRENRF_out <= '1';
				WRENMEM_out <= '0';
				RFsource <= '1';
				PCsource <= "00";
				DATATORF_out <= "00";
			when("111100") => --Save
				aluop <= "000000";
				WRENRF_out <= '1';
				WRENMEM_out <= '0';
				RFsource <= '1';
				PCsource <= "00";
				DATATORF_out <= "00";
			when("111101") => --Restore
				aluop <= "000000";
				WRENRF_out <= '1';
				WRENMEM_out <= '0';
				RFsource <= '1';
				PCsource <= "00";
				DATATORF_out <= "00";
			when("111000") => --JMPL
				aluop <= "000000";
				WRENRF_out <= '1';
				WRENMEM_out <= '0';
				RFsource <= '1';
				PCsource <= "01";
				DATATORF_out <= "10";
			when others =>
				aluop  <= "000000";
				WRENRF_out <= '0';
				WRENMEM_out <= '0';
				RFsource <= '1';
				PCsource <= "00";
				DATATORF_out <= "00";
		end case;
	when("11") =>
		case (op3) is
		when("000000") => --Load
				aluop <= "000000";
				WRENRF_out <= '1';
				WRENMEM_out <= '0';
				RFsource <= '1';
				PCsource <= "00";
				DATATORF_out <= "01";
		when("000100") => --Store
				aluop <= "000000";
				WRENRF_out <= '0';
				WRENMEM_out <= '1';
				RFsource <= '1';
				PCsource <= "00";	
		when others =>
				aluop <= "111111";
				WRENRF_out <= '0';
				WRENMEM_out <= '0';
				RFsource <= '1';
				PCsource <= "00";
				DATATORF_out <= "00";
	end case;
when("01") => --Call
		aluop <= "111111";
		WRENRF_out <= '1';
		WRENMEM_out <= '0';
		RFsource <= '1';
		PCsource <= "10";
		DATATORF_out <= "10";
	when("00") =>
					case (op2) is
						when("010") => --Branch
							case (cond) is
								when("1000") => --Branch Always
										aluop <= "111111";
										WRENRF_out <= '0';
										WRENMEM_out <= '0';
										RFsource <= '1';
										PCsource <= "11";
								when("0000") => --Branch Never
										aluop <= "111111";
										WRENRF_out <= '0';
										WRENMEM_out <= '0';
										RFsource <= '1';
										PCsource <= "00";
								when("1001") => --Branch on Not Equal
										if(not(icc(2)) = '1')then -- not z
											aluop <= "111111";
											WRENRF_out <= '0';
											WRENMEM_out <= '0';
											RFsource <= '1';
											PCsource <= "11";
										else
											aluop <= "111111";
											WRENRF_out <= '0';
											WRENMEM_out <= '0';
											RFsource <= '1';
											PCsource <= "00";
										end if;
								when("0001") => --Branch on Equal
										if(icc(2) = '1')then --z
											aluop<= "111111";
											WRENRF_out <= '0';
											WRENMEM_out <= '0';
											RFsource <= '1';
											PCsource <= "11";
										else
											aluop <= "111111";
											WRENRF_out <= '0';
											WRENMEM_out <= '0';
											RFsource <= '1';
											PCsource <= "00";
										end if;
								when("1010") => --Branch on Greater
										if((not(icc(2) or (icc(3) xor icc(1)))) = '1')then -- not(z or (n xor v))
											aluop <= "111111";
											WRENRF_out <= '0';
											WRENMEM_out <= '0';
											RFsource <= '1';
											PCsource <= "11";
										else
											aluop <= "111111";
											WRENRF_out <= '0';
											WRENMEM_out <= '0';
											RFsource <= '1';
											PCsource <= "00";
										end if;
								when("0010") => --Branch on Less or Equal
										if((icc(2) or (icc(3) xor icc(1))) = '1')then --z or (n xor v)
											aluop <= "111111";
											WRENRF_out <= '0';
											WRENMEM_out <= '0';
											RFsource <= '1';
											PCsource <= "11";
										else
											aluop <= "111111";
											WRENRF_out <= '0';
											WRENMEM_out <= '0';
											RFsource <= '1';
											PCsource <= "00";
										end if;
								when("1011") => --Branch on Greater or Equal
										if((not(icc(3) xor icc(1))) = '1')then --not(n xor v)
											aluop <= "111111";
											WRENRF_out <= '0';
											WRENMEM_out <= '0';
											RFsource <= '1';
											PCsource <= "11";
										else
											aluop <= "111111";
											WRENRF_out <= '0';
											WRENMEM_out <= '0';
											RFsource <= '1';
											PCsource <= "00";
										end if;
								when("0011") => --Branch on Less
										if((icc(3) xor icc(1)) = '1')then --(n xor v)
											aluop <= "111111";
											WRENRF_out <= '0';
											WRENMEM_out <= '0';
											RFsource <= '1';
											PCsource <= "11";
										else
											aluop <= "111111";
											WRENRF_out <= '0';
											WRENMEM_out <= '0';
											RFsource <= '1';
											PCsource <= "00";
										end if;
								when("1110") => --Branch on Positive
										if(not(icc(3)) = '1')then --not n
											aluop <= "111111";
											WRENRF_out <= '0';
											WRENMEM_out <= '0';
											RFsource <= '1';
											PCsource <= "11";
										else
											aluop <= "111111";
											WRENRF_out <= '0';
											WRENMEM_out <= '0';
											RFsource <= '1';
											PCsource <= "00";
										end if;
								when("0110") => --Branch on Negative
										if(icc(3) = '1')then --n
											aluop <= "111111";
											WRENRF_out <= '0';
											WRENMEM_out <= '0';
											RFsource <= '1';
											PCsource <= "11";
										else
											aluop <="111111";
											WRENRF_out <= '0';
											WRENMEM_out <= '0';
											RFsource <= '1';
											PCsource <= "00";
										end if;
								when("1111") => --Branch on Overflow Clear
										if(not(icc(1)) = '1')then --not v
											aluop <= "111111";
											WRENRF_out <= '0';
											WRENMEM_out <= '0';
											RFsource <= '1';
											PCsource <= "11";
										else
											aluop <= "111111";
											WRENRF_out <= '0';
											WRENMEM_out <= '0';
											RFsource <= '1';
											PCsource <= "00";
										end if;
								when("0111") => --Branch on Overflow Set
										if(icc(1) = '1')then --v
											aluop <= "111111";
											WRENRF_out <= '0';
											WRENMEM_out <= '0';
											RFsource <= '1';
											PCsource <= "11";
										else
											aluop <= "111111";
											WRENRF_out <= '0';
											WRENMEM_out <= '0';
											RFsource <= '1';
											PCsource <= "00";
										end if;
								when others =>
										aluop <= "111111";
										WRENRF_out <= '0';
										WRENMEM_out <= '0';
										RFsource <= '1';
										PCsource <= "01";
										DATATORF_out <= "00";
							end case;
						when("100") => --Nop
								aluop <= "111111";
								WRENRF_out <= '0';
								WRENMEM_out <= '0';
								RFsource <= '1';
								PCsource <= "00";
								DATATORF_out <= "00";
						when others =>
								aluop <= "111111";
								WRENRF_out <= '0';
								WRENMEM_out <= '0';
								RFsource <= '1';
								PCsource <= "00";
								DATATORF_out <= "00";
					end case;
				when others =>
						aluop <= "111111";
						WRENRF_out <= '0';
						WRENMEM_out <= '0';
						RFsource <= '1';
						PCsource <= "00";
						DATATORF_out <= "00";
			
		end case;
 
end process;

end Behavioral;

