library IEEE;
use IEEE.std_logic_1164.all;
entity MPA is
port (CLK: in STD_LOGIC;
Reset: in std_logic;
FC, bit_out: out std_logic;
DataBus: inout std_logic_vector (7 downto 0));
end MPA;
architecture MPA of MPA is
--
component Add
port (Inc: in STD_LOGIC;
Reset: in STD_LOGIC;
SIn: in std_logic_vector (5 downto 0);
SOut: out std_logic_vector (5 downto 0));
end component;
--
component ALU
port (A: in std_logic_vector (7 downto 0);
B: in std_logic_vector (7 downto 0);
CLK: in std_logic;
SADD: in std_logic;
FC: out std_logic;
FZ: out std_logic;
Q: out std_logic_vector (7 downto 0));
end component;
--
component CAR
port (CarIn: in std_logic;
D: in std_logic_vector (5 downto 0);
CarOut: out STD_LOGIC;
Q: out std_logic_vector (5 downto 0));
end component;
--
component CBR
port (CbrIn: in std_logic;
InstrCom: in std_logic_vector (0 to 27);
Adr: out std_logic_vector (5 downto 0);
CS: out STD_LOGIC;
IncPC: out STD_LOGIC;
Instr0: out std_logic;
Instr1: out std_logic;
Instr2: out std_logic;
Inv: out STD_LOGIC;
InvZ: out STD_LOGIC;
IrIn: out std_logic;
MarIn: out STD_LOGIC;
MbrIn: out STD_LOGIC;
MbrInD: out STD_LOGIC;
MbrOut: out STD_LOGIC;
MbrOutD: out STD_LOGIC;
PCin: out STD_LOGIC;
RAIn: out STD_LOGIC;
RDCIn: out STD_LOGIC;
RIn: out STD_LOGIC;
ROut: out STD_LOGIC;
RdWr: out STD_LOGIC;
RzIn: out STD_LOGIC;
RzOut: out STD_LOGIC;
SADD: out STD_LOGIC);
end component;
--
component DC1
port (Ale: in STD_LOGIC;
Com: in std_logic_vector (7 downto 0);
ComAdr: out std_logic_vector (5 downto 0));
end component;
--
component INV
port (DIn: in std_logic_vector (7 downto 0);
Inv: in std_logic;
DOut: out std_logic_vector (7 downto 0));
end component;
--
component IR
port (Command: in std_logic_vector (7 downto 0);
IRin: in std_logic;
Reset: in std_logic;
Com: out std_logic_vector (7 downto 0);
IrOut: out STD_LOGIC);
end component;
--
component LogAnd
port (in1: in std_logic;
in2: in std_logic;
Sout: out std_logic);
end component;
--
component LogOR
port (in1: in std_logic;
in2: in std_logic;
SOut: out std_logic);
end component;
--
component MAR
port (AdrIn: in std_logic_vector (7 downto 0);
CLK: in std_logic;
MarIn: in std_logic;
RST: in std_logic;
AdrOut: out std_logic_vector (7 downto 0));
end component;
--
component MBR
port (CLK: in STD_LOGIC;
MbrIn: in STD_LOGIC;
MbrInD: in STD_LOGIC;
MbrOut: in STD_LOGIC;
MbrOutD: in STD_LOGIC;
RST: in STD_LOGIC;
DataIn: inout STD_LOGIC_VECTOR (7 downto 0);
DataOut: inout STD_LOGIC_VECTOR (7 downto 0));
end component;
--
component Memory
port (Adr: in std_logic_vector (5 downto 0);
RD: in std_logic;
InstrCom: out std_logic_vector (0 to 27);
MrOut: out STD_LOGIC);
end component;
--
component MUX
port (Adr0: in std_logic;
Adr1: in std_logic;
CLK: in STD_LOGIC;
IN1: in std_logic_vector (5 downto 0);
IN2: in std_logic_vector (5 downto 0);
IN3: in std_logic_vector (5 downto 0);
MuxOut: out STD_LOGIC;
OUT1: out std_logic_vector (5 downto 0));
end component;
--
component PC
port (AdrIn: in STD_LOGIC_VECTOR (7 downto 0);
CLK: in STD_LOGIC;
IncPC: in STD_LOGIC;
PCIn: in STD_LOGIC;
RST: in STD_LOGIC;
AdrOut: out STD_LOGIC_VECTOR (7 downto 0));
end component;
--
component R0
port (C: in STD_LOGIC;
CLK: in std_logic;
DataIn: in std_logic_vector (7 downto 0);
RIn: in std_logic;
ROut: in std_logic;
RST: in std_logic;
DataOut: out std_logic_vector (7 downto 0));
end component;
--
component RA
port (
CLK: in STD_LOGIC;
DIn: in std_logic_vector (7 downto 0);
RAIn: in std_logic;
DOut: out std_logic_vector (7 downto 0));
end component;
--
component RAM
port (Adr: in STD_LOGIC_VECTOR (7 downto 0);
CS: in STD_LOGIC;
RdWr: in STD_LOGIC;
Data: inout STD_LOGIC_VECTOR (7 downto 0));
end component;
--
component RDC
port (Number: in std_logic_vector (7 downto 0);
RDCIn: in std_logic;
R1: out std_logic;
R2: out std_logic;
R3: out std_logic;
R4: out std_logic);
end component;
--
component RZ
port (CLK: in STD_LOGIC;
DIn: in STD_LOGIC_VECTOR (7 downto 0);
InvZ: in STD_LOGIC;
RST: in STD_LOGIC;
RZIn: in STD_LOGIC;
RZOut: in STD_LOGIC;
DOut: out STD_LOGIC_VECTOR (7 downto 0));
end component;
--
component R_1bit is
port (reg_in, IE: in std_logic;
CLK, Zero:in std_logic;
reg_out: out std_logic);
end component;
--
signal CS, IncPC, IrIn, MarIn, MbrIn, MbrOut, JB: STD_LOGIC;
signal S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, SR1, SR2, SR3, SR4: STD_LOGIC;
signal N1, N2, N3, FC_sig, bit_outs: STD_LOGIC;
signal PCIN, RaIn, RDCIn, RdWr, RIn, ROut, RzIn, RzOut, SADD: STD_LOGIC;
signal Adr: std_logic_vector (7 downto 0);
signal BUS2, BUS6, BUS7, BUS8, BUS11: std_logic_vector (5 downto 0);
signal BUS10: std_logic_vector (27 downto 0);
signal BUS0, BUS1, BUS3, BUS4, BUS5: std_logic_vector (7 downto 0);
signal MemOut: STD_LOGIC_VECTOR (7 downto 0);
--
begin
DD0: IR port map (Com => BUS1, Command => DataBus, IRin => IrIn, IrOut => S3,
Reset => Reset);
DD1: LogAnd port map (Sout => S5, in1 => bit_outs, in2 =>S4);
DD2: MAR port map (AdrIn => BUS0, AdrOut => Adr, CLK => CLK, MarIn => MarIn,
RST => Reset);
DD3: RAM port map (Adr => Adr, CS => CS, Data => MemOut, RdWr => RdWr);
DD4: MBR port map (CLK => CLK, DataIn => MemOut, DataOut => DataBus,
MbrIn => MbrIn, MbrInD => S6, MbrOut => MbrOut,
MbrOutD => S7, RST => Reset);
DD5: R0 port map (C => SR1, CLK => CLK, DataIn => DataBus, DataOut => DataBus,
RIn => RIn, ROut => ROut, RST => Reset);
DD6: R0 port map (C => SR2, CLK => CLK, DataIn => DataBus, DataOut => DataBus,
RIn => RIn, ROut => ROut, RST => Reset);
DD7: R0 port map (C => SR3, CLK => CLK, DataIn => DataBus, DataOut => DataBus,
RIn => RIn, ROut => ROut, RST => Reset);
DD8: R0 port map (C => SR4, CLK => CLK, DataIn => DataBus, DataOut => DataBus,
RIn => RIn, ROut => ROut, RST => Reset);
DD9: RA port map (CLK => CLK, DIn => DataBus, DOut => BUS3, RAIn => RaIn);
DD10: ALU port map (A => BUS4, B => DataBus, CLK => CLK, FC => FC_sig, FZ => S1,
Q => BUS5, SADD => SADD);
DD11: DC1 port map (Ale => S3, Com => BUS1, ComAdr => BUS2);
DD12: RZ port map (CLK => CLK, DIn => BUS5, DOut => DataBus, InvZ => JB,
RST => Reset, RZIn => RzIn, RZOut => RzOut);
DD13: INV port map (DIn => BUS3, DOut => BUS4, Inv => S2);
DD14: RDC port map (Number => DataBus, R1 => SR1, R2 => SR2, R3 => SR3,
R4 => SR4, RDCIn => RDCIn);
DD15: MUX port map (Adr0 => S9, Adr1 => S10, CLK => CLK, IN1 => BUS11,
IN2 => BUS2, IN3 => BUS6, MuxOut => N2, OUT1 => BUS7);
DD16: Add port map (Inc => N2, Reset => Reset, SIn => BUS7, SOut => BUS11);
DD17: CAR port map (CarIn => CLK, CarOut => N3, D => BUS7, Q => BUS8);
DD18: Memory port map (Adr => BUS8, InstrCom => BUS10, MrOut => N1, RD => N3);
DD19: CBR port map (Adr => BUS6, CS => CS, CbrIn => N1, IncPC => IncPC, Instr0 => S8,
Instr1 => S4, Instr2 => S10,	InstrCom => BUS10, Inv => S2, InvZ => JB, IrIn => IrIn,
MarIn => MarIn, MbrIn => MbrIn, MbrInD => S6, MbrOut => MbrOut, MbrOutD => S7,
PCin => PCIN, RAIn => RaIn, RDCIn => RDCIn, Rin => RIn, ROut => ROut,
RdWr => RdWr,
RzIn => RzIn, RzOut => RzOut, SADD => SADD);
DD20: PC port map (AdrIn => DataBus, AdrOut => BUS0, CLK => CLK, IncPC => IncPC,
PCIn => PCIN, RST => Reset);
DD21: LogOR port map (SOut => S9, in1 => S5, in2 => S8);
DD22: R_1bit port map (CLK => CLK, reg_in =>FC_sig, reg_out => bit_outs, IE =>RzIn,
Zero=>S5);	
FC<=FC_sig;
bit_out<=bit_outs;
end MPA;
