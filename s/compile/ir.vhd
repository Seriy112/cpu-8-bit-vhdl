-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : s
-- Author      : Microsoft
-- Company     : Microsoft
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\s\s\compile\ir.vhd
-- Generated   : Fri May 13 01:12:57 2016
-- From        : c:\My_Designs\s\s\src\ir.bde
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

entity ir is
  port(
       IRin : in std_logic;
       Reset : in std_logic;
       Command : in std_logic_vector(7 downto 0);
       IrOut : out std_logic;
       Com : out std_logic_vector(7 downto 0)
  );
end ir;

architecture IR of ir is

begin

---- Processes ----

process (IrIn,Reset)
                       begin
                         if IrIn = '1' and IrIn'event then
                            Com <= Command after 2ns;
                            IrOut <= '1' after 2ns;
                         end if;
                         if IrIn = '0' and IrIn'event then
                            IrOut <= '0';
                         end if;
                         if Reset = '1' then
                            Com <= "00000000";
                            IrOut <= '1';
                         end if;
                       end process;                      

end IR;
