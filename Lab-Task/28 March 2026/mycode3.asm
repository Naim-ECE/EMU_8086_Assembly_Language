.model small
.stack 100h
.data

MSG1 DB "Enter a number: $"
MSG2 DB 10, 13, "The number is: $"

.code       
main proc
MOV AX, @data
MOV DS, AX 

LEA DX, MSG1
MOV AH, 09H
INT 21H

MOV BX, 0

ECE:
MOV AH, 01H
INT 21H

CMP AL, 13
JE EXITLOOP

SUB AL, 30H
MOV AH, 0H
MOV CX, AX

MOV AX, BX
MOV BX, 10
MUL BX
ADD AX, CX
MOV BX, AX

JMP ECE

EXITLOOP:

LEA DX, MSG2
MOV AH, 09H
INT 21H

MOV DX, BX

MOV AH, 02H
INT 21H
