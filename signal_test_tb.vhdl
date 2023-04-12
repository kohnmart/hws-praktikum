library IEEE;
use IEEE.std_logic_1164.all;

entity TEST_TB is
end TEST_TB;

architecture TESTBENCH of TEST_TB is

-- Component declaration
component TEST is
    port (clk: in std_logic);
end component;


-- Configuration
for SPEC: TEST use entity WORK.TEST(BEHAVIOR);

-- Testbench
signal clk: std_logic := '0';

begin

  -- Instantiate half adder
  SPEC: TEST port map (clk);

    process
    begin 
        wait for 10 ns;
            clk <= '1';

        wait for 10 ns;
        assert false report "Simulation finished" severity note;
        wait; -- end simulation

    end process;
end TESTBENCH ; -- TESTBENCH