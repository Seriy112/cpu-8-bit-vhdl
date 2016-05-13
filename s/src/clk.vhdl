library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_signed.all;
entity PC is
port (RST: in std_logic;
CLK: in std_logic;
PCIn: in std_logic;
IncPC: in std_logic;
AdrIn: in std_logic_vector (7 downto 0);
AdrOut: out std_logic_vector (7 downto 0));
end PC;
architecture PC of PC is
signal reg: std_logic_vector (7 downto 0);
begin
process (CLK, RST)
begin
If CLK='0' and CLK'event and PCIn='1' then	reg<=AdrIn;
end if;
If CLK='0' and CLK'event and IncPC='1' then reg<=reg+ "0000001" after 2ns;
end if;
If CLK='1' and CLK'event then	AdrOut<=reg after 2ns;
end if;
if 	RST='1' then reg<= "00000000";
end if;
end process;
end PC;
