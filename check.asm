[org 0x0100]

jmp start


start:

mov ax, 1111111b

shr ax, 1
shl ax, 1


mov ax, 0x4c00
int 0x21