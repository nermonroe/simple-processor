SetActiveLib -work
comp -include "c:\Users\Nerissa\Downloads\CPU-2015-12-05\CPU\src\RAM.vhd" 
comp -include "$dsn\src\TestBench\ram_TB.vhd" 
asim +access +r TESTBENCH_FOR_ram 
wave 
wave -noreg clock
wave -noreg address
wave -noreg dataIn
wave -noreg dataOut
wave -noreg MemRead
wave -noreg MemWrite
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\ram_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_ram 
