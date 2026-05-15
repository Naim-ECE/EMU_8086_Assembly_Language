.MODEL SMALL
.STACK 100H

.DATA
NUM DW 1234

MSG DB 'Reversed Number: $'

.CODE
MAIN PROC

    MOV AX, @DATA
    MOV DS, AX

    MOV AX, NUM
    MOV BX, 10
    MOV CX, 0          ; reversed number

REVERSE:

    MOV DX, 0
    DIV BX             ; AX=quotient, DX=remainder

    PUSH AX            ; save quotient
    PUSH DX            ; save remainder

    MOV AX, CX
    MUL BX             ; CX * 10

    POP DX             ; restore remainder

    ADD AX, DX
    MOV CX, AX         ; new reversed number

    POP AX             ; restore quotient

    CMP AX, 0
    JNE REVERSE

    ; Print message

    LEA DX, MSG
    MOV AH, 09H
    INT 21H

    MOV AX, CX
    MOV CX, 0

STORE:

    MOV DX, 0
    DIV BX

    PUSH DX
    INC CX

    CMP AX, 0
    JNE STORE

PRINT:

    POP DX

    ADD DL, 30H

    MOV AH, 02H
    INT 21H

    LOOP PRINT
