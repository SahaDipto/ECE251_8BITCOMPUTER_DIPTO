
module ram(
    input [7:0] addr, datain,
    input we, clk,
    output wire [7:0] data
);

reg [7:0] ram [255:0];

initial begin
    ram[0] = 0;
end

always @(posedge clk ) begin
    if(we) begin
        ram[addr] = datain;
    end
end

assign dataOut = ram[addr];


endmodule