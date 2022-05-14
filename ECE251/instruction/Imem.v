
module Imem(
    input [7:0] inA,
    output wire [15:0] instruc
);

reg [15:0] ram [255:0];

initial $readmemb("program.txt", ram);


assign instruc = ram[inA];


endmodule