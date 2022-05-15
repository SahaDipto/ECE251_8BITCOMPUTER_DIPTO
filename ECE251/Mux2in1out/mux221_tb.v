
`include "mux221.v"

module mux_tb;

reg sel;
reg [7:0] in1, in2, out1;

mux2in1 imm(sel, in1, in2, out1);


initial begin
    sel = 0;
    in1 = 2;
    in2 = 3;
    #10;
    
    sel = 1;
    #10;

    sel = 0;
end

initial begin
    $dumpfile("mux221_tb.vcd");
    $dumpvars(0, mux_tb);

    $display("finished");
end


endmodule