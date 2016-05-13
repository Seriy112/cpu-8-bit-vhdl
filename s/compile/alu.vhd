-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : s
-- Author      : Microsoft
-- Company     : Microsoft
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\s\s\compile\alu.vhd
-- Generated   : Fri May 13 01:12:55 2016
-- From        : c:\My_Designs\s\s\src\alu.bde
-- By          : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library ieee;
        use ieee.std_logic_1164.all;
        use ieee.std_logic_signed.all;
        use ieee.std_logic_arith.all;

entity alu is
  port(
       CLK : in std_logic;
       SADD : in std_logic;
       A : in std_logic_vector(7 downto 0);
       B : in std_logic_vector(7 downto 0);
       FC : out std_logic;
       FZ : out std_logic;
       Q : out std_logic_vector(7 downto 0)
  );
end alu;

architecture ALU of alu is

---- Signal declarations used on the diagram ----

signal rez : std_logic_vector (7 downto 0) := "00000000";

begin

---- Processes ----

process (CLK)
                       begin
                         if CLK = '0' and CLK'event then
                            FC <= '0';
                            if SADD = '1' then
                               Q <= CONV_STD_LOGIC_VECTOR((CONV_INTEGER('0' & A) + CONV_INTEGER('0' & B)),9)(7 downto 0) after 4ns;
                               FC <= CONV_STD_LOGIC_VECTOR((CONV_INTEGER('0' & A) + CONV_INTEGER('0' & B)),9)(8) after 4ns;
                            else 
                               Q <= "00000000";
                            end if;
                            if A = "00000000" then
                               FZ <= '0';
                            else 
                               FZ <= '1';
                            end if;
                         end if;
                       end process;                      

end ALU;
