module wirereg();

wire x;
reg z;

reg y;

assign x = z;
assign x = y;

initial begin
    z = 1;
    #10;
    z = 2;
    #10;
    y = 1;
end


initial begin
    $dumpfile("garbage.vcd");
    $dumpvars(0, wirereg);
end
endmodule