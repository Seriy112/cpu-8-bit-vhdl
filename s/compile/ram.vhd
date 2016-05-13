-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : s
-- Author      : Microsoft
-- Company     : Microsoft
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\s\s\compile\ram.vhd
-- Generated   : Fri May 13 01:13:00 2016
-- From        : c:\My_Designs\s\s\src\ram.bde
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

entity ram is
  port(
       CS : in std_logic;
       RdWr : in std_logic;
       Adr : in std_logic_vector(7 downto 0);
       Data : inout std_logic_vector(7 downto 0)
  );
end ram;

architecture RAM of ram is

---- Architecture declarations -----
--Added by Active-HDL. Do not change code inside this section.
type MemoryType is array (0 to 8) of std_logic_vector(7 downto 0);
--End of extra code.


---- Signal declarations used on the diagram ----

signal Memory : MemoryType;

begin

---- Processes ----

process (RdWr,CS,Adr)
                       begin
                         if RdWr = '1' and CS = '1' then
                            Data <= Memory(CONV_INTEGER('0' & Adr)) after 3ns;
                         end if;
                         if RdWr = '0' and CS = '1' then
                            Memory(CONV_INTEGER('0' & Adr)) <= Data;
                         end if;
                       end process;                      

end RAM;
