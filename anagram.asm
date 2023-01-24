org 100h
jmp start
word1 db "marry"
endword1:
word2 db "army"
endword2:
swapflag db 0
anagflag db 0
anag db "Yes $"
nonanag db "No $"

printf:
    push bp
    mov bp, sp
    mov dx, [bp+4]
    mov ax, 0
    mov ah, 9
    int 21h
    pop bp
ret 2

sort1:
    mov cx, endword1 - word1 -1
    mainloop:
    mov si, 0
    mov  byte[swapflag], 0 
    innerloop:
        mov al, [word1 + si]
        mov bl, [word1 + si + 1]
        cmp al, bl
        jl noswap
        mov [word1 + si + 1], al
        mov [word1 + si], bl
        mov  byte[swapflag], 1 
        noswap:
        add si, 1

        cmp si, cx
        jl innerloop

    cmp byte[swapflag], 1
    je mainloop

ret

compare:
    mov si, 0
    mov cx, endword2 - word2
    xor ax, ax
    cmploop:
        mov al, [word1 + si]
        mov ah, [word2 + si]
        cmp al, ah
        jne notequal
        add si, 1

        loop cmploop
        jmp term1

        notequal:
        mov byte[anagflag], 1

        term1:

ret

sort2:
    mov cx, endword2 - word2 -1
    xor ax, ax
    xor bx, bx
    mainloop2:
    mov si, 0
    mov  byte[swapflag], 0 
    innerloop2:
        mov al, [word2 + si]
        mov bl, [word2 + si + 1]
        cmp al, bl
        jl noswap2
        mov [word2 + si + 1], al
        mov [word2 + si], bl
        mov byte[swapflag], 1 
        noswap2:
        add si, 1

        cmp si, 3
        jl innerloop2

    cmp byte[swapflag], 1
    je mainloop2

ret

start:
mov cx, endword1 - word1
mov bx, endword2 - word2
cmp cx, bx
jne term
call sort1
call sort2
call compare
jmp term2

term:
mov byte[anagflag], 1

term2:
cmp byte[anagflag], 1
je noanagram
mov ax, anag
push ax
call printf

mov ax, 0x4c00
int 21h

noanagram:
    mov ax, nonanag
    push ax
    call printf

mov ax, 0x4c00
int 21h