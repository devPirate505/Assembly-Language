[org 0x0100]

jmp start

data: dw 1,2,1,1,1,1,1
result: dw 0

sum:
	add ax, [data + bx]
	add bx, 2
	mov [result], ax
ret result


start:
	mov ax, 0
	mov bx, 0
	mov cx, 7

	addition:
		call sum
	loop addition
	
	mov [result], ax
	mov ax, 0x4c00
	int 0x21