# ECE251_8BITCOMPUTER_DIPTO_TYLER

## ISA
![image](https://user-images.githubusercontent.com/73661624/168410713-08bbaf45-a30e-43de-9657-08f432f23820.png)

The name of our ISA is called the "DiptoAndTyler16bitISA." Our ISA utilizes 16-bit instructions split into three distinct types: Register (R), Immediate (I), and Jump (J). As shown, all R commands begin their opcode with 0. Similarly, all I commands begin with a 1 and all J commands begin with 0000. These distinctions in bit patterns were purposefully made to make our decoder able to instantly recognize a command's type. Since our CPU handles 8-bit data, we use 8-bits for immediates for I-type commands. Due to the fact that we have 256 data memory addresses, we allocate 8-bits for J type commands. Since we include logical shift commands (LLR, LLS), there are 3 bits allocated for specifying shift amount in R-type opcodes.

## Memory Structure
![memory](https://user-images.githubusercontent.com/73661624/168411484-789eac2c-4a5e-4749-b3dc-24fc11a2f668.jpg)

Our computer utilizes a Harvard architecture memory topology. Our read only instruction memory consists of 256 16-bit lines to store commands from our 16 bit opcode and is word addressed. Our random access data memory consists of 256 8-bit lines to store data from our 4 8-bit general purpose registers and is byte addressed. Both memory arrays are initialized with zeros. The instruction memory is designed to be read beginning at 0 from the top and working downwards to address 255. This was done to mimick the way in which we read assembly code in LEGV8.

## Decoder
Our decoder splits up the inputted command according to our ISA. After it determines the command type, it feeds the command through a case switch statement to determine how the controller behaves. 

## Controller
Our controller manages both the timings and data access of the other modules in the computer. After the decoder processes a 16-bit instruction, the controller enables or disables the correct data paths based on the type of command inputted. For I-types and R-types, the correct operation output is MUXed based on the decoded command. For J-types, the controller toggles the jump enable signal to change the PC in branching scenarios.

## ALU
Our ALU performs logical or arithmetic operations on register data based on the opcode parsed into the controller. This module handles the execution for most of the R-type and I-type commands.

## Block Diagram

### R-Type Commands
![image](https://user-images.githubusercontent.com/73661624/168452201-1d712ae4-0cfe-4675-b001-8bc99d854322.png)

### I-Type - Mem Stur
![image](https://user-images.githubusercontent.com/73661624/168452137-389b310e-73f0-4659-848d-9dc9363867bb.png)

### I-Type - Mem Load
![image](https://user-images.githubusercontent.com/73661624/168452161-40c78a57-1f48-4999-809f-53fe71863ec1.png)

### I-Type - Arithmetic/Logical
![image](https://user-images.githubusercontent.com/73661624/168452173-6792ac7d-51bf-41dc-96a2-0d81daa579c6.png)

### J-Type Commands
![image](https://user-images.githubusercontent.com/73661624/168452184-04d03241-b4f6-4555-8b66-33da1d18b91c.png)

## Real Time Demonstration (Factorial 5)
>     ASM Language              Op Code
>     ADDI X1,X0,#5             1100010000000101
>     ADDI X2,X0,#1             1100100000000001
>     MUL  X2,X1,X2             0011100110000000
>     SUBI X1,X1,#1             1101010100000001
>     CMPI X1,#1                1011000100000001
>     BLT  #3                   0000011000000010
>     END                       0000000000000000

![image](https://user-images.githubusercontent.com/73661624/168452265-0b4e46d0-4c0b-4cec-b0b8-b38747cc71fc.png)

For the first clock cycle, all registers are initialized to 0.

For the second cycle, the I-Type command ADDI is run with X1 as the target register to store 5. As shown by the GTKWave waveform for reg1, 05 is stored. Similarly, for the third cycle, ADDI is used once more to store a 1 in X2. 

For the fourth cycle, the R-Type command MUL is run, storing a 5 in X2 after multiplying it with X1. 

For the fifth cycle, the I-Type command SUBI is run, subtracting 1 from X1.

For the sixth cycle, the I-Type command CMPI is run, comparing X1 to immediate value 1. This sets the flag that will be used in the branch loop structure.

For the seventh cycle, the J-Type command BLT is run, checking the flag register for the condition in which to jump back to instruction line 3, or the MUL command. This effectively implements a loop. As shown, the controller enables a jump signal and resets the PC to position 3 everytime the branch condition is met. 

The commands executed in cycles four through seven are repeated until CMPI fails to set a flag and PC reaches the END command. The resulting output, hex 78, can be seen stored in X2. This is factorial 5, or 120 decimal. 
