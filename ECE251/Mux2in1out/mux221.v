module mux2in1(
    input sel,
    input [7:0] inA, inB,
    output reg [7:0] out
);

always@(*) begin
    out = sel? inA : inB;
end

endmodule