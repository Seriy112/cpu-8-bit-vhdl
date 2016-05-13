library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_signed.all;
use IEEE.std_logic_arith.all;
entity ALU is
port (B: in std_logic_vector (7 downto 0);
A: in std_logic_vector (7 downto 0);
SADD: in std_logic;
CLK: in std_logic;
Q: out std_logic_vector (7 downto 0);
FC: out std_logic;
FZ: out std_logic);
end ALU;
architecture ALU of ALU is
signal rez: std_logic_vector (7 downto 0):= "00000000";
begin
process(CLK)
begin		
if CLK='0' and CLK'event then FC<='0';
if SADD='1' then
Q<=	CONV_STD_LOGIC_VECTOR((CONV_INTEGER ('0'& A)+CONV_INTEGER ('0'& B)), 9) (7 downto 0) after 4 ns;
FC<= CONV_STD_LOGIC_VECTOR((CONV_INTEGER ('0'& A)+CONV_INTEGER ('0'& B)), 9) (8) after 4 ns;	
else Q<= "00000000";
end if;
if A= "00000000" then FZ<='0';
else FZ<='1';
end if;
end if;
end process;
end ALU;
