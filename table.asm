org 100h
jmp start
msg1 db 'Enter Table No: $'
msg2 db 'Enter Table limit: $'
num dd 0, 's'
limit dd 0, 's'
mulformat db " * ", '$'
eqformat db " = ", '$'
product db 0

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
    mov ax, msg1
    push ax
    call printf
    mov ah, 7
    int 21h
    mov byte[num], al
    mov byte[num+1], '$'

    mov dx, num
    mov ah, 9
    int 21h
ret 2

getLimit:
    mov ax, msg2
    push ax
    call printf
    mov ah, 7
    int 21h
    mov byte[limit], al
    mov byte[limit+1], '$'

    mov dx, limit
    mov ah, 9
    int 21h
ret 2

nextLine:
    mov dl, 10
    mov ah, 02h
    int 21h
ret

start:
call clrscreen
call getNum
call nextLine
call getLimit
call nextLine

mov bl, 1
mov cl, byte[limit]
sub cl, 30h
printTable:
    mov ax, num
    push ax
    call printf
    mov ax, mulformat
    push ax
    call printf
    add bl, 30h
    mov dl, bl
    mov ah, 02h
    int 21h

    mov ax, eqformat
    push ax
    call printf

    xor ax, ax
    xor dx, dx

    mov al, [num]
    sub al, 30h
    add al, [product]
    mov [product], al

    mov dh, 10
    div dh

    add ah, 30h
    mov dh, ah
    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h

    mov dl, dh
    mov ah, 02h
    int 21h
    
    sub bl, 30h
    add bl, 1
    call nextLine
    xor ax, ax
    xor dx, dx

    loop printTable



mov ax, 0x4c00
int 0x21