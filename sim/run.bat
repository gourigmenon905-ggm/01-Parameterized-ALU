@echo off

iverilog -o alu_sim ../rtl/alu.v ../tb/alu_tb.v

vvp alu_sim

gtkwave alu.vcd

pause