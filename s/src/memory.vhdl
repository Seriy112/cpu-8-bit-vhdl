library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_signed.all;
entity Memory is
port (Adr: in std_logic_vector (5 downto 0);
RD: in std_logic;	
MrOut: out std_logic;
InstrCom: out std_logic_vector (0 to 27));
end Memory;
architecture Memory of Memory is
type MemoryType is array (0 to 59) of std_logic_vector (0 to 27);
signal Memory: MemoryType;
begin
Memory(0)<= "000"& "000000"& "0000000"& "0000000"& "0000"& "0";
Memory(1)<= "000"& "000000"& "0001000"& "0000000"& "0000"& "0"; -- MarIn
Memory(2)<= "000"& "000000"& "0000110"& "0000000"& "0000"& "0"; -- RdWr, CS
Memory(3)<= "000"& "000000"& "0000001"& "0000000"& "0000"& "0"; -- MbrIn
Memory(4)<= "000"& "000000"& "0000000"& "1000000"& "0000"& "0"; -- MbrOut
Memory(5)<= "000"& "000000"& "0010000"& "0000000"& "0000"& "0"; -- IrIn	
Memory(6)<= "100"& "000000"& "0000000"& "0000000"& "0000"& "0"; -- Instr0
-- mov A,#d
Memory(7) <= "000"& "000000"& "0100000"& "0000000"& "0000"& "0"; -- IncPC
Memory(8) <= "000"& "000000"& "0001000"& "0000000"& "0000"& "0"; -- MarIn
Memory(9) <= "000"& "000000"& "0000110"& "0000000"& "0000"& "0"; -- RdWr, CS
Memory(10)<= "000"& "000000"& "0000001"& "0000000"& "0000"& "0"; -- MbrIn
Memory(11)<= "000"& "000000"& "0000000"& "1000000"& "0000"& "0"; -- MbrOut
Memory(12)<= "000"& "000000"& "0000000"& "0000001"& "0000"& "0"; -- RAin	
Memory(13)<= "001"& "000000"& "0100000"& "0000000"& "0000"& "0"; -- Instr2, IncPC
-- mov Rn,#d
Memory(14)<= "000"& "000000"& "0100000"& "0000000"& "0000"& "0"; -- IncPC
Memory(15)<= "000"& "000000"& "0001000"& "0000000"& "0000"& "0"; -- MarIn
Memory(16)<= "000"& "000000"& "0000110"& "0000000"& "0000"& "0"; -- RdWr, CS
Memory(17)<= "000"& "000000"& "0000001"& "0000000"& "0000"& "0"; -- MbrIn
Memory(18)<= "000"& "000000"& "0000000"& "1000000"& "0000"& "0"; -- MbrOut
Memory(19)<= "000"& "000000"& "0000000"& "0000000"& "0010"& "0"; -- RDCIn
Memory(20)<= "000"& "000000"& "0100000"& "0000000"& "0000"& "0"; -- IncPC
Memory(21)<= "000"& "000000"& "0001000"& "0000000"& "0000"& "0"; -- MarIn
Memory(22)<= "000"& "000000"& "0000110"& "0000000"& "0000"& "0"; -- RdWr, CS
Memory(23)<= "000"& "000000"& "0000001"& "0000000"& "0000"& "0"; -- MbrIn
Memory(24)<= "000"& "000000"& "0000000"& "1000000"& "0000"& "0"; -- MbrOut
Memory(25)<= "000"& "000000"& "0000000"& "0000000"& "1000"& "0"; -- RIn
Memory(26)<= "001"& "000000"& "0100000"& "0000000"& "0000"& "0"; -- Instr2, IncPC
-- add A, Rn
Memory(27)<= "000"& "000000"& "0100000"& "0000000"& "0000"& "0"; -- IncPC
Memory(28)<= "000"& "000000"& "0001000"& "0000000"& "0000"& "0"; -- MarIn
Memory(29)<= "000"& "000000"& "0000110"& "0000000"& "0000"& "0"; -- RdWr, CS
Memory(30)<= "000"& "000000"& "0000001"& "0000000"& "0000"& "0"; -- MbrIn
Memory(31)<= "000"& "000000"& "0000000"& "1000000"& "0000"& "0"; -- MbrOut
Memory(32)<= "000"& "000000"& "0000000"& "0000000"& "0010"& "0"; -- RDCIn
Memory(33)<= "000"& "000000"& "0000000"& "0000000"& "0100"& "0"; -- ROut
Memory(34)<= "000"& "000000"& "0000000"& "0000000"& "0001"& "0"; -- SADD
Memory(35)<= "000"& "000000"& "0000000"& "0001000"& "0000"& "0"; -- RZin
Memory(36)<= "000"& "000000"& "0000000"& "0000100"& "0000"& "0"; -- RZout
Memory(37)<= "000"& "000000"& "0000000"& "0000001"& "0000"& "0"; -- RAin
Memory(38)<= "001"& "000000"& "0100000"& "0000000"& "0000"& "0"; -- Instr2, IncPC
-- JBC
Memory(51)<= "010"& "110110"& "0000000"& "0000000"& "0000"& "0"; -- perexod na adres 36H ili 54 v dec s/s
Memory(52)<= "000"& "000000"& "0000000"& "0000000"& "0000"& "0"; -- any value
Memory(53)<= "000"& "000000"& "0000000"& "0000000"& "0000"& "0"; -- any value
Memory(54)<= "000"& "000000"& "0100000"& "0000000"& "0000"& "0"; -- IncPC
Memory(55)<= "000"& "000000"& "0001000"& "0000000"& "0000"& "0"; -- MarIn
Memory(56)<= "000"& "000000"& "0000110"& "0000000"& "0000"& "0"; -- RdWr, CS
Memory(57)<= "000"& "000000"& "0000001"& "0000000"& "0000"& "0"; -- MbrIn
Memory(58)<= "000"& "000000"& "0000000"& "1000000"& "0000"& "0"; -- MbrOut
Memory(59)<= "001"& "000000"& "1000000"& "0000000"& "0000"& "0"; -- Instr2, PCIn
process(RD)
begin
if RD='1' and RD'event then
InstrCom<=Memory (CONV_INTEGER ('0'& Adr));
MrOut<='1';
end if;
if RD='0' and RD'event then	MrOut<='0';
end if;
end process;
end Memory;
