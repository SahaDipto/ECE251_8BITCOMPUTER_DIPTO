module registers(
    input we,
    input [1:0] selwrite, outselA, outselB,
    input [1:0] flags,
    input [7:0] data,
    output wire [7:0] A, B,
    output wire [1:0] outflags
);

//reg [7:0] regifile [1:0];  //creates an 8 bit register with depth 8


reg [7:0] reg0, reg1, reg2, reg3; /* reg4, reg5, reg6, reg7, reg8;*/
reg [7:0] A1, B1;
reg [1:0] holdflag;
reg [7:0] test;

initial begin
    reg0 = 0;
    reg1 = 0;
    reg2 = 0;
    reg3 = 0;
    //regifile[2'b10] = 0;
    //regifile[2'b11] = 0;
end

always @(*) begin
    // if(regifile[3'b000] != 0) begin
    //     regifile[3'b000] = 0;
    // end
    if(we) begin
        case(selwrite)
        2'd0 : reg0 = data;
        2'd1 : reg1 = data;
        2'd2 : reg2 = data;
        2'd3 : reg3 = data;
        endcase
    end
end

//test = regifile[selwrite];

always @(*)begin
    if(~we)begin
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

end

assign A = A1;
assign B = B1;
assign outflags = holdflag;

endmodule