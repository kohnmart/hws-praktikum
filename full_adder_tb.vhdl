library IEEE;
use IEEE.std_logic_1164.all;


entity FULL_ADDER_TB is
end FULL_ADDER_TB;


architecture TESTBENCH of FULL_ADDER_TB is

  -- Component declaration...
  component FULL_ADDER is
    port (a, b, c_in: in std_logic; sum, c_out: out std_logic);
  end component;

  -- Separate Testbenches für SPEC und IMPL
  for SPEC: FULL_ADDER use entity WORK.FULL_ADDER(BEHAVIOR);
  for IMPL: FULL_ADDER use entity WORK.FULL_ADDER(STRUCTURE);

  -- Internal signals...
  signal a, b, c_in: std_logic := '0';
  signal sum_spec, carry_spec, sum_impl, carry_impl: std_logic;

begin

  -- Instantiate full adder...
  SPEC: FULL_ADDER port map (a => a, b => b, c_in => c_in, sum => sum_spec, c_out => carry_spec);
  IMPL: FULL_ADDER port map (a => a, b => b, c_in => c_in, sum => sum_impl, c_out => carry_impl);

  -- Main process...
  process
  begin
    a <= '0'; b <= '0'; c_in <='0';
    wait for 1 ns;      -- wait a bit

    a <= '0'; b <= '1'; c_in <='0';
    wait for 1 ns;      -- wait a bit

    a <= '1'; b <= '0'; c_in <='X';
    wait for 1 ns;      -- wait a bit

    a <= '1'; b <= '1'; c_in <='0';
    wait for 1 ns;      -- wait a bit

    a <= '0'; b <= '0'; c_in <='1';
    wait for 1 ns;      -- wait a bit

    a <= '0'; b <= '1'; c_in <='1';
    wait for 1 ns;      -- wait a bit

    a <= '1'; b <= '0'; c_in <='1';
    wait for 1 ns;      -- wait a bit

    a <= 'X'; b <= 'X'; c_in <='X';
    wait for 1 ns;      -- wait a bit

    -- Print a note & finish simulation now
    assert false report "Simulation finished" severity note;
    wait;               -- end simulation

  end process;

end architecture;