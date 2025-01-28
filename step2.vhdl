LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY FourByFourMul IS 
    PORT (x, y : IN  STD_LOGIC_VECTOR (3 downto 0);
        P : OUT STD_LOGIC_VECTOR (7 downto 0));
END FourByFourMul;

ARCHITECTURE fourMul OF FourByFourMul IS
    SIGNAL partialProduct : STD_LOGIC_VECTOR (15 downto 0);

BEGIN 
    --fourMulti : for i IN 0 TO 3 GENERATE
      --  fourmulti : for j IN 0 TO 3 GENERATE
      --      fm : ENTITY WORK.oneByOneMul PORT MAP (
        --        x(i),
          --      y(j),
            --    partialProduct((i*4)+j)
            --);
       -- END GENERATE;    
    --END GENERATE;
    partialProduct(0) <= x (0) AND y (0);
    partialProduct(1) <= x (0) AND y (1);  
    partialProduct(2) <= x (0) AND y (2);  
    partialProduct(3) <= x (0) AND y (3);  
    partialProduct(4) <= x (1) AND y (0);  
    partialProduct(5) <= x (1) AND y (1);  
    partialProduct(6) <= x (1) AND y (2);  
    partialProduct(7) <= x (1) AND y (3);  
    partialProduct(8) <= x (2) AND y (0); 
    partialProduct(9) <= x (2) AND y (1); 
    partialProduct(10) <= x (2) AND y (2); 
    partialProduct(11) <= x (2) AND y (3); 
    partialProduct(12) <= x (3) AND y (0); 
    partialProduct(13) <= x (3) AND y (1); 
    partialProduct(14) <= x (3) AND y (2); 
    partialProduct(15) <= x (3) AND y (3); 


    P(0) <= partialProduct(0);
    P(1) <= partialProduct(1) XOR partialProduct(4);
    p(3) <= partialProduct(3) XOR partialProduct(5) XOR partialProduct(8);
    P(4) <= partialProduct(7) XOR partialProduct(6) XOR partialProduct(9);
    P(5) <= partialProduct(11) XOR partialProduct(13) XOR partialProduct(14);
    P(6) <= partialProduct(15) XOR partialProduct(13);
    P(7) <= partialProduct(15);
    
END fourMul ;



