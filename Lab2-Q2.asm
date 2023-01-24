[org 0x100]

	mov ah, [num1]
	mov bh, [num2]
	add ah, bh

	mov bh, [num3]
	add ah, bh
	
	mov bh, [num4]
	add ah, bh

	mov [result], ah	

	mov ax, 0x4c00
	int 0x21


num1: dw 2
num2: dw 3
num3: db 1
num4: db 2
result: dw 0