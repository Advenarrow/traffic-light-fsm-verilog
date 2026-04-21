module fsm_tb;
reg  clk, reset;
wire red, green, yellow;
fsm dut (
    .clk    (clk),
    .reset  (reset),
    .red    (red),
    .green  (green),
    .yellow (yellow)
);
initial clk = 1;
always #1 clk = ~clk;
initial begin
    $dumpfile("fsm.vcd");
    $dumpvars(0, fsm_tb);
    reset=1;#10

    reset=0;
    #40$finish;
end
initial begin
    $monitor("Time=%0t | clk=%b reset=%b | RED=%b GREEN=%b YELLOW=%b",
              $time, clk, reset, red, green, yellow);
end
endmodule