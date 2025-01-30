LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY FourByFourMul IS 
    PORT (x, y : IN  STD_LOGIC_VECTOR (3 downto 0);
        P : OUT STD_LOGIC_VECTOR (7 downto 0));
END FourByFourMul;

ARCHITECTURE fourMul OF FourByFourMul IS

    COMPONENT oneByOneMul is
      PORT (x, y : IN  STD_LOGIC;
      o : OUT STD_LOGIC);
    END COMPONENT oneByOneMul;

    COMPONENT fullAdder IS 
    PORT (Cin, x, y : IN STD_LOGIC;
          s, Cout   : OUT STD_LOGIC);
    END COMPONENT fullAdder;

    COMPONENT halfAdder IS
    PORT (x, y  : IN STD_LOGIC;
          s, Cout  : OUT STD_LOGIC);
    END COMPONENT halfAdder;

    SIGNAL partialProduct : STD_LOGIC_VECTOR (15 downto 0);
    SIGNAL carryOuts : STD_LOGIC_VECTOR (9 downto 0);
    SIGNAL sums : STD_LOGIC_VECTOR (3 downto 0);

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
    MUL1: oneByOneMul port map (y(0), x(0), partialProduct(0));
    MUL2: oneByOneMul port map (y(0), x(1), partialProduct(1));
    MUL3: oneByOneMul port map (y(0), x(2), partialProduct(2));
    MUL4: oneByOneMul port map (y(0), x(3), partialProduct(3));

    MUL5: oneByOneMul port map (y(1), x(0), partialProduct(4));
    MUL6: oneByOneMul port map (y(1), x(1), partialProduct(5));
    MUL7: oneByOneMul port map (y(1), x(2), partialProduct(6));
    MUL8: oneByOneMul port map (y(1), x(3), partialProduct(7));

    MUL9: oneByOneMul port map (y(2), x(0), partialProduct(8));
    MUL10: oneByOneMul port map (y(2), x(1), partialProduct(9));
    MUL11: oneByOneMul port map (y(2), x(2), partialProduct(10));
    MUL12: oneByOneMul port map (y(2), x(3), partialProduct(11));

    MUL13: oneByOneMul port map (y(3), x(0), partialProduct(12));
    MUL14: oneByOneMul port map (y(3), x(1), partialProduct(13));
    MUL15: oneByOneMul port map (y(3), x(2), partialProduct(14));
    MUL16: oneByOneMul port map (y(3), x(3), partialProduct(15));

    --partialProduct(0) <= x (0) AND y (0);
    --partialProduct(1) <= x (0) AND y (1);  
    --partialProduct(2) <= x (0) AND y (2);  
    --partialProduct(3) <= x (0) AND y (3);  
    --partialProduct(4) <= x (1) AND y (0);  
    --partialProduct(5) <= x (1) AND y (1);  
    --partialProduct(6) <= x (1) AND y (2);  
    --partialProduct(7) <= x (1) AND y (3);  
    --partialProduct(8) <= x (2) AND y (0); 
    --partialProduct(9) <= x (2) AND y (1); 
    --partialProduct(10) <= x (2) AND y (2); 
    --partialProduct(11) <= x (2) AND y (3); 
    --partialProduct(12) <= x (3) AND y (0); 
    --partialProduct(13) <= x (3) AND y (1); 
    --partialProduct(14) <= x (3) AND y (2); 
    --partialProduct(15) <= x (3) AND y (3); 


    --P(0) <= partialProduct(0);
    --P(1) <= partialProduct(1) XOR partialProduct(4);
    --P(2) <= partialProduct(2) XOR partialProduct(5) XOR partialProduct(8);
    --P(3) <= partialProduct(3) XOR partialProduct(6) XOR partialProduct(9);
    --P(4) <= (partialProduct(7) XOR partialProduct(10)) XOR partialProduct(12);
    --P(5) <= partialProduct(11) XOR partialProduct(13) XOR partialProduct(14);
    --P(6) <= partialProduct(15) XOR partialProduct(13);
    --P(7) <= partialProduct(15);
    P(0) <= partialProduct(0);
    HA1 : halfAdder PORT MAP (partialProduct(1), partialProduct(4), P(1), carryOuts(0));
   -- FA1 : fullAdder port map (partialProduct(1), partialProduct(4), '0', P(1), carryOuts(0));
    FA1 : fullAdder PORT MAP (partialProduct(5), partialProduct(8), carryOuts(0), sums(0), carryOuts(1));
    FA2 : fullAdder PORT MAP (partialProduct(2), sums(0), carryOuts(1), P(2), carryOuts(2));
    FA3 : fullAdder PORT MAP (partialProduct(9), partialProduct(12), carryOuts(2), sums(1), carryOuts(3));
    FA4 : fullAdder PORT MAP (partialProduct(6), sums(1), carryOuts(3), sums(2), carryOuts(4));
    FA5 : fullAdder PORT MAP (partialProduct(3), sums(2), carryOuts(4), P(3), carryOuts(5));
    FA6 : fullAdder PORT MAP (partialProduct(10), partialProduct(13), carryOuts(5), sums(3), carryOuts(6));
    FA7 : fullAdder PORT MAP (partialProduct(7), sums(3), carryOuts(6), P(4), carryOuts(7));
    FA8 : fullAdder PORT MAP (partialProduct(11), partialProduct(14), carryOuts(7), P(5), carryOuts(8));
    HA2 : halfAdder PORT MAP (partialProduct(15), carryOuts(8), P(6), carryOuts(9));
    --FA10 : fullAdder PORT MAP (partialProduct(15), '0', carryOuts(8), P(6), carryOuts(9));
    P(7) <= carryOuts(9);





    

  


    
END fourMul ;



