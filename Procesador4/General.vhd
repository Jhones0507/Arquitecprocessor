
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity General is
	  port(      CLK_g : in  STD_LOGIC;
			       RST_g : in STD_LOGIC;
			       Salida_MUX_Final: out STD_LOGIC_VECTOR (31 downto 0)
			);
end General;

architecture Behavioral of General is

   SIGNAL AUX1:		           STD_LOGIC_VECTOR (31 downto 0);
	SIGNAL AUX2:			        STD_LOGIC_VECTOR (31 downto 0);
	SIGNAL Salida_PC :   		  STD_LOGIC_VECTOR (31 downto 0);
	SIGNAL Salida_IM :           STD_LOGIC_VECTOR (31 downto 0);
	SIGNAL Salida_ALU	:          STD_LOGIC_VECTOR (31 downto 0);
	SIGNAL Salida_RS1 :          STD_LOGIC_VECTOR (31 downto 0);
	SIGNAL Salida_RS2 :          STD_LOGIC_VECTOR (31 downto 0);
	SIGNAL Salida_SEU, auxSalidaTotal :          STD_LOGIC_VECTOR (31 downto 0);
	SIGNAL Salida_MUX :          STD_LOGIC_VECTOR (31 downto 0);
   SIGNAL Salida_Control_Unit : STD_LOGIC_VECTOR (5 downto 0);
	SIGNAL W_REN: STD_LOGIC;
	SIGNAL out_nzvc : STD_LOGIC_VECTOR (3 downto 0);
	SIGNAL carry : STD_LOGIC_VECTOR (31 downto 0);
	SIGNAL cwp : STD_LOGIC_VECTOR (1 downto 0);
	SIGNAL ncwp : STD_LOGIC_VECTOR (1 downto 0);
	signal nrs1 : STD_LOGIC_VECTOR(5 downto 0);
   signal nrs2 : STD_LOGIC_VECTOR(5 downto 0);
   signal nrd :STD_LOGIC_VECTOR(5 downto 0);
	signal WRENMEM :STD_LOGIC;
	signal DataToReg : std_logic;
	signal CRSD :STD_LOGIC_VECTOR (31 downto 0);
	signal datoMem :STD_LOGIC_VECTOR(31 downto 0);
	signal SalidaFinal :STD_LOGIC_vector(31 downto 0);
	signal enableMem : std_logic;
   --SIGNAL OPESITO : STD_LOGIC_VECTOR (31 downto 0);

begin

Inst_Sumador: entity work.Sumador 
   PORT MAP(
		OPE1 => "00000000000000000000000000000001",      
		OPE2 => AUX1,
		RESULTADO => AUX2
	);
	
Inst_nPC: entity work.nPC 
   PORT MAP(
		nPC_in => AUX2,
		RST => RST_g,
		CLK => CLK_g,
		nPC_out => AUX1 
	);

Inst_PC: entity work.PC 
   PORT MAP(
		PC_in => AUX1,
		RST => RST_g,
		CLK => CLK_g,
		PC_out => Salida_PC
	);
	
Inst_IM: entity work.IM 
   PORT MAP(
		Address => Salida_PC,
		rst => rst_g,
		Instruction => Salida_IM
	);

Inst_Register_File: entity work.Register_File 
   PORT MAP(
		RS1 => nrs1,
		RS2 => nrs2,
		RD => nrd,
		DWR => SalidaFinal,
		RST => RST_g,
		CRS1 => Salida_RS1,
		WREN => W_REN,
		CRSD =>CRSD,
		CRS2 => Salida_RS2 
	);

Inst_MUX: entity work.MUX PORT MAP(
		Entrada1 => Salida_RS2,
		Entrada2 => Salida_SEU,
		i => Salida_IM(13),
		MUXOUT => Salida_MUX
	);

Inst_SEU: entity work.SEU PORT MAP(
		EntradaSEU => Salida_IM (12 downto 0),
		SalidaSEU => Salida_SEU
	);
	

Inst_Control_unit: entity work.Control_unit 
   PORT MAP(
		OP =>  Salida_IM (31 downto 30),
		OP3 => Salida_IM  (24 downto 19),
		WREN => W_REN,
		WRENMEM =>WRENMEM ,
		DataToReg=> DataToReg,
		ALUOP => Salida_Control_Unit
	);

Inst_ALU: entity work.ALU 
   PORT MAP(
		OPE1 => Salida_RS1,
		OPE2 => Salida_MUX,
		ALUOP => Salida_Control_Unit,
		c =>carry,
		ALURESULT => auxSalidaTotal
	);

Inst_PSR_Modifier: entity work.PSR_Modifier
    Port MAP( 
			  operando1 => Salida_RS1(31),
           operando2 => Salida_MUX(31),
           aluop => Salida_Control_Unit,
           aluResult => auxSalidaTotal,
           nzvc => out_nzvc
			 );
			 
Inst_PSR: entity work.PSR
    Port MAP( 
			  clk => CLK_g,
	        rst => RST_g,
			  nzvc => out_nzvc,
           carry_out => carry,
			  ncwp => ncwp,
			  cwp => cwp
			 );

Inst_Windows_manager: entity work.windows_manager
    Port MAP( 
			  op =>  Salida_IM (31 downto 30),
           op3 => Salida_IM  (24 downto 19),
           rs1 => Salida_IM(18 downto 14),
           rs2 => Salida_IM (4 downto 0),
           rd => Salida_IM (29 downto 25),
			  RST => RST_g,
           cwp => cwp,
           ncwp => ncwp,
           nrs1 => nrs1,
           nrs2 => nrs2,
           nrd => nrd
			 );

Inst_Data_Memory: entity work.Data_Memory
    Port MAP( 
			  WRENMEM => WRENMEM,
           rst => RST_g,
           crd => CRSD,
			  address => auxSalidaTotal,
			  datoMem => datoMem
			 );

Inst_MUX_final: entity work.MUX_final
    Port MAP( 
			  DataToReg => DataToReg,
           SalidaDataMemory =>datoMem,
           SalidaAlu => auxSalidaTotal,
           SalidaFinal => SalidaFinal
			 );
			 
		Salida_MUX_Final <=SalidaFinal;


end Behavioral;

