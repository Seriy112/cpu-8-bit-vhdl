library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity MUX is
port (IN1: in std_logic_vector (5 downto 0);
IN2: in std_logic_vector (5 downto 0);
IN3: in std_logic_vector (5 downto 0);
Adr0: in std_logic;
Adr1: in std_logic;
CLK: in std_logic;
MuxOut: out std_logic;
OUT1: out std_logic_vector (5 downto 0));
end MUX;
architecture MUX of MUX is
begin
process(CLK)
begin
if CLK='1' and CLK'event then
if 	Adr1='0' and Adr0='0' then OUT1 <= IN1;
elsif 	Adr1='1' then OUT1 <= IN2;
elsif 	Adr1='0' and Adr0='1' then OUT1 <= IN3;
else Out1<= "000000";
end if;
MuxOut<='1';
end if;
if CLK='0' and CLK'event then MuxOut<='0';
end if;
end process;
end MUX;
