org 100h
jmp start

prompt  db "Enter 10 numbers: $"
ans db "The sorted form is: $"
data 	db 15, 0
resb 15
swapflag: db  0

getData:
	mov dx, data
	mov ah, 0x0a
	int 0x21
ret

printf:
    push bp
    mov bp, sp
    mov dx, [bp+4]
    mov ax, 0
    mov ah, 9
    int 21h
    pop bp
ret 2

nextLine:
    mov dl, 10
    mov ah, 02h
    int 21h
ret

start:
mov ax, prompt
push ax
call printf
call getData
call nextLine

mainloop:
mov si, 2
mov  byte[swapflag], 0 
innerloop:
    mov al, [data + si]
    sub al, 30h
    mov bl, [data + si + 1]
    sub bl, 30h
    cmp al, bl
    jl noswap
    add al, 30h
    mov [data + si + 1], al
    add bl, 30h
    mov [data + si], bl
    mov  byte[swapflag], 1 
    noswap:
    add si, 1

    cmp si, 11
    jl innerloop

cmp byte[swapflag], 1
je mainloop

mov ax, ans
push ax
call printf

mov bl, '$'
mov [data + 13], bl
mov ax, data + 2
push ax
call printf

mov ax, 0x4c00
int 21h