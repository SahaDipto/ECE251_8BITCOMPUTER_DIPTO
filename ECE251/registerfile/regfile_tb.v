`include "regfile.v"

module regfile_tb();

reg clk, we;
reg [1:0] writesel, selA, selB;
reg [7:0] datain, outA, outB;
reg [1:0] flagin, flagout;

registers reg1( we, writesel, selA, selB, flagin, datain, outA, outB, flagout);

initial begin
    clk = 1;
    we = 1;
    writesel = 2'b00;
    selA = 2'b00;
    selB = 2'b00;
    flagin = 2'b00;
    datain = 12;

    for(integer i = 0; i<20; i = i+1) begin
        clk = ~clk;
        #10;
    end
end

initial begin
    #20;
    we = 0;
    writesel = 1;
    datain = 3;

    #20;
    we = 1;
    writesel = 2;
    selA = 2;
    selB = 2;
    datain = 1;

    #10;
    writesel = 3;
    datain = 2;
    #10;

    
    #20;
    we = 0;
    selA = 3;
    selB = 2;

end

initial begin
    $dumpfile("regfile_tb.vcd");
    $dumpvars(0, regfile_tb);

    $display("finished");
end

endmodule