//Based on : https://courses.cs.washington.edu/courses/cse370/10sp/pdfs/lectures/regfile.txt

module registers(
    input we,
    input [1:0] selwrite, outselA, outselB,
    input [1:0] flags,
    input [7:0] data,
    output wire [7:0] A, B,
    output wire [1:0] outflags
);

 //creates 8 bit register with depth 4


reg [7:0] reg0, reg1, reg2, reg3;
reg [7:0] A1, B1;
reg [1:0] holdflag;
reg [7:0] test;

initial begin
    reg0 = 0;
    reg1 = 0;
    reg2 = 0;
    reg3 = 0;
end

always @(posedge we) begin
    
    if(we) begin
        case(selwrite)
        2'd0 : reg0 = data;
        2'd1 : reg1 = data;
        2'd2 : reg2 = data;
        2'd3 : reg3 = data;
        endcase
    end
end

always@(*) begin
    
    holdflag = flags;
    case(outselA)
    2'd0 : A1 = reg0;
    2'd1 : A1 = reg1;
    2'd2 : A1 = reg2;
    2'd3 : A1 = reg3;
    endcase
    case(outselB)
    2'd0 : B1= reg0;
    2'd1 : B1= reg1;
    2'd2 : B1= reg2;
    2'd3 : B1= reg3;
    endcase
end


assign A = A1;
assign B = B1;
assign outflags = holdflag;

endmodule