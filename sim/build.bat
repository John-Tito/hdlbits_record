
iverilog -o Always_case2_tb.vpp Always_case2.v Always_case2_tb.v
vvp -n Always_case2_tb.vpp -lxt2
gtkwave test_tb.lxt
@REM gtkwave <*.vcd>

@REM iverilog -o tb *v
@REM vvp -n tb -lxt2
@REM gtkwave test_tb.lxt
@REM iverilog -tvhdl -o Always_case2.v Always_case2_tb.v
@REM pause

@echo off
