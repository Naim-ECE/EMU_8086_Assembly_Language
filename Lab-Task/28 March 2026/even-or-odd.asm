.model small
.stack 100h
.data

MSG1 DB "The number is even$"
MSG2 DB 10, 13, "The number is odd$"

.code       
main proc
MOV AX, @data
MOV DS, AX

ECE:
MOV AH, 01H
INT 21H

CMP AL, 13
JE EXITLOOP

SUB AL, 30H
MOV AH, 00H
MOV CX, AX

MOV AX, BX
MOV BX, 10
MUL BX
ADD AX, CX
MOV BX, AX

JMP ECE

EXITLOOP:
TEST BX, 1
JZ EVEN
JNZ ODD

EVEN:
LEA DX, MSG1
MOV AH, 09H
INT 21H
JMP END

ODD:
LEA DX, MSG2
MOV AH, 09H
INT 21H
JMP END

END:
END
