library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity LogOR is
port (in1: in std_logic;
in2: in std_logic;
SOut: out std_logic);
end LogOR;
architecture LogOR of LogOR is
begin
SOut<=in1 or in2 after 1ns;
end LogOR;
