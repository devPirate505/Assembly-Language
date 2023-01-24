org 100h
jmp start
data db 15, 0,3,2,1,0,9,7,8,4,5,6
resb 15
swapflag: db  0

start:

mainloop:
mov si, 2
mov  byte[swapflag], 0 
innerloop:
    mov al, [data + si]
    mov bl, [data + si + 1]
    cmp al, bl
    jl noswap
    mov [data + si + 1], al
    mov [data + si], bl
    mov  byte[swapflag], 1 
    noswap:
    add si, 1

    cmp si, 11
    jl innerloop

cmp byte[swapflag], 1
je mainloop

mov ax, 0x4c00
int 21h