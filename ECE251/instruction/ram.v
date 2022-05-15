
module ram(
    input [7:0] addr, datain,
    input we, clk,
    output wire [7:0] data
);

reg [7:0] ram [255:0];
reg [7:0] test;
initial begin
    ram[0] = 0;
    test = ram[addr];
end

always @(posedge clk ) begin
    if(we) begin
        ram[addr] = datain;
    end
end

assign data = ram[addr];


endmodule