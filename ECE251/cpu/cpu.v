`timescale 1ps/1ps

//bulk of computer lies in these include files
`include "../decoder/decoder.v"
`include "../instruction/imem.v"
`include "../mux2in1out/mux221.v"
`include "../ALU/ALU.v"
`include "../Buffer/8bitbuffer.v"
`include "../instruction/ram.v"
`include "../registerfile/regfile.v"
`include "../controller/controller.v"

module cpu();

//these are set to be wires so that they can be continously assigned
wire [15:0] instruction;
wire [3:0] opcode;
wire [2:0] opcode2, shiftamt;
wire [1:0] Rm, Rs1, Rs2;
wire [7:0] constant;
wire [7:0] outputofmem;
wire [7:0] regA, regB, alubuffer, data, databuffer, aluOut;
wire [1:0] aluflag, storedflag;
wire [7:0] pc;

reg clk;

//outputs for the controller that control the rest of the circuit
wire jumpenable, regwrite, writetomem, bufenable, muxsel, ret0;

insdecoder instrucdecoder(instruction, opcode, opcode2, shiftamt, Rm, Rs1, Rs2, constant);
ALU alu1(opcode, shiftamt, regA, alubuffer, aluOut, aluflag);
buffer8bit buf1(data, bufenable, databuffer);
registers regis(regwrite, Rm, Rs1, Rs2, aluflag, databuffer, regA, regB, storedflag);
mux2in1 memorymux(muxsel, outputofmem, aluOut, data);
mux2in1 immediatemux(opcode[3], constant, regB, alubuffer);
ram dataram256(constant, regA, writetomem, writetomem, outputofmem);
Imem instructionmemory(pc, instruction);
controller maincontroller(clk, instruction, storedflag, pc, bufenable, regwrite, muxsel, jumpenable, ret0, writetomem);


//inspired from the way that in c, programs usually end with a return 0 to show that they compiled properly.
//This is the return 0 of our ISA
always @(posedge clk ) begin
    if(ret0 == 1) begin
        $finish;
    end

end

//clock signal
initial begin
clk = 0;
end

always begin
    #10;
    clk = ~clk;
end

initial begin
    $dumpfile("cpu.vcd");

    //testing purposes
    //$dumpvars(0, pc, jumpenable, clk, ret0, opcode, opcode2, shiftamt, Rm, Rs1, Rs2, constant, instruction, regis);
    $dumpvars(0, cpu);



    $display("finish");
end


endmodule