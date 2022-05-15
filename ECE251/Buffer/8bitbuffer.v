module buffer8bit(
    input [7:0] in1,
    input enable,
    output reg [7:0] hold
);

always@(*)begin
    hold = enable ? in1 : 8'bzzzzzzzz;
end

endmodule
