-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : s
-- Author      : Microsoft
-- Company     : Microsoft
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\s\s\compile\add.vhd
-- Generated   : Fri May 13 01:12:55 2016
-- From        : c:\My_Designs\s\s\src\add.bde
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

entity add is
  port(
       Inc : in std_logic;
       Reset : in std_logic;
       SIn : in std_logic_vector(5 downto 0);
       SOut : out std_logic_vector(5 downto 0)
  );
end add;

architecture Add of add is

begin

---- Processes ----

process (Inc,reset)
                       begin
                         if Inc = '1' and Inc'event then
                            SOut <= CONV_STD_LOGIC_VECTOR(((CONV_INTEGER('0' & SIn)) + 1),6);
                         end if;
                         if reset = '1' then
                            SOut <= "000000";
                         end if;
                       end process;                      

end Add;
