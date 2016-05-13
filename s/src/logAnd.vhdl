library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity LogAnd is
port (in1: in std_logic;
in2: in std_logic;
Sout: out std_logic);
end LogAnd;
architecture LogAnd of LogAnd is
begin
Sout<=in1 and in2 after 1ns; 	
end LogAnd;
