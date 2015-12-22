library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity ram_tb is
end ram_tb;

architecture TB_ARCHITECTURE of ram_tb is
	-- Component declaration of the tested unit
	component ram
	port(
		clock : in STD_LOGIC;
		address : in STD_LOGIC_VECTOR(7 downto 0);
		dataIn : in STD_LOGIC_VECTOR(15 downto 0);
		dataOut : out STD_LOGIC_VECTOR(15 downto 0);
		MemRead : in STD_LOGIC;
		MemWrite : in STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clock : STD_LOGIC;
	signal address : STD_LOGIC_VECTOR(7 downto 0);
	signal dataIn : STD_LOGIC_VECTOR(15 downto 0);
	signal MemRead : STD_LOGIC;
	signal MemWrite : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal dataOut : STD_LOGIC_VECTOR(15 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : ram
		port map (
			clock => clock,
			address => address,
			dataIn => dataIn,
			dataOut => dataOut,
			MemRead => MemRead,
			MemWrite => MemWrite
		);

	
		clock_period : process
		begin
			clock <= '1';
			wait for 50 ns;
			clock <= '0';
			wait for 50 ns;
		end process;
		
		ram_process : process
		begin
			
			address <= x"01";
			dataIn <= x"000A";
			MemRead <= '0';
			MemWrite <= '1';
			wait for 30 ns;
			
			address <= x"01";
			dataIn <= x"0003";
			MemRead <= '1';
			MemWrite <= '0';
			wait for 30 ns;
			
		end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_ram of ram_tb is
	for TB_ARCHITECTURE
		for UUT : ram
			use entity work.ram(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_ram;

