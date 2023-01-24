org 100h
jmp start
msg1 db 'Enter Table No: $'
msg2 db 'Enter Table limit: $'
mulformat db " * ", '$'
eqformat db " = ", '$'
product db 0

nextLine:
    mov dl, 10
    mov ah, 02h
    int 21h
ret

start:
mov bl, 1
mov cl, 4

printTable:

    mov al, 3
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
int 21h