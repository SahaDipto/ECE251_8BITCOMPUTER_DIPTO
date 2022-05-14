`include "decoder.v"


module decoder_tb();

reg [15:0] rand;
wire [15:0] instruction;
assign instruction = rand;


wire [3:0] opcode;
wire [2:0] opcode2, shiftamt;
wire [1:0] Rm, Rs1, Rs2;
wire [7:0] constant;

decoder decodertest(instruction, opcode, opcode2, shiftamt, Rm, Rs1, Rs2, constant);

initial begin
    rand = 0;
    #10;
    rand = 1;
    #10;
    rand = 15;
end

initial begin
    $dumpfile("decoder_tb.vcd");
    $dumpvars(0, opcode, opcode2, instruction, rand, constant);

end
endmodule