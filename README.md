# ECE251_8BITCOMPUTER_DIPTO_TYLER

## ISA
![image](https://user-images.githubusercontent.com/73661624/168518660-31f5fd94-3834-4bee-b2ec-0a5caa68b658.png)

The name of our ISA is called the "DiptoAndTyler16bitISA." Our ISA utilizes 16-bit instructions split into three distinct types: Register (R), Immediate (I), and Jump (J). As shown, all R commands begin their opcode with 0. Similarly, all I commands begin with a 1 and all J commands begin with 0000. These distinctions in bit patterns were purposefully made to make our decoder able to instantly recognize a command's type. Since our CPU handles 8-bit data, we use 8-bits for immediates for I-type commands. Due to the fact that we have 256 data memory addresses, we allocate 8-bits for J type commands. Since we include logical shift commands (LLR, LLS), there are 3 bits allocated for specifying shift amount in R-type opcodes. For STUR, it sturs the value of RS1, and for LDUR it loads into RM.

## Memory Structure
![memory](https://user-images.githubusercontent.com/73661624/168411484-789eac2c-4a5e-4749-b3dc-24fc11a2f668.jpg)

Our computer utilizes a Harvard architecture memory topology, it has separate instruction and data memory. Our read only instruction memory consists of 256 16-bit lines to store commands from our 16 bit opcode and is word addressed. Our random access data memory consists of 256 8-bit lines to store data from our 4 8-bit general purpose registers and is byte addressed. Both memory arrays are initialized with zeros. The instruction memory is designed to be read beginning at 0 from the top and working downwards to address 255. This was done to mimick the way in which we read assembly code in LEGV8. We also have 4 8-bit register files that are all preset to 0.

## Decoder
Our decoder splits up the inputted command according to our ISA. After it determines the command type, it feeds the command through a case switch statement to determine how the controller behaves. 

## Controller
Our controller manages both the timings and data access of the other modules in the computer. After the decoder processes a 16-bit instruction, the controller enables or disables the correct data paths based on the type of command inputted. The controller handles register write enables, memory write enable, jump enable, and ret0. ret0 finishes the command and stops the computer. For I-types and R-types, the correct operation output is MUXed based on the decoded command. For J-types, the controller toggles the jump enable signal to change the PC in branching scenarios, and also accepts flags that are then used in the conditional branching commands. The flags are preset to anyvalue. You must first preset the flag with CMPI before any conditional branch.

## ALU
Our ALU performs logical or arithmetic operations on register data based on the opcode parsed into the controller. This module handles the execution for most of the R-type and I-type commands. 

## Block Diagram

### R-Type Commands
![image](https://user-images.githubusercontent.com/73661624/168454807-0177bf9d-5cbe-4426-a63a-260496325be0.png)

### I-Type - Mem Access
![image](https://user-images.githubusercontent.com/73661624/168454901-03550f38-7b67-4851-b287-599f16f7464a.png)

### I-Type - Arithmetic/Logical
![image](https://user-images.githubusercontent.com/73661624/168454892-048b6675-5fc3-4053-a220-98611696dba3.png)

### J-Type Commands
![image](https://user-images.githubusercontent.com/73661624/168454859-b61514a3-99ea-45dc-8d02-8ac88413422c.png)


## Real Time Demonstration (Factorial 5)
>     ASM Language              Op Code
>     ADDI X1,X0,#5             1100010000000101 //line 0
>     ADDI X2,X0,#1             1100100000000001
>     MUL  X2,X1,X2             0011100110000000
>     SUBI X1,X1,#1             1101010100000001
>     CMPI X1,#1                1011000100000001
>     BGT  #2                   0000011000000010
>     STUR X2 #1                1111001000000001
>     LDUR X3 #1                1110110000000001
>     END                       0000000000000000

![image](https://user-images.githubusercontent.com/73661624/168452265-0b4e46d0-4c0b-4cec-b0b8-b38747cc71fc.png)

For the first clock cycle, all registers are initialized to 0.

For the second cycle, the I-Type command ADDI is run with X1 as the target register to store 5. As shown by the GTKWave waveform for reg1, 05 is stored. Similarly, for the third cycle, ADDI is used once more to store a 1 in X2. 

For the fourth cycle, the R-Type command MUL is run, storing a 5 in X2 after multiplying it with X1. 

For the fifth cycle, the I-Type command SUBI is run, subtracting 1 from X1.

For the sixth cycle, the I-Type command CMPI is run, comparing X1 to immediate value 1. This sets the flag that will be used in the branch loop structure.

For the seventh cycle, the J-Type command BLT is run, checking the flag register for the condition in which to jump back to instruction line 2, or the MUL command. This effectively implements a loop. As shown, the controller enables a jump signal and resets the PC to position 2 everytime the branch condition is met. 
 
On the 18th cycle After it is done branching and determines that the value in X1 is not greater than the immediate 1 and does not branch. The resulting output, hex 78, can be seen stored in X2. This is factorial 5, or 120 decimal. 

On the 19th cycle it stores the value of X2 into data memory at address 1.
On the 20th cycle it loads the value in data memory at address 1 into register X3.
