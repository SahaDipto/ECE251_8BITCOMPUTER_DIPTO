# ECE251_8BITCOMPUTER_DIPTO_TYLER

## ISA
![image](https://user-images.githubusercontent.com/73661624/168410713-08bbaf45-a30e-43de-9657-08f432f23820.png)

Our ISA utilizes 16-bit instructions split into three distinct types: Register (R), Immediate (I), and Jump (J). As shown, all R commands begin their opcode with 0. Similarly, all I commands begin with a 1 and all J commands begin with 0000. These distinctions in bit patterns were purposefully made to make our decoder able to instantly recognize a command's type. Since our CPU handles 8-bit data, we use 8-bits for immediates for I-type commands. Due to the fact that we have 256 data memory addresses, we allocate 8-bits for J type commands. Since we include logical shift commands (LLR, LLS), there are 3 bits allocated for specifying shift amount in R-type opcodes.

## Memory Structure
![memory](https://user-images.githubusercontent.com/73661624/168411484-789eac2c-4a5e-4749-b3dc-24fc11a2f668.jpg)

Our computer utilizes a Harvard architecture memory topology. Our read only instruction memory consists of 256 16-bit lines to store commands from our 16 bit opcode and is word addressed. Our random access data memory consists of 256 8-bit lines to store data from our 4 8-bit general purpose registers and is byte addressed. Both memory arrays are initialized with zeros. The instruction memory is designed to be read beginning at 0 from the top and working downwards to 256. This was done to mimick the way in which we read assembly code in LEGV8.

## Decoder

Our decoder splits up the inputted command according to our ISA. After it determines the command type, it feeds the command through a case switch statement to determine how the controller behaves. 
## Controller

## ALU

## Block Diagram

## Real Time Demonstration
