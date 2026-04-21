@echo off 
iverilog -o %1.vvp %1.v %1_tb.v 
vvp %1.vvp 
start "" "F:\iverilog\gtkwave\bin\gtkwave.exe" %1.vcd 
