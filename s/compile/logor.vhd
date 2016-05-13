-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : s
-- Author      : Microsoft
-- Company     : Microsoft
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\s\s\compile\logor.vhd
-- Generated   : Fri May 13 01:12:57 2016
-- From        : c:\My_Designs\s\s\src\logor.bde
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

entity logor is
  port(
       in1 : in std_logic;
       in2 : in std_logic;
       SOut : out std_logic
  );
end logor;

architecture LogOR of logor is

begin

---- User Signal Assignments ----
SOut <= in1 or in2 after 1ns;

end LogOR;
