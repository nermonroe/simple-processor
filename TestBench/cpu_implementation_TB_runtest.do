SetActiveLib -work
comp -include "$dsn\src\cpu_types.vhd" 
comp -include "$dsn\src\ram_memory.vhd" 
comp -include "$dsn\src\register_file.vhd" 
comp -include "$dsn\src\alu_operation.vhd" 
comp -include "$dsn\src\signals.vhd" 
comp -include "$dsn\src\cpu_implementation.vhd" 
comp -include "$dsn\src\TestBench\cpu_implementation_TB.vhd" 
asim +access +r TESTBENCH_FOR_cpu_implementation 
wave 
wave -noreg clock
wave -noreg instruction_cycle
wave -noreg R0
wave -noreg R1
wave -noreg R2
wave -noreg R3
wave -noreg R4
wave -noreg R5
wave -noreg R6
wave -noreg R7
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\cpu_implementation_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_cpu_implementation 
