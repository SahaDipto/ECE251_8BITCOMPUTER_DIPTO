
module Imem(
    input [7:0] inA,
    output wire [15:0] instruc
);

reg [15:0] ram [255:0];

initial begin
    $readmemb("program.txt", ram);
end

assign instruc = ram[inA];


endmodule