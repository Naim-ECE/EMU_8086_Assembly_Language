.model small
.stack 100h
.data

msg1 db "Enter your number: $"
msg2 db 10, 13, "It's a prime number$"
msg3 db 10, 13, "It's not a prime number$"

num dw 0

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
    je done
    
    sub al, 30h
    mov ah, 00h
    mov cx, ax
    mov ax, bx
    mov bx, 10
    mul bx
    add ax, cx
    mov bx, ax
    jmp input
    
done:
    mov num, bx
    mov ax, num
    
    cmp ax, 2
    jl not_prime
    
    mov cx, 2
    
check:
    mov ax, num
    mov dx, 0
    div cx
    
    cmp dx, 0
    je not_prime
    
    mov ax, num
    inc cx
    cmp cx, ax
    jl check
    
    lea dx, msg2
    mov ah, 09h
    int 21h
    jmp end
    
not_prime:
    lea dx, msg3
    mov ah, 09h
    int 21h
    
end:    
