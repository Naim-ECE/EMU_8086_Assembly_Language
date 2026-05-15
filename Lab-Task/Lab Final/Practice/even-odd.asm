.model small
.stack 100h
.data

msg1 db "Enter a number: $"
msg2 db 10, 13, "It's odd$"
msg3 db 10, 13, "It's even$"

.code
main proc

mov ax, @data
mov ds, ax

lea dx, msg1
mov ah, 09h
int 21h

input:
    mov ah, 01h
    int 21h
    
    cmp al, 13
    je exit
    
    sub al, 30h
    mov ah, 00h
    mov cx, ax
    mov ax, bx
    mov bx, 10
    mul bx
    add ax, cx
    mov bx, ax
    jmp input
    
exit:
    test bx, 1
    jz even
    jnz odd
    
even:
    lea dx, msg3
    mov ah, 09h
    int 21h
    jmp end
    
odd:
    lea dx, msg2
    mov ah, 09h
    int 21h

end:    
           
