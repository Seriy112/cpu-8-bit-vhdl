library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity R_1bit is
port (reg_in, IE: in std_logic;
CLK, Zero:in std_logic;
reg_out: out std_logic);
end R_1bit;
architecture R_1bit of R_1bit is
signal regist: std_logic;
begin
process(CLK)
begin
reg_out<= regist;
if CLK='0' and CLK'event and IE='1' then regist<=reg_in after 2ns;
elsif Zero='1' then regist<='0' after 2ns;
end if;
end process;	
end R_1bit;
