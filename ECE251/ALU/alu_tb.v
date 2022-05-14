`timescale 10ns/10ns

`include "ALU.V"

module test;

reg [3:0] op;
reg [2:0] shiftamt;
reg [7:0] in1, in2;
reg [7:0] out1;
wire [1:0] flag;
reg clk;

ALU alu1(op, shiftamt, in1, in2, out1, flag);

initial begin
    in1 = 10;
    in2 = 5;
    op = 4'b0001;
    clk = 1;
    shiftamt = 0;
    for(integer i = 0; i<10; i = i+1)begin
        #10;
        clk = ~clk;
    end

    $finish;
end

always @(posedge clk) begin
        op = op + 1;
end

initial begin
    $dumpfile("alu_test.vcd");
    $dumpvars(0, test);
    
    $display("finished");
end 



endmodule