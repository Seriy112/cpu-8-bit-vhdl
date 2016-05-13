library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity MBR is
port (RST: in std_logic;
CLK: in std_logic;
MbrIn: in std_logic;
MbrOut: in std_logic;
MbrInD: in std_logic;
MbrOutD: in std_logic;
DataIn: inout std_logic_vector (7 downto 0);
DataOut: inout std_logic_vector (7 downto 0));
end MBR;
architecture MBR of MBR is
signal reg: std_logic_vector (7 downto 0);
begin
Process (CLK, RST)
begin
if CLK='0' and CLK'event then
if MbrIn='1' then reg<=DataIn;
elsif MbrOut='1' then DataOut<=reg;
elsif MbrInD='1' then reg<=DataOut;
elsif MbrOutD='1' then DataIn<=reg;
end if;
if MbrIn='0' and MbrOutD='0' then DataIn<= "ZZZZZZZZ";
end if;
if MbrOut='0' and MbrInD='0' then DataOut<= "ZZZZZZZZ";
end if;
end if;
if RST='1' then	reg<= "00000000";
end if;
end process;
end MBR;
