

module decoder(
    input clk,
    input [15:0] instruction,
    input [1:0] flags,
    output reg bufenable, regwrite, muxsel, jumpenable, ret0, writetomem
);

always @(posedge clk ) begin

    if (instruction == 16'd0) begin
        ret0 = 0;
        $finish;
    end
   case(instruction[15:12]) 
   4'b0000 : begin 
       case(instruction[11:9])
       3'b001 : jumpenable = 1;
       3'b010 : begin
           if(flags[1]==0) begin
               jumpenable = 1;
           end else begin
               jumpenable = 0;
           end
       end
       3'b011 : begin
           if(flags[1]==1) begin
               jumpenable = 1;
           end else begin
               jumpenable = 0;
           end
       end
       3'b100: begin 
           if(flags[0] == 0) begin
               jumpenable = 1;
           end else begin
               jumpenable = 1;
           end
       end
       3'b101: begin
           if(flags[0] == 1) begin
               jumpenable = 1;
           end else begin
               jumpenable = 1;
           end
       end
       endcase
   end
   4'b1110 : begin 
       muxsel <= 1;
       #2;
       bufenable <= 1;
       #2;
       regwrite <= 1;
       #2;
       regwrite = 0;
       bufenable = 0;
       muxsel = 0;
   end
   4'b1111 : begin
       writetomem = 1;
       #2;
       writetomem = 0;
   end
   4'b0001 : begin
       bufenable =  1;
       #2;
       regwrite = 1;
       #2;
       regwrite = 0;
       bufenable = 0;
   end
   4'b0010 : begin
       bufenable =  1;
       #2;
       regwrite = 1;
       #2;
       regwrite = 0;
       bufenable = 0;
   end
   4'b0011 : begin
       bufenable =  1;
       #2;
       regwrite = 1;
       #2;
       regwrite = 0;
       bufenable = 0;
   end
   4'b0100 : begin
       bufenable =  1;
       #2;
       regwrite = 1;
       #2;
       regwrite = 0;
       bufenable = 0;
   end
   4'b0101 : begin
       bufenable =  1;
       #2;
       regwrite = 1;
       #2;
       regwrite = 0;
       bufenable = 0;
   end
   4'b0110 : begin
       bufenable =  1;
       #2;
       regwrite = 1;
       #2;
       regwrite = 0;
       bufenable = 0;
   end
   4'b0111 : begin
       bufenable =  1;
       #2;
       regwrite = 1;
       #2;
       regwrite = 0;
       bufenable = 0;
   end
   4'b1000 : begin
       bufenable =  1;
       #2;
       regwrite = 1;
       #2;
       regwrite = 0;
       bufenable = 0;
   end
   4'b1001 : begin
       bufenable =  1;
       #2;
       regwrite = 1;
       #2;
       regwrite = 0;
       bufenable = 0;
   end
   4'b1010 : begin
       bufenable =  1;
       #2;
       regwrite = 1;
       #2;
       regwrite = 0;
       bufenable = 0;
   end
   4'b1011 : begin
       bufenable =  1;
       #2;
       regwrite = 1;
       #2;
       regwrite = 0;
       bufenable = 0;
   end
   4'b1100 : begin
       bufenable =  1;
       #2;
       regwrite = 1;
       #2;
       regwrite = 0;
       bufenable = 0;
   end
   4'b1101 : begin
       bufenable =  1;
       #2;
       regwrite = 1;
       #2;
       regwrite = 0;
       bufenable = 0;
   end
   4'b1110 : begin
       bufenable =  1;
       #2;
       regwrite = 1;
       #2;
       regwrite = 0;
       bufenable = 0;
   end
   4'b1111 : begin
       bufenable =  1;
       #2;
       regwrite = 1;
       #2;
       regwrite = 0;
       bufenable = 0;
   end

endcase
end

endmodule