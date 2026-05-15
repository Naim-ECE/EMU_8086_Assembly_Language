.model small
.stack 100h
.data

MSG1 DB "Enter a number: $"
PRIME DB 10,13,"The number is PRIME$"
NOTPRIME DB 10,13,"The number is NOT PRIME$"

NUM DW 0

.code
main proc
    MOV AX, @data
    MOV DS, AX

    LEA DX, MSG1
    MOV AH, 09H
    INT 21H

    MOV BX, 0

INPUT:
    MOV AH, 01H
    INT 21H

    CMP AL, 13
    JE INPUT_TAKEN

    SUB AL, 30H 

    MOV AH, 0
    MOV CX, AX 

    MOV AX, BX
    MOV DX, 0
    MOV BX, 10
    MUL BX    

    ADD AX, CX
    MOV BX, AX

    JMP INPUT

INPUT_TAKEN:
    MOV NUM, BX

    
    MOV AX, NUM
    CMP AX, 2
    JL NOT_PRIME

    MOV CX, 2

CHECK:
    MOV AX, NUM
    MOV DX, 0
    DIV CX

    CMP DX, 0
    JE NOT_PRIME

    INC CX
    MOV AX, NUM
    CMP CX, AX
    JL CHECK
    
    LEA DX, PRIME
    MOV AH, 09H
    INT 21H
    JMP END

NOT_PRIME:
    LEA DX, NOTPRIME
    MOV AH, 09H
    INT 21H

END:
