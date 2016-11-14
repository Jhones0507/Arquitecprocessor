library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity ProcesadorCompleto is
    Port ( 
				  Clk : in  STD_LOGIC;
				  Reset : in  STD_LOGIC;
				  Aluresult : out  STD_LOGIC_VECTOR (31 downto 0)
			);
end ProcesadorCompleto;

architecture Behavioral of ProcesadorCompleto is

COMPONENT uc
 PORT(
 op : IN std_logic_vector(1 downto 0);
 op2 : IN std_logic_vector(2 downto 0);
 icc : IN std_logic_vector(3 downto 0);
 cond : IN std_logic_vector(3 downto 0);
 op3 : IN std_logic_vector(5 downto 0); 
 DATATORF_out : OUT std_logic_vector(1 downto 0);
 WRENRF_out : OUT std_logic;
 RFsource : OUT std_logic;
 WRENMEM_out : OUT std_logic;
 PCsource : OUT std_logic_vector(1 downto 0);
 aluop : OUT std_logic_vector(5 downto 0)
 );
END COMPONENT;
COMPONENT ALU
 PORT(
 operando1 : IN std_logic_vector(31 downto 0);
 operando2 : IN std_logic_vector(31 downto 0);
 aluOp : IN std_logic_vector(5 downto 0);
 carry: IN std_logic;
 AluResult : OUT std_logic_vector(31 downto 0)
 );
 END COMPONENT;
COMPONENT PC
 PORT(
 clkFPGA : IN std_logic;
 reset : IN std_logic;
 address : IN std_logic_vector(31 downto 0);
 nextInstruction : OUT std_logic_vector(31 downto 0)
 );
 END COMPONENT;
 
 COMPONENT RegisterFile
 PORT(
 Reset : IN std_logic;
 rs1 : IN std_logic_vector(5 downto 0);
 rs2 : IN std_logic_vector(5 downto 0);
 rd : IN std_logic_vector(5 downto 0);
 DWR : IN std_logic_vector(31 downto 0);
 writeEnable : IN std_logic;
 Crs1 : OUT std_logic_vector(31 downto 0);
 Crs2 : OUT std_logic_vector(31 downto 0);
 CRd : OUT std_logic_vector (31 downto 0)
 );
 END COMPONENT; 
COMPONENT Sumador1
 PORT(
 op1 : IN std_logic_vector(31 downto 0);
 op2 : IN std_logic_vector(31 downto 0);
 outa : OUT std_logic_vector(31 downto 0)
 );
 END COMPONENT;
 
COMPONENT instructionMemory
 PORT(
 address : IN std_logic_vector(31 downto 0);
 reset : IN std_logic;
 outInstruction : OUT std_logic_vector(31 downto 0)
 );
 END COMPONENT;
 
COMPONENT nPc
 PORT(
 address : IN std_logic_vector(31 downto 0);
 clkFPGA : IN std_logic;
 reset : IN std_logic;
 nextInstruction : OUT std_logic_vector(31 downto 0)
 );
 END COMPONENT;
 
COMPONENT Mux
 PORT(
 Crs2 : IN std_logic_vector(31 downto 0);
 SEUOperando : IN std_logic_vector(31 downto 0);
 selImmediate : IN std_logic_vector(0 downto 0);
 OperandoALU : OUT std_logic_vector(31 downto 0)
 );
 END COMPONENT;
 
COMPONENT SignExtensionUnit
 PORT(
 simm13 : IN std_logic_vector(12 downto 0);
 simm32 : OUT std_logic_vector(31 downto 0)
 );
 END COMPONENT;
 
 
COMPONENT PSR
 PORT(
 clk : IN std_logic;
 reset : IN std_logic;
 nzvc : IN std_logic_vector(3 downto 0);
 nCWP : IN std_logic_vector(1 downto 0);
 CWP : OUT std_logic_vector(1 downto 0);
 carry : OUT std_logic;
 icc : OUT std_logic_vector(3 downto 0)
 );
 END COMPONENT;
 
COMPONENT PSRModifier
 PORT(
 aluResult : IN std_logic_vector(31 downto 0);
 operando1 : IN std_logic_vector(31 downto 0);
 operando2 : IN std_logic_vector(31 downto 0);
 aluOp : IN std_logic_vector(5 downto 0);
 nzvc : OUT std_logic_vector(3 downto 0)
 );
 END COMPONENT;
 
 COMPONENT muxWm
 PORT(
 ct : IN std_logic;
 rd : IN std_logic_vector(5 downto 0);
 fifteen : IN std_logic_vector(5 downto 0); 
 nrd : OUT std_logic_vector(5 downto 0)
 );
 END COMPONENT;
 
 COMPONENT windowManager
 PORT(
 op : IN std_logic_vector(1 downto 0);
 op3 : IN std_logic_vector(5 downto 0);
 cwp : IN std_logic_vector(1 downto 0);
 registerSource1 : IN std_logic_vector(4 downto 0);
 registerSource2 : IN std_logic_vector(4 downto 0);
 registerDestination : IN std_logic_vector(4 downto 0); 
 ncwp : OUT std_logic_vector(1 downto 0);
 newRegisterSource1 : OUT std_logic_vector(5 downto 0);
 newRegisterSource2 : OUT std_logic_vector(5 downto 0);
 newRegisterDestination : OUT std_logic_vector(5 downto 0);
 registroO7 : OUT std_logic_vector(5 downto 0)
 );
 END COMPONENT;
 
COMPONENT SEU2
 PORT(
 simm22 : IN std_logic_vector(21 downto 0); 
 simm32 : OUT std_logic_vector(31 downto 0)
 );
 END COMPONENT;
 
 COMPONENT mux_NPC
 PORT(
 PCD30 : IN std_logic_vector(31 downto 0);
 PCD22 : IN std_logic_vector(31 downto 0);
 PCAdress : IN std_logic_vector(31 downto 0);
 PCsource : IN std_logic_vector(1 downto 0);
 PC_in : IN std_logic_vector(31 downto 0); 
 PCAdress_out : OUT std_logic_vector(31 downto 0)
 );
 END COMPONENT;
 
COMPONENT DataMemory
 PORT(
 crd : IN std_logic_vector(31 downto 0);
 reset : IN std_logic;
 
 ALUAdress : IN std_logic_vector(31 downto 0);
 WRENMEM : IN std_logic;
 DATAMEM : OUT std_logic_vector(31 downto 0)
 );
 END COMPONENT;
 
COMPONENT sumador3
 PORT(
 PC : IN std_logic_vector(31 downto 0);
 SEU22 : IN std_logic_vector(31 downto 0);
 outa : OUT std_logic_vector(31 downto 0)
 );
 END COMPONENT;
COMPONENT Sumador2
 PORT(
 PC : IN std_logic_vector(31 downto 0);
 DISP30 : IN std_logic_vector(31 downto 0);
 outa : OUT std_logic_vector(31 downto 0)
 );
 END COMPONENT;
COMPONENT muxRFSource
 PORT(
 DATAMEM_in : IN std_logic_vector(31 downto 0);
 ALUResult_in : IN std_logic_vector(31 downto 0);
 DATATORF : IN std_logic_vector(1 downto 0);
 PC_in : IN std_logic_vector(31 downto 0);
 ALUResult_out : OUT std_logic_vector(31 downto 0)
 );
 END COMPONENT;
 
 signal mux1_out : std_logic_vector(31 downto 0);
signal sum_out : std_logic_vector(31 downto 0);
signal nPC_out : std_logic_vector(31 downto 0) ;
signal PC_out : std_logic_vector(31 downto 0) ;
signal IM_out : std_logic_vector(31 downto 0) ;
signal CU_out : std_logic_vector(5 downto 0);
signal CRs1 : std_logic_vector(31 downto 0) ;
signal CRs2 : std_logic_vector(31 downto 0) ;
signal salida : std_logic_vector(31 downto 0) ;
signal SEU_to_MUX: std_logic_vector(31 downto 0);
signal MUX_to_ALU: std_logic_vector(31 downto 0);
signal nvzc : std_logic_vector(3 downto 0);
signal salida_out : std_logic;
signal srfdest : std_logic;
signal scwp : std_logic_vector (1 downto 0);
signal smcwp : std_logic_vector (1 downto 0);
signal wm_outrs1 : std_logic_vector (5 downto 0);
signal wm_outrs2 : std_logic_vector (5 downto 0);
signal wm_outrd : std_logic_vector (5 downto 0);
signal wm_out7 : std_logic_vector (5 downto 0);
signal snrd : std_logic_vector (5 downto 0);
signal RF_to_DM: std_logic_vector(31 downto 0);
signal CU_to_RF: std_logic;
signal CU_to_DM: std_logic;
signal DM_to_MUX2: std_logic_vector(31 downto 0);
signal CU_to_MUX2: std_logic_vector(1 downto 0);
signal ResSuma3_to_MUX4: std_logic_vector(31 downto 0);
signal SEU3_to_Suma3: std_logic_vector(31 downto 0);
signal ResSuma2_to_MUX4: std_logic_vector(31 downto 0);
signal CU_to_MUX4: std_logic_vector(1 downto 0);
signal CU_to_PSR: std_logic_vector(3 downto 0);
signal salidamux2: std_logic_vector(31 downto 0);
signal CU_to_MUX3: std_logic;
signal wmout7: std_logic_vector (5 downto 0);

begin
 
Instr_nPc: nPc PORT MAP (
          address => mux1_out,
          clkFPGA => Clk,
          reset => Reset,
          nextInstruction =>nPC_out
        );
		  
