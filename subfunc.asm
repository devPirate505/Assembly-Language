[org 0x0100]

jmp main

Min:
	sub ax, bx
ret

main:
	mov ax, 3
	mov bx, 4
	
	call Min

	mov ax, 0x4c00
	int 0x21
