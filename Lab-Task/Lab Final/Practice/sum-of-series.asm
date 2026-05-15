.model small
.stack 100h
.data

msg db "Sum of 2+4+6+8+...+220 = $"
.code
main proc
    
mov ax, @data
mov ds, ax

lea dx, msg
mov ah, 09h
int 21h

mov ax, 2
mov dx, 0
mov cx, 110

sum:
    add dx, ax
    add ax, 2
    loop sum
    
mov ax, dx
mov bx, 10
mov cx, 0

convert:
    mov dx, 0
    div bx
    push dx
    inc cx
    cmp ax, 0
    jne convert
    
print:
    pop dx
    add dl, 30h
    mov ah, 02h
    int 21h
    loop print
