; Study of logical instructions using EMU 8086 -> {AND, OR, NOT, TEST}; {SAR, SHR, SHL, SAL, ROR, ROL, RCR, RCL}

MOV AX, 32H
MOV BX, 12H
AND AX, BX
NOT BX
OR AX, BX


; TEST -> Works like AND but it doesn't change actual value like AND does
; TEST -> Used to check a specific bit. (Flags are affected). Used to check if a number is even or odd. Used to determine a specific bit of a number

; 1. Even -> LSB = 0. Odd -> LSB = 1
                  
MOV AX, 00110011B
TEST AX, 00000001B

JZ EVEN
JNZ ODD

EVEN:
MOV CX, AX
JMP END

ODD:
MOV DX, AX
JMP END

END:


; 2. Check if a number is positive or negative. Check MSB values for that.      

MOV AX, 00110011B
TEST AX, 00000001B

JZ EVEN
JNZ ODD

EVEN:
MOV CX, AX
JMP END

ODD:
MOV DX, AX
JMP END

END:


; 3. Usage of SHL & SAL. Both works the same way. SHL/SAL -> Shifts bits to left and adds '0'

MOV AL, 11010110B
SHL AL, 3
SAL AL, 2


; 4. Usage of SAR & SHR. SAR -> Repeats MSB. SHR -> Adds '0' to MSB. Parity flag '1' -> even number of '1'

MOV AL, 11010110B
SAR AL, 3
SHR AL, 2


; 5. Usage of ROR -> Rotate right without carry, ROL -> Rotate left without carry 

MOV AL, 10110111B
ROL AL, 3
ROR AL, 3


; 6. Usage of RCR & RCL.

MOV AL, 11010110B
RCR AL, 2
RCL AL, 2


; 7. Among 3 numbers put '0' who's smaller. AX, BX & CX

MOV AX, 50H
MOV BX, 40H
MOV CX, 30H

SUB AX, BX

TEST AX, 80H

JZ POS
JNZ NEGA

NEGA:
MOV AX, 00H
JMP END

POS:
SUB BX, CX
TEST BX, 80H

JZ POSI
JNZ NEGAS


POSI:
MOV CX, 00H
JMP END

NEGAS:
MOV BX, 00H
JMP END

END:


