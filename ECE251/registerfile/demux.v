

module demux4in1out(
    input [1:0] sel,
    input [7:0] in0, in1, in2, in3,
    output reg [7:0] out1
);

always@(*)begin
    case(sel)
    2'b00 : out1 = in0;
    2'b01 : out1 = in1;
    2'b10 : out1 = in2;
    2'b11 : out1 = in3;
    endcase
end
endmodule