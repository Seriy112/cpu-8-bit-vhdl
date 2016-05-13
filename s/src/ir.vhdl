library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity IR is
port (Command: in std_logic_vector (7 downto 0);
IRin: in std_logic;
Reset: in std_logic;
IrOut: out std_logic;
Com: out std_logic_vector (7 downto 0));
end IR;
architecture IR of IR is
begin
process (IrIn, Reset)
begin
if IrIn='1' and Irin'event then
Com<=Command after 2ns;
IrOut<='1'after 2ns;
end if;
if IrIn='0' and Irin'event then IrOut<='0';
end if;
if Reset='1' then
Com<= "00000000";
IrOut<='1';
end if;	
end process;
end IR;
