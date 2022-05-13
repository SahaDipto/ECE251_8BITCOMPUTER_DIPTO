`include "../instruction/imem.v"
`include "../mux2in1out/mux221.v"
`include "../ALU/ALU.v"
`include "../Buffer/8bitbuffer.v"
`include "../instruction/ram.v"
`include "../registerfile/regfile.v"
`include "pcdecoder.v"

module cpu();

wire [15:0] instruction;
wire [3:0] opcode;
wire [2:0] opcode2, shiftamt;
wire [1:0] Rm, Rs1, Rs2;
wire [7:0] constant;
wire [7:0] outputofmem;
wire [7:0] regA, regB, alubuffer, data, databuffer, aluOut;
wire [1:0] aluflag, storedflag;

reg [7:0] pc; 
reg clk;

reg je, rw, wm, be, mmsel, re0;
wire jumpenable, regwrite, writetomem, bufenable, muxsel, ret0;

assign jumpenable = je;
assign regwrite = rw;
assign writetomem = wm;
assign bufenable = be;
assign muxsel = mmsel;
assign ret0 = re0;

assign opcode = instruction[15:12];
assign Rm = instruction[11:10];
assign Rs1 = instruction[9:8];
assign Rs2 = instruction[7:6];
assign shiftamt = instruction[5:3];
assign constant = instruction[7:0];
assign opcode2 = instruction[11:9];

ALU alu1(opcode, shiftamt, regA, alubuffer, aluOut, aluflag);
buffer8bit buf1(data, bufenable, databuffer);
registers regis(regwrite, Rm, Rs1, Rs2, aluflag, databuffer, regA, regB, storedflag);
mux2in1 memorymux(muxsel, aluOut, outputofmem, data);
mux2in1 immediatemux(opcode[3], constant, regB, alubuffer);
ram dataram256(constant, regA, writetomem, writetomem, outputofmem);
Imem instructionmemory(pc, instruction);

decoder maindecoder(clk, instruction, storedflag, bufenable, regwrite, muxsel, jumpenable, ret0, writetomem);

// always @(posedge clk ) begin

//     if (instruction == 16'd0) begin
//         ret0 = 0;
//         $finish;
//     end
//    case(instruction[15:12]) 
//    4'b0000 : begin 
//        case(instruction[11:9])
//        3'b001 : jumpenable = 1;
//        3'b010 : begin
//            if(storedflag[1]==0) begin
//                jumpenable = 1;
//            end else begin
//                jumpenable = 0;
//            end
//        end
//        3'b011 : begin
//            if(storedflag[1]==1) begin
//                jumpenable = 1;
//            end else begin
//                jumpenable = 0;
//            end
//        end
//        3'b100: begin 
//            if(storedflag[0] == 0) begin
//                jumpenable = 1;
//            end else begin
//                jumpenable = 1;
//            end
//        end
//        3'b101: begin
//            if(storedflag[0] == 1) begin
//                jumpenable = 1;
//            end else begin
//                jumpenable = 1;
//            end
//        end
//        endcase
//    end
//    4'b1110 : begin 
//        muxsel <= 1;
//        #2;
//        bufenable <= 1;
//        #2;
//        regwrite <= 1;
//        #2;
//        regwrite = 0;
//        bufenable = 0;
//        muxsel = 0;
//    end
//    4'b1111 : begin
//        writetomem = 1;
//        #2;
//        writetomem = 0;
//    end
//    4'b0001 : begin
//        bufenable =  1;
//        #2;
//        regwrite = 1;
//        #2;
//        regwrite = 0;
//        bufenable = 0;
//    end
//    4'b0010 : begin
//        bufenable =  1;
//        #2;
//        regwrite = 1;
//        #2;
//        regwrite = 0;
//        bufenable = 0;
//    end
//    4'b0011 : begin
//        bufenable =  1;
//        #2;
//        regwrite = 1;
//        #2;
//        regwrite = 0;
//        bufenable = 0;
//    end
//    4'b0100 : begin
//        bufenable =  1;
//        #2;
//        regwrite = 1;
//        #2;
//        regwrite = 0;
//        bufenable = 0;
//    end
//    4'b0101 : begin
//        bufenable =  1;
//        #2;
//        regwrite = 1;
//        #2;
//        regwrite = 0;
//        bufenable = 0;
//    end
//    4'b0110 : begin
//        bufenable =  1;
//        #2;
//        regwrite = 1;
//        #2;
//        regwrite = 0;
//        bufenable = 0;
//    end
//    4'b0111 : begin
//        bufenable =  1;
//        #2;
//        regwrite = 1;
//        #2;
//        regwrite = 0;
//        bufenable = 0;
//    end
//    4'b1000 : begin
//        bufenable =  1;
//        #2;
//        regwrite = 1;
//        #2;
//        regwrite = 0;
//        bufenable = 0;
//    end
//    4'b1001 : begin
//        bufenable =  1;
//        #2;
//        regwrite = 1;
//        #2;
//        regwrite = 0;
//        bufenable = 0;
//    end
//    4'b1010 : begin
//        bufenable =  1;
//        #2;
//        regwrite = 1;
//        #2;
//        regwrite = 0;
//        bufenable = 0;
//    end
//    4'b1011 : begin
//        bufenable =  1;
//        #2;
//        regwrite = 1;
//        #2;
//        regwrite = 0;
//        bufenable = 0;
//    end
//    4'b1100 : begin
//        bufenable =  1;
//        #2;
//        regwrite = 1;
//        #2;
//        regwrite = 0;
//        bufenable = 0;
//    end
//    4'b1101 : begin
//        bufenable =  1;
//        #2;
//        regwrite = 1;
//        #2;
//        regwrite = 0;
//        bufenable = 0;
//    end
//    4'b1110 : begin
//        bufenable =  1;
//        #2;
//        regwrite = 1;
//        #2;
//        regwrite = 0;
//        bufenable = 0;
//    end
//    4'b1111 : begin
//        bufenable =  1;
//        #2;
//        regwrite = 1;
//        #2;
//        regwrite = 0;
//        bufenable = 0;
//    end

// endcase
// end
// always @(posedge clk ) begin
//     if(ret0 == 1) begin
//         $finish;
//     end

// end

initial begin
// clk = 0;
// pc = -1;
// regwrite = 0;
// jumpenable = 0;
// muxsel = 0;
// writetomem = 0;
clk = 0;
pc = -1;
rw = 0;
je = 0;
mmsel = 0;
wm = 0;
end


endmodule