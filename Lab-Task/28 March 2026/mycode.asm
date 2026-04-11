; string , scan with message

.model small
.stack 100h
.data
MSG1 DB "Hello World$"
MSG2 DB 10, 13, "This is ASUS computer$"

.code       
main proc
MOV AX, @data ; address can't be stored directly in the data segment
MOV DS, AX 

LEA DX, MSG1 ; LEA - Load Effective Address


MOV AH, 09H
INT 21H


;MOV AH, 02H
;MOV DL, 10
;INT 21H

;MOV AH, 02H
;MOV DL, 13
;INT 21H

LEA DX, MSG2

MOV AH, 09H
INT 21H
