.model small
.stack 100h
.data

msg1 db "Enter a number: $"
msg2 db 10, 13, "Factorial is: $"

.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea dx, msg1
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h
    
    sub al, 30h
    mov ah, 00h
    
    cmp ax, 0
    je is_zero
    
    mov cx, ax
    mov ax, 1
    

fact:
    mul cx
    loop fact
    jmp disp
    
    
    
is_zero:
    mov ax, 1
    
disp:

    mov cx, ax

    lea dx, msg2
    mov ah, 09h
    int 21h    
    
    mov ax, cx
    mov bx, 10
    mov cx, 0
    
store:
    mov dx, 0
    div bx
    push dx
    inc cx
    cmp ax, 0
    jne store
        
    
print:
    pop dx
    add dx, 30h
    mov ah, 02h
    int 21h
    loop print    
            
