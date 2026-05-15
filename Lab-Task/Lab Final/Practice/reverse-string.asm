.model small
.stack 100h
.data

msg db "Enter your string: $"
msg2 db 10, 13, "Reversed string: $"

.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea dx, msg
    mov ah, 09h
    int 21h
    mov cx, 0
    
input:
    mov ah, 01h
    int 21h
    
    cmp al, 13
    je done
    
    push ax
    inc cx
    jmp input

done:
    lea dx, msg2
    mov ah, 09h
    int 21h
    
print:
    pop dx
    mov ah, 02h
    int 21h
    loop print
