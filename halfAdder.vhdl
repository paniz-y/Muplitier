LIBRARY IEEE;
USE ieee.std_logic_1164.all;

 
ENTITY halfAdder IS
  PORT (x, y  : IN STD_LOGIC;
        s, Cout  : OUT STD_LOGIC);
END halfAdder;
 
ARCHITECTURE logicFunc of halfAdder is
BEGIN
  s   <= x XOR y;
  Cout <= x AND y;
END logicFunc;