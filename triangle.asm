org 100h
jmp start
prompt db 'Enter the number of rows: $'
num dd 0, 's'
num1 dd 0, 's'

clrscreen:
    mov ah, 07
    mov al, 0
    mov cx, 0
    mov dx, 174fh
    mov bh, 00h
    int 10h
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

getNum: 
    mov ax, prompt
    push ax
    call printf
    mov ah, 7
    int 21h
    mov byte[num1], al
    sub al, 30h
    mov byte[num], al
    mov byte[num1+1], '$'

    mov dx, num1
    mov ah, 9
    int 21h
ret 2

nextLine:
    mov dl, 10
    mov ah, 02h
    int 21h
ret

printTri:
    mov bl, [num]
    xor cx, cx
    mov cl, 0
    mov si, 1
    mov bh, 41h
    outerloop:
    mov cx, si
    innerloop:
        mov dl, bh
        mov ah, 02h
        int 21h
    loop innerloop
    add si, 1
    sub bl, 1
    cmp bl, 0
    je return
    add bh, 1
    call nextLine
    jmp outerloop


    return:

ret

start:
call clrscreen
call getNum
call nextLine

call printTri



mov ax, 0x4c00
int 0x21