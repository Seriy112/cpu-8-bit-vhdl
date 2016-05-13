-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : s
-- Author      : Microsoft
-- Company     : Microsoft
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\s\s\compile\mpa.vhd
-- Generated   : Fri May 13 01:12:58 2016
-- From        : c:\My_Designs\s\s\src\mpa.bde
-- By          : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library ieee;
        use ieee.std_logic_1164.all;

entity mpa is
  port(
       CLK : in std_logic;
       Reset : in std_logic;
       FC : out std_logic;
       bit_out : out std_logic;
       DataBus : inout std_logic_vector(7 downto 0)
  );
end mpa;

architecture MPA of mpa is

---- Component declarations -----

component Add
  port (
       Inc : in STD_LOGIC;
       Reset : in STD_LOGIC;
       SIn : in STD_LOGIC_VECTOR(5 downto 0);
       SOut : out STD_LOGIC_VECTOR(5 downto 0)
  );
end component;
component ALU
  port (
       A : in STD_LOGIC_VECTOR(7 downto 0);
       B : in STD_LOGIC_VECTOR(7 downto 0);
       CLK : in STD_LOGIC;
       SADD : in STD_LOGIC;
       FC : out STD_LOGIC;
       FZ : out STD_LOGIC;
       Q : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;
component CAR
  port (
       CarIn : in STD_LOGIC;
       D : in STD_LOGIC_VECTOR(5 downto 0);
       CarOut : out STD_LOGIC;
       Q : out STD_LOGIC_VECTOR(5 downto 0)
  );
end component;
component CBR
  port (
       CbrIn : in STD_LOGIC;
       InstrCom : in STD_LOGIC_VECTOR(0 to 27);
       Adr : out STD_LOGIC_VECTOR(5 downto 0);
       CS : out STD_LOGIC;
       IncPC : out STD_LOGIC;
       Instr0 : out STD_LOGIC;
       Instr1 : out STD_LOGIC;
       Instr2 : out STD_LOGIC;
       Inv : out STD_LOGIC;
       InvZ : out STD_LOGIC;
       IrIn : out STD_LOGIC;
       MarIn : out STD_LOGIC;
       MbrIn : out STD_LOGIC;
       MbrInD : out STD_LOGIC;
       MbrOut : out STD_LOGIC;
       MbrOutD : out STD_LOGIC;
       PCIn : out STD_LOGIC;
       RAIn : out STD_LOGIC;
       RDCIn : out STD_LOGIC;
       RIn : out STD_LOGIC;
       ROut : out STD_LOGIC;
       RdWr : out STD_LOGIC;
       RzIn : out STD_LOGIC;
       RzOut : out STD_LOGIC;
       SADD : out STD_LOGIC
  );
end component;
component DC1
  port (
       Ale : in STD_LOGIC;
       Com : in STD_LOGIC_VECTOR(7 downto 0);
       ComAdr : out STD_LOGIC_VECTOR(5 downto 0)
  );
end component;
component Inv
  port (
       DIn : in STD_LOGIC_VECTOR(7 downto 0);
       Inv : in STD_LOGIC;
       DOut : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;
component IR
  port (
       Command : in STD_LOGIC_VECTOR(7 downto 0);
       IRin : in STD_LOGIC;
       Reset : in STD_LOGIC;
       Com : out STD_LOGIC_VECTOR(7 downto 0);
       IrOut : out STD_LOGIC
  );
end component;
component LogAnd
  port (
       in1 : in STD_LOGIC;
       in2 : in STD_LOGIC;
       Sout : out STD_LOGIC
  );
end component;
component LogOR
  port (
       in1 : in STD_LOGIC;
       in2 : in STD_LOGIC;
       SOut : out STD_LOGIC
  );
end component;
component MAR
  port (
       AdrIn : in STD_LOGIC_VECTOR(7 downto 0);
       CLK : in STD_LOGIC;
       MarIn : in STD_LOGIC;
       RST : in STD_LOGIC;
       AdrOut : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;
component MBR
  port (
       CLK : in STD_LOGIC;
       MbrIn : in STD_LOGIC;
       MbrInD : in STD_LOGIC;
       MbrOut : in STD_LOGIC;
       MbrOutD : in STD_LOGIC;
       RST : in STD_LOGIC;
       DataIn : inout STD_LOGIC_VECTOR(7 downto 0);
       DataOut : inout STD_LOGIC_VECTOR(7 downto 0)
  );
end component;
component Memory
  port (
       Adr : in STD_LOGIC_VECTOR(5 downto 0);
       RD : in STD_LOGIC;
       InstrCom : out STD_LOGIC_VECTOR(0 to 27);
       MrOut : out STD_LOGIC
  );
end component;
component MUX
  port (
       Adr0 : in STD_LOGIC;
       Adr1 : in STD_LOGIC;
       CLK : in STD_LOGIC;
       IN1 : in STD_LOGIC_VECTOR(5 downto 0);
       IN2 : in STD_LOGIC_VECTOR(5 downto 0);
       IN3 : in STD_LOGIC_VECTOR(5 downto 0);
       MuxOut : out STD_LOGIC;
       OUT1 : out STD_LOGIC_VECTOR(5 downto 0)
  );
end component;
component PC
  port (
       AdrIn : in STD_LOGIC_VECTOR(7 downto 0);
       CLK : in STD_LOGIC;
       IncPC : in STD_LOGIC;
       PCIn : in STD_LOGIC;
       RST : in STD_LOGIC;
       AdrOut : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;
component R0
  port (
       C : in STD_LOGIC;
       CLK : in STD_LOGIC;
       DataIn : in STD_LOGIC_VECTOR(7 downto 0);
       RIn : in STD_LOGIC;
       ROut : in STD_LOGIC;
       RST : in STD_LOGIC;
       DataOut : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;
component RA
  port (
       CLK : in STD_LOGIC;
       DIn : in STD_LOGIC_VECTOR(7 downto 0);
       RAIn : in STD_LOGIC;
       DOut : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;
component RAM
  port (
       Adr : in STD_LOGIC_VECTOR(7 downto 0);
       CS : in STD_LOGIC;
       RdWr : in STD_LOGIC;
       Data : inout STD_LOGIC_VECTOR(7 downto 0)
  );
end component;
component RDC
  port (
       Number : in STD_LOGIC_VECTOR(7 downto 0);
       RDCIn : in STD_LOGIC;
       R1 : out STD_LOGIC;
       R2 : out STD_LOGIC;
       R3 : out STD_LOGIC;
       R4 : out STD_LOGIC
  );
end component;
component RZ
  port (
       CLK : in STD_LOGIC;
       DIn : in STD_LOGIC_VECTOR(7 downto 0);
       InvZ : in STD_LOGIC;
       RST : in STD_LOGIC;
       RZIn : in STD_LOGIC;
       RZOut : in STD_LOGIC;
       DOut : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;
component R_1bit
  port (
       CLK : in STD_LOGIC;
       IE : in STD_LOGIC;
       Zero : in STD_LOGIC;
       reg_in : in STD_LOGIC;
       reg_out : out STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal bit_outs : std_logic;
signal CS : std_logic;
signal FC_sig : std_logic;
signal IncPC : std_logic;
signal IrIn : std_logic;
signal JB : std_logic;
signal MarIn : std_logic;
signal MbrIn : std_logic;
signal MbrOut : std_logic;
signal N1 : std_logic;
signal N2 : std_logic;
signal N3 : std_logic;
signal PCin : std_logic;
signal RAIn : std_logic;
signal RDCIn : std_logic;
signal RdWr : std_logic;
signal RIn : std_logic;
signal ROut : std_logic;
signal RzIn : std_logic;
signal RzOut : std_logic;
signal S1 : std_logic;
signal S10 : std_logic;
signal S2 : std_logic;
signal S3 : std_logic;
signal S4 : std_logic;
signal S5 : std_logic;
signal S6 : std_logic;
signal S7 : std_logic;
signal S8 : std_logic;
signal S9 : std_logic;
signal SADD : std_logic;
signal SR1 : std_logic;
signal SR2 : std_logic;
signal SR3 : std_logic;
signal SR4 : std_logic;
signal Adr : std_logic_vector (7 downto 0);
signal BUS0 : std_logic_vector (7 downto 0);
signal BUS1 : std_logic_vector (7 downto 0);
signal BUS10 : std_logic_vector (27 downto 0);
signal BUS11 : std_logic_vector (5 downto 0);
signal BUS2 : std_logic_vector (5 downto 0);
signal BUS3 : std_logic_vector (7 downto 0);
signal BUS4 : std_logic_vector (7 downto 0);
signal BUS5 : std_logic_vector (7 downto 0);
signal BUS6 : std_logic_vector (5 downto 0);
signal BUS7 : std_logic_vector (5 downto 0);
signal BUS8 : std_logic_vector (5 downto 0);
signal MemOut : std_logic_vector (7 downto 0);

begin

----  Component instantiations  ----

DD0 : IR
  port map(
       Com => BUS1,
       Command => DataBus,
       IRin => IrIn,
       IrOut => S3,
       Reset => Reset
  );

DD1 : LogAnd
  port map(
       Sout => S5,
       in1 => bit_outs,
       in2 => S4
  );

DD10 : ALU
  port map(
       A => BUS4,
       B => DataBus,
       CLK => CLK,
       FC => FC_sig,
       FZ => S1,
       Q => BUS5,
       SADD => SADD
  );

DD11 : DC1
  port map(
       Ale => S3,
       Com => BUS1,
       ComAdr => BUS2
  );

DD12 : RZ
  port map(
       CLK => CLK,
       DIn => BUS5,
       DOut => DataBus,
       InvZ => JB,
       RST => Reset,
       RZIn => RzIn,
       RZOut => RzOut
  );

DD13 : Inv
  port map(
       DIn => BUS3,
       DOut => BUS4,
       Inv => S2
  );

DD14 : RDC
  port map(
       Number => DataBus,
       R1 => SR1,
       R2 => SR2,
       R3 => SR3,
       R4 => SR4,
       RDCIn => RDCIn
  );

DD15 : MUX
  port map(
       Adr0 => S9,
       Adr1 => S10,
       CLK => CLK,
       IN1 => BUS11,
       IN2 => BUS2,
       IN3 => BUS6,
       MuxOut => N2,
       OUT1 => BUS7
  );

DD16 : Add
  port map(
       Inc => N2,
       Reset => Reset,
       SIn => BUS7,
       SOut => BUS11
  );

DD17 : CAR
  port map(
       CarIn => CLK,
       CarOut => N3,
       D => BUS7,
       Q => BUS8
  );

DD18 : Memory
  port map(
       Adr => BUS8,
       InstrCom => BUS10,
       MrOut => N1,
       RD => N3
  );

DD19 : CBR
  port map(
       Adr => BUS6,
       CS => CS,
       CbrIn => N1,
       IncPC => IncPC,
       Instr0 => S8,
       Instr1 => S4,
       Instr2 => S10,
       InstrCom => BUS10,
       Inv => S2,
       InvZ => JB,
       IrIn => IrIn,
       MarIn => MarIn,
       MbrIn => MbrIn,
       MbrInD => S6,
       MbrOut => MbrOut,
       MbrOutD => S7,
       PCIn => PCin,
       RAIn => RAIn,
       RDCIn => RDCIn,
       RIn => RIn,
       ROut => ROut,
       RdWr => RdWr,
       RzIn => RzIn,
       RzOut => RzOut,
       SADD => SADD
  );

DD2 : MAR
  port map(
       AdrIn => BUS0,
       AdrOut => Adr,
       CLK => CLK,
       MarIn => MarIn,
       RST => Reset
  );

DD20 : PC
  port map(
       AdrIn => DataBus,
       AdrOut => BUS0,
       CLK => CLK,
       IncPC => IncPC,
       PCIn => PCin,
       RST => Reset
  );

DD21 : LogOR
  port map(
       SOut => S9,
       in1 => S5,
       in2 => S8
  );

DD22 : R_1bit
  port map(
       CLK => CLK,
       IE => RzIn,
       Zero => S5,
       reg_in => FC_sig,
       reg_out => bit_outs
  );

DD3 : RAM
  port map(
       Adr => Adr,
       CS => CS,
       Data => MemOut,
       RdWr => RdWr
  );

DD4 : MBR
  port map(
       CLK => CLK,
       DataIn => MemOut,
       DataOut => DataBus,
       MbrIn => MbrIn,
       MbrInD => S6,
       MbrOut => MbrOut,
       MbrOutD => S7,
       RST => Reset
  );

DD5 : R0
  port map(
       C => SR1,
       CLK => CLK,
       DataIn => DataBus,
       DataOut => DataBus,
       RIn => RIn,
       ROut => ROut,
       RST => Reset
  );

DD6 : R0
  port map(
       C => SR2,
       CLK => CLK,
       DataIn => DataBus,
       DataOut => DataBus,
       RIn => RIn,
       ROut => ROut,
       RST => Reset
  );

DD7 : R0
  port map(
       C => SR3,
       CLK => CLK,
       DataIn => DataBus,
       DataOut => DataBus,
       RIn => RIn,
       ROut => ROut,
       RST => Reset
  );

DD8 : R0
  port map(
       C => SR4,
       CLK => CLK,
       DataIn => DataBus,
       DataOut => DataBus,
       RIn => RIn,
       ROut => ROut,
       RST => Reset
  );

DD9 : RA
  port map(
       CLK => CLK,
       DIn => DataBus,
       DOut => BUS3,
       RAIn => RAIn
  );


---- Terminal assignment ----

    -- Output\buffer terminals
	FC <= FC_sig;
	bit_out <= bit_outs;


end MPA;
