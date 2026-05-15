.model small
.stack 100h
.data

;msg1 db "Enter your number: $"
msg db "Reversed number: $"

num dw 12345

.code
main proc
mov ax, @data
mov ds, ax

    mov ax, num
    mov cx, 0
    mov bx, 10

reversed:
    mov dx, 0
    div bx
    push ax
    push dx
    mov ax, cx
    mul bx
    pop dx
    add ax, dx
    
    mov cx, ax
    pop ax
    cmp ax, 0
    jne reversed
    
lea dx, msg
mov ah, 09h
int 21h    
    
mov ax, cx
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
    add dl, 30h
    mov ah, 02h
    int 21h
    loop print        
