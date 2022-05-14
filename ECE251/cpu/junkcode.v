// assign opcode = instruction[15:12];
// assign Rm = instruction[11:10];
// assign Rs1 = instruction[9:8];
// assign Rs2 = instruction[7:6];
// assign shiftamt = instruction[5:3];
// assign constant = instruction[7:0];
// assign opcode2 = instruction[11:9];

//____________________________________________________________________________________________________________________________
//decoder maindecoder(clk, instruction, pc, storedflag, bufenable, regwrite, muxsel, jumpenable, ret0, writetomem);

// always @(posedge clk ) begin

//     if (instruction == 16'd0) begin
//         ret0 = 0;
//         $finish;
//     end
//    case(instruction[15:12]) 
//    4'b0000 : begin 
//        case(instruction[11:9])
//        3'b001 : jumpenable = 1;
//        3'b010 : begin
//            if(storedflag[1]==0) begin
//                jumpenable = 1;
//            end else begin
//                jumpenable = 0;
//            end
//        end
//        3'b011 : begin
//            if(storedflag[1]==1) begin
//                jumpenable = 1;
//            end else begin
//                jumpenable = 0;
//            end
//        end
//        3'b100: begin 
//            if(storedflag[0] == 0) begin
//                jumpenable = 1;
//            end else begin
//                jumpenable = 1;
//            end
//        end
//        3'b101: begin
//            if(storedflag[0] == 1) begin
//                jumpenable = 1;
//            end else begin
//                jumpenable = 1;
//            end
//        end
//        endcase
//    end
//    4'b1110 : begin 
//        muxsel <= 1;
//        #2;
//        bufenable <= 1;
//        #2;
//        regwrite <= 1;
//        #2;
//        regwrite = 0;
//        bufenable = 0;
//        muxsel = 0;
//    end
//    4'b1111 : begin
//        writetomem = 1;
//        #2;
//        writetomem = 0;
//    end
//    4'b0001 : begin
//        bufenable =  1;
//        #2;
//        regwrite = 1;
//        #2;
//        regwrite = 0;
//        bufenable = 0;
//    end
//    4'b0010 : begin
//        bufenable =  1;
//        #2;
//        regwrite = 1;
//        #2;
//        regwrite = 0;
//        bufenable = 0;
//    end
//    4'b0011 : begin
//        bufenable =  1;
//        #2;
//        regwrite = 1;
//        #2;
//        regwrite = 0;
//        bufenable = 0;
//    end
//    4'b0100 : begin
//        bufenable =  1;
//        #2;
//        regwrite = 1;
//        #2;
//        regwrite = 0;
//        bufenable = 0;
//    end
//    4'b0101 : begin
//        bufenable =  1;
//        #2;
//        regwrite = 1;
//        #2;
//        regwrite = 0;
//        bufenable = 0;
//    end
//    4'b0110 : begin
//        bufenable =  1;
//        #2;
//        regwrite = 1;
//        #2;
//        regwrite = 0;
//        bufenable = 0;
//    end
//    4'b0111 : begin
//        bufenable =  1;
//        #2;
//        regwrite = 1;
//        #2;
//        regwrite = 0;
//        bufenable = 0;
//    end
//    4'b1000 : begin
//        bufenable =  1;
//        #2;
//        regwrite = 1;
//        #2;
//        regwrite = 0;
//        bufenable = 0;
//    end
//    4'b1001 : begin
//        bufenable =  1;
//        #2;
//        regwrite = 1;
//        #2;
//        regwrite = 0;
//        bufenable = 0;
//    end
//    4'b1010 : begin
//        bufenable =  1;
//        #2;
//        regwrite = 1;
//        #2;
//        regwrite = 0;
//        bufenable = 0;
//    end
//    4'b1011 : begin
//        bufenable =  1;
//        #2;
//        regwrite = 1;
//        #2;
//        regwrite = 0;
//        bufenable = 0;
//    end
//    4'b1100 : begin
//        bufenable =  1;
//        #2;
//        regwrite = 1;
//        #2;
//        regwrite = 0;
//        bufenable = 0;
//    end
//    4'b1101 : begin
//        bufenable =  1;
//        #2;
//        regwrite = 1;
//        #2;
//        regwrite = 0;
//        bufenable = 0;
//    end
//    4'b1110 : begin
//        bufenable =  1;
//        #2;
//        regwrite = 1;
//        #2;
//        regwrite = 0;
//        bufenable = 0;
//    end
//    4'b1111 : begin
//        bufenable =  1;
//        #2;
//        regwrite = 1;
//        #2;
//        regwrite = 0;
//        bufenable = 0;
//    end

// endcase
// end
// always @(posedge clk ) begin
//     if(ret0 == 1) begin
//         $finish;
//     end

// end


// always @(posedge clk ) begin
//   if(je == 1) begin
//         pc = constant;
//         je = 0;
//     end
//     if(je == 0) begin
//         pc = pc + 1;
//     end

//     #20;
// end

//_____________________________________________________________________

// initial begin
//     for(integer i = 0; i<10; i = i+1) begin
//         #10;
//         clk = ~clk;
//     end
// end
//______________________________________________________________________

// pc = -1;
// rw = 0;
// je = 0;
// mmsel = 0;
// wm = 0;
// be = 0;

//_____________________________________________________________________

// clk = 0;
// pc = -1;
// regwrite = 0;
// jumpenable = 0;
// muxsel = 0;
// writetomem = 0;

// assign jumpenable = je;
// assign regwrite = rw;
// assign writetomem = wm;
// assign bufenable = be;
// assign muxsel = mmsel;
// assign ret0 = re0;

//___________________________________

// if(regifile[3'b000] != 0) begin
    //     regifile[3'b000] = 0;
    // end

    //regifile[2'b10] = 0;
    //regifile[2'b11] = 0;

//____________________________________________
//reg [7:0] regifile [1:0]; 

//test = regifile[selwrite];

// always @(*)begin
//     if(~we)begin
//         holdflag = flags;
//         case(outselA)
//         2'd0 : A1 = reg0;
//         2'd1 : A1 = reg1;
//         2'd2 : A1 = reg2;
//         2'd3 : A1 = reg3;
//         endcase
//         case(outselB)
//         2'd0 : B1= reg0;
//         2'd1 : B1= reg1;
//         2'd2 : B1= reg2;
//         2'd3 : B1= reg3;
//         endcase
//     end

// end