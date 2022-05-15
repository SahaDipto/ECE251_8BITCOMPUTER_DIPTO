// Based on UCDAVIS example decoder files :https://www.ece.ucdavis.edu/~bbaas/281/notes/Handout.verilog6.pdf

module insdecoder(
    input [15:0] instruction,
    output [3:0] opcode,
    output [2:0] opcode2, shiftamt,
    output [1:0] Rm, Rs1, Rs2,
    output [7:0] constant
);

assign opcode = instruction[15:12];
assign Rm = instruction[11:10];
assign Rs1 = instruction[9:8];
assign Rs2 = instruction[7:6];
assign shiftamt = instruction[5:3];
assign constant = instruction[7:0];
assign opcode2 = instruction[11:9];

endmodule