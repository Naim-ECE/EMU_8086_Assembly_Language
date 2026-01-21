 ;MOV AL, 20H
 ;SUB AL, 20H ; when value becomes zero then zero flag becomes 1
 
 ;MOV AL, 00H
 ;ADD AL, 0F1H   ; the sign flag becomes 1 
 
 
 ;MOV AX, 00H
 ;ADD AX, 0F100H ; the number is signed but positive
 
 
 ;MOV AL, 00H
 ;SUB AL, 20H ;ignore
 
 
 ;MOV AL, 20H
 ;ADD AL, 0F9H ; Carry flag becomes 1   
 
 
 ;MOV AX, 20H
 ;ADD AX, 0F9H ; no carry flag cuz AH will take the remaining bits    
 
 
 ;MOV AL, 08H
 ;ADD AL, 28H   ; Auxiliary flag becomes 1 when 4th bit of the number becomes 1 & Parity flag becomes 1 when we get even number of 1
 
 ;MOV AX, 08H
 ;ADD AX, 28H
 
 
 ;MOV AL, 20H
 ;SUB AL, 20H    ; after subtraction there's 0. So, there's no 1 in both 4bit and 4bit. & so, the parity flag becomes 1
 


 ;MOV AL, 0FFH
 ;ADD AL, 0FFH ; Overflow flag becomes 1


 ;MOV AL, 7FH
 ;ADD AL, 01H ; overflow occurs. OF = 1 -> reason- We get a negative solution after adding two positive numbers. That's why overflow flag becomes 1
 
 
 ;MOV AL, 20H   
 ;ADD AL, 0F9H  ; carry flag becomes 1
 ;SUB AL, 10H   ; parity flag becomes 1
 ;SUB AL, 0F9H  ; borrow = 1; so, carry flag becomes 1
 
 
 ;MOV AL, 01H
 ;ADD AL, 0FFH
 ;ADD AX, 0FEH
 ;SUB AX, 0FFH
 
 
 ; 32 bit and 32 bit addition   -> lab report
 MOV AX, 0F123H
 MOV BX, 0ABCDH
 MOV CX, 0123FH
 MOV DX, 0F21AH
 ADC AX, CX
 ADC BX, DX ; AX is 16bit and BX became 16bit as well. So, totally it's 32bit
 