Instr_PC: PC PORT MAP (
          clkFPGA => Clk,
          reset => Reset,
          address => nPC_out, 
          nextInstruction => PC_out
        );		  
Instr_sum1: Sumador1 PORT MAP (
          op1 => "00000000000000000000000000000001",
          op2 => nPC_out,
          outa => sum_out
        );
Instr_Memory: instructionMemory PORT MAP (
          address => PC_out,
          reset => Reset,
          outInstruction => IM_out
        );	
Inst_uc: uc PORT MAP(
		op => IM_out(31 downto 30),
		op2 => IM_out(24 downto 22),
		icc =>CU_to_PSR,
		cond => IM_out(28 downto 25),
		op3 => IM_out(24 downto 19),
		DATATORF_out =>CU_to_MUX2,
		WRENRF_out => CU_to_RF,
		RFsource => CU_to_MUX3,
		WRENMEM_out =>CU_to_DM,
		PCsource => CU_to_MUX4,
		aluop => CU_out
	);
		  
Inst_windowManager: windowManager PORT MAP(
		op => IM_out(31 downto 30),
		op3 => IM_out(24 downto 19),
		cwp => scwp,
		registerSource1 => IM_out(18 downto 14),
		registerSource2 => IM_out(4 downto 0),
		registerDestination => IM_out(29 downto 25),
		ncwp => smcwp,
		newRegisterSource1 => wm_outrs1,
		newRegisterSource2 => wm_outrs2,
		newRegisterDestination => wm_outrd,
		registroO7 => wmout7
	);
	
Inst_muxWm: muxWm PORT MAP(
		ct => CU_to_MUX3,
		rd =>wm_outrd,
		fifteen => wmout7,
		nrd => snrd
	);
 
 
Instr_RE: RegisterFile PORT MAP (
			 
          Reset => Reset,
          rs1 => wm_outrs1,
          rs2 => wm_outrs2,
          rd => snrd,
          DWR => salidamux2,
          Crs1 => CRs1,
          Crs2 => CRs2,
          writeEnable => CU_to_RF ,
			 CRd=>RF_to_DM
        );
		  
Instr_ALU: ALU PORT MAP (
          operando1 =>CRs1, 
          operando2 => MUX_to_ALU,
          aluOp => CU_out,
          AluResult => salida,
			 carry =>salida_out
        );	
 
 Instr_SE: SignExtensionUnit PORT MAP (
          simm13 => IM_out(12 downto 0),
          simm32 => SEU_to_MUX
        );
		  
Instr_MUX: Mux PORT MAP (
          Crs2 => CRs2,
          SEUOperando => SEU_to_MUX,
          selImmediate =>IM_out(13 downto 13), 
          OperandoALU => MUX_to_ALU
        );	
 
Instr_PSR: PSR PORT MAP (
          clk => Clk,
          reset =>reset,
          nzvc => nvzc,
          carry => salida_out,
          nCWP =>smcwp ,
          CWP => scwp,
			 icc =>CU_to_PSR
          
        );		  
Instr_PSRM: PSRModifier PORT MAP (
          aluResult =>salida, 
          operando1 =>CRs1,
          operando2 =>MUX_to_ALU, 
          aluOp => CU_out, 
          nzvc =>nvzc 
        );
 
Instr_DataM: DataMemory PORT MAP (
          crd =>RF_to_DM ,
          reset => Reset,
			 
          ALUAdress =>salida ,
          WRENMEM =>CU_to_DM,
          DATAMEM =>DM_to_MUX2
			 
        );  
Instr_sum3: sumador3 PORT MAP (
          PC =>SEU3_to_Suma3,
          SEU22 =>PC_out ,
          outa =>ResSuma2_to_MUX4
        );	
Instr_suma2: Sumador2 PORT MAP (
          PC =>PC_out,
          DISP30 =>SEU3_to_Suma3 ,
          outa =>ResSuma3_to_MUX4
        );
Instr_Mux2: muxRFSource PORT MAP (
          DATAMEM_in =>DM_to_MUX2 ,
          ALUResult_in =>salida ,
          DATATORF =>CU_to_MUX2 ,
          PC_in =>PC_out ,
          ALUResult_out =>salidamux2
        );		  
Instr_SEU2: SEU2 PORT MAP (
          simm22 =>IM_out(21 downto 0) ,
          simm32 =>SEU3_to_Suma3
			 
        );	
		  
Instr_Mux4: mux_NPC PORT MAP (
          PCD30 =>ResSuma3_to_MUX4 ,
          PCD22 =>ResSuma2_to_MUX4 ,
          PCAdress =>salida ,
          PCsource =>CU_to_MUX4 ,
          PC_in =>sum_out ,
          PCAdress_out =>mux1_out
        );
		  
Aluresult <= salidamux2;
end Behavioral;

