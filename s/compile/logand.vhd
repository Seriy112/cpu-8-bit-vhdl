-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : s
-- Author      : Microsoft
-- Company     : Microsoft
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\s\s\compile\logand.vhd
-- Generated   : Fri May 13 01:12:57 2016
-- From        : c:\My_Designs\s\s\src\logand.bde
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

entity logand is
  port(
       in1 : in std_logic;
       in2 : in std_logic;
       Sout : out std_logic
  );
end logand;

architecture LogAnd of logand is

begin

---- User Signal Assignments ----
Sout <= in1 and in2 after 1ns;

end LogAnd;
