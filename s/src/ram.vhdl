library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_signed.all;
entity RAM is
port (RdWr: in std_logic;
CS: in std_logic;
Adr: in std_logic_vector (7 downto 0);
Data: inout std_logic_vector (7 downto 0));
end RAM;
architecture RAM of RAM is
type MemoryType is array (0 to 8) of std_logic_vector (7 downto 0);
signal Memory: MemoryType:=(
"00000000", -- mov A,#d
"00110011", --#d
"00000001", -- mov R,#d
"00000001", -- number R
"11110110", --#d
"00000010", -- add A, Rn
"00000001", -- number R
"00000100", -- JBC bit, rel
"00000000"); -- restart
begin 	
process (RdWr, CS, Adr)
begin
if RdWr='1' and CS='1' then	Data<=Memory (CONV_INTEGER ('0'& Adr)) after 3ns;
end if;
if RdWr='0' and CS='1' then Memory (CONV_INTEGER ('0'& Adr))<=Data;
end if;
end process;
end RAM;
