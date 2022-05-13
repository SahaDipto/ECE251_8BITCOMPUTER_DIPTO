`include "8bitbuffer.v"


module test;


reg [7:0] in1, hold1;
reg clk, enable;
wire [7:0] data;

assign data = in1;

buffer8bit buffer1(data, enable, hold1);

initial begin
    clk = 1;
    enable = 1;
    in1 = 10;
    for(integer i = 0; i < 10; i=i+1)begin
        clk = ~clk;
        #10;
    end
    $finish;
end

always @(posedge clk ) begin
    enable = ~enable;
    in1 = in1+1;
end

initial begin
    $dumpfile("buffer_tb.vcd");
    $dumpvars(0, test);

    $display("finished");
end


endmodule