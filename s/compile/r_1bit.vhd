-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : s
-- Author      : Microsoft
-- Company     : Microsoft
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\s\s\compile\r_1bit.vhd
-- Generated   : Fri May 13 01:13:01 2016
-- From        : c:\My_Designs\s\s\src\r_1bit.bde
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

entity r_1bit is
  port(
       CLK : in std_logic;
       IE : in std_logic;
       Zero : in std_logic;
       reg_in : in std_logic;
       reg_out : out std_logic
  );
end r_1bit;

architecture R_1bit of r_1bit is

---- Signal declarations used on the diagram ----

signal regist : std_logic;

begin

---- Processes ----

process (CLK)
                       begin
                         reg_out <= regist;
                         if CLK = '0' and CLK'event and IE = '1' then
                            regist <= reg_in after 2ns;
                         elsif Zero = '1' then
                            regist <= '0' after 2ns;
                         end if;
                       end process;                      

end R_1bit;
