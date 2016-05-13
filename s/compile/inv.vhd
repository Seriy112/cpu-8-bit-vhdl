-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : s
-- Author      : Microsoft
-- Company     : Microsoft
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\s\s\compile\inv.vhd
-- Generated   : Fri May 13 01:12:56 2016
-- From        : c:\My_Designs\s\s\src\inv.bde
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

entity inv is
  port(
       Inv : in std_logic;
       DIn : in std_logic_vector(7 downto 0);
       DOut : out std_logic_vector(7 downto 0)
  );
end inv;

architecture INV of inv is

begin

---- User Signal Assignments ----
DOut <= not DIn when INV = '1' else DIn;

end INV;
