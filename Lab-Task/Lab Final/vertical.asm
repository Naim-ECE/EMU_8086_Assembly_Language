.MODEL SMALL
.STACK 100H

.DATA
MSG1 DB "Enter the string: $"
MSG2 DB 10,13,"Vertical output:",10,13,'$'

.CODE

MOV AX,@DATA
MOV DS,AX

; Print message

LEA DX,MSG1
MOV AH,09H
INT 21H

MOV CX,0

INPUT:

    MOV AH,01H
    INT 21H

    CMP AL,13
    JE DISPLAY

    PUSH AX
    INC CX

    JMP INPUT

DISPLAY:

    LEA DX,MSG2
    MOV AH,09H
    INT 21H

PRINT:

    POP DX

    MOV AH,02H
    INT 21H

    MOV DL,10
    MOV AH,02H
    INT 21H

    MOV DL,13
    MOV AH,02H
    INT 21H

    LOOP PRINT

MOV AH,4CH
INT 21H