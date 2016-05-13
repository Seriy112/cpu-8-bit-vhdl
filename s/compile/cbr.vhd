-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : s
-- Author      : Microsoft
-- Company     : Microsoft
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\s\s\compile\cbr.vhd
-- Generated   : Fri May 13 01:12:56 2016
-- From        : c:\My_Designs\s\s\src\cbr.bde
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

entity cbr is
  port(
       CbrIn : in std_logic;
       InstrCom : in std_logic_vector(0 to 27);
       CS : out std_logic;
       IncPC : out std_logic;
       Instr0 : out std_logic;
       Instr1 : out std_logic;
       Instr2 : out std_logic;
       Inv : out std_logic;
       InvZ : out std_logic;
       IrIn : out std_logic;
       MarIn : out std_logic;
       MbrIn : out std_logic;
       MbrInD : out std_logic;
       MbrOut : out std_logic;
       MbrOutD : out std_logic;
       PCIn : out std_logic;
       RAIn : out std_logic;
       RDCIn : out std_logic;
       RIn : out std_logic;
       ROut : out std_logic;
       RdWr : out std_logic;
       RzIn : out std_logic;
       RzOut : out std_logic;
       SADD : out std_logic;
       Adr : out std_logic_vector(5 downto 0)
  );
end cbr;

architecture CBR of cbr is

begin

---- Processes ----

process (CbrIN)
                       begin
                         if CbrIN = '1' and CbrIN'event then
                            Instr0 <= InstrCom(2) after 1ns;
                            Instr1 <= InstrCom(1) after 1ns;
                            Instr2 <= InstrCom(0) after 1ns;
                            ADR <= InstrCom(3 to 8) after 1ns;
                            PCIn <= InstrCom(9) after 1ns;
                            IncPC <= InstrCom(10) after 1ns;
                            IrIn <= InstrCom(11) after 1ns;
                            MarIn <= InstrCom(12) after 1ns;
                            RdWr <= InstrCom(13) after 1ns;
                            CS <= InstrCom(14) after 1ns;
                            MbrIn <= InstrCom(15) after 1ns;
                            MbrOut <= InstrCom(16) after 1ns;
                            MbrInD <= InstrCom(17) after 1ns;
                            MbrOutD <= InstrCom(18) after 1ns;
                            RzIn <= InstrCom(19) after 1ns;
                            RzOut <= InstrCom(20) after 1ns;
                            Inv <= InstrCom(21) after 1ns;
                            RAIn <= InstrCom(22) after 1ns;
                            RIn <= InstrCom(23) after 1ns;
                            ROut <= InstrCom(24) after 1ns;
                            RDCIn <= InstrCom(25) after 1ns;
                            SADD <= InstrCom(26) after 1ns;
                            InvZ <= InstrCom(27) after 1ns;
                         end if;
                       end process;                      

end CBR;
