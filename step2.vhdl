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
    SIGNAL carryOuts : STD_LOGIC_VECTOR (11 downto 0);
    SIGNAL sums : STD_LOGIC_VECTOR (11 downto 0);

BEGIN 

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

    P(0) <= partialProduct(0);
    HA1 : halfAdder PORT MAP (partialProduct(1), partialProduct(4), sums(0), carryOuts(0));
    HA2 : halfAdder PORT MAP (partialProduct(7), carryOuts(2), sums(3), carryOuts(3));
    HA3 : halfAdder PORT MAP (sums(1), partialProduct(8), sums(4), carryOuts(4));
    HA4 : halfAdder PORT MAP (partialProduct(12), sums(5), sums(8), carryOuts(8));

    FA1 : fullAdder PORT MAP (partialProduct(2), partialProduct(5), carryOuts(0), sums(1), carryOuts(1));
    FA2 : fullAdder PORT MAP (partialProduct(3), partialProduct(6), carryOuts(1), sums(2), carryOuts(2));
    FA3 : fullAdder PORT MAP (partialProduct(9), sums(2), carryOuts(4), sums(5), carryOuts(5));
    FA4 : fullAdder PORT MAP (partialProduct(10), sums(3), carryOuts(5), sums(6), carryOuts(6));
    FA5 : fullAdder PORT MAP (partialProduct(11), carryOuts(3), carryOuts(6), sums(7), carryOuts(7));
    FA6 : fullAdder PORT MAP (partialProduct(13), sums(6), carryOuts(8), sums(9), carryOuts(9));
    FA7 : fullAdder PORT MAP (partialProduct(14), sums(7), carryOuts(9), sums(10), carryOuts(10));
    FA8 : fullAdder PORT MAP (partialProduct(15), carryOuts(7), carryOuts(10), sums(11), carryOuts(11));
    P(1) <= sums(0);
    P(2) <= sums(4);
    P(3) <= sums(8);
    P(4) <= sums(9);
    P(5) <= sums(10);
    P(6) <= sums(11);
    P(7) <= carryOuts(11);

END fourMul ;



