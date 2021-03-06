-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : s
-- Author      : Microsoft
-- Company     : Microsoft
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\s\s\compile\rdc.vhd
-- Generated   : Fri May 13 01:13:00 2016
-- From        : c:\My_Designs\s\s\src\rdc.bde
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

entity rdc is
  port(
       RDCIn : in std_logic;
       Number : in std_logic_vector(7 downto 0);
       R1 : out std_logic;
       R2 : out std_logic;
       R3 : out std_logic;
       R4 : out std_logic
  );
end rdc;

architecture RDC of rdc is

begin

---- Processes ----

process (RDCIn)
                       begin
                         if RDCIn = '1' and RDCIn'event then
                            R1 <= '0';
                            R2 <= '0';
                            R3 <= '0';
                            R4 <= '0';
                            if Number = "00000001" then
                               R1 <= '1' after 2ns;
                            end if;
                            if Number = "00000010" then
                               R2 <= '1' after 2ns;
                            end if;
                            if Number = "00000011" then
                               R3 <= '1' after 2ns;
                            end if;
                            if Number = "00000100" then
                               R4 <= '1' after 2ns;
                            end if;
                         end if;
                       end process;                      

end RDC;
