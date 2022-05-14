`include "controller.v"


module controller_tb();

reg clk;
wire [7:0] pc;
wire be, rw, mmuxsel, je, re0, memwrite;

reg [15:0] instruction;
reg [1:0] flags;


controller test(clk, instruction, flags, pc, be, rw, mmuxsel, je, re0, memwrite);




initial begin
    clk = 0;
    for(integer i = 0; i<10; i=i+1) begin
        #10;
        clk = ~clk;
    end
end

initial begin
    instruction = 16'b1111111111111111;
    #10;
    instruction = 16'b1010101010101010;
    #90;
    instruction = 16'b0000000000000000;
    flags = 2'd0;
end

initial begin
    $dumpfile("controller_tb.vcd");
    $dumpvars(0, pc, clk, instruction, flags, be, rw, mmuxsel, je, re0, memwrite);

end

endmodule