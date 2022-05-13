`define NOT 3'b000
`define AND 3'b001
`define OR 3'b010
`define MUL_CMPI 3'b011
`define ADD 3'b100
`define SUB 3'b101
`define SIX 3'b110
`define SVN 3'b111

module ALU(
    input [3:0] opcase,
    input [2:0] shiftamt,
    input [7:0] A, B,
    output reg [7:0] out1,
    output wire [1:0] flags 
);
    reg [1:0] cmpflag;
    reg [7:0] cmpreg;
    always@(*)begin
        case(opcase[2:0])
        `NOT : out1 = ~A;
        `AND : out1 = A&B;
        `OR : out1 = A | B;
        `ADD : out1 = A + B;   
        `SUB : out1 = A + (~B + 8'b00000001);     // A SUB B -> A ADD (-B)
        default : out1 = 8'bzzzzzzzz;
        endcase

        if(opcase[3] == 0) begin
            case(opcase[2:0])
            `MUL_CMPI : out1 = A*B;
            `SIX : out1 = A >> shiftamt;
            `SVN : out1 = A << shiftamt; 
            endcase
        end

        if(opcase[3] == 1) begin
            case(opcase[2:0])
            `MUL_CMPI : begin
                out1 = 8'bzzzzzzzz;
                cmpreg = A - B;
                cmpflag[1] = (A>B);
                cmpflag[0] = (cmpreg == 8'b00000000);
            end
            endcase
        end
    end


    assign flags[1] = cmpflag;  // Zero

endmodule
