.MODEL SMALL
.STACK 100H
.DATA
MSG DB "SUM OF 3+6+9+12+...+150 = $"

.CODE
MAIN PROC
MOV AX, @DATA
MOV DS, AX

LEA DX, MSG
MOV AH, 09H
INT 21H
    
MOV CX, 50        
MOV AX, 3         
MOV DX, 0         

SUM_LOOP:
ADD DX, AX        
ADD AX, 3         
LOOP SUM_LOOP
MOV AX, DX
MOV BX, 10
MOV CX, 0

CONVERT:
MOV DX, 0
DIV BX
PUSH DX
INC CX
CMP AX, 0
JNE CONVERT

PRINT:
POP DX
ADD DL, 30H
MOV AH, 02H
INT 21H
LOOP PRINT
    
MAIN ENDP
END MAIN

; Determination of a sum of a series
