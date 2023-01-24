[org 0x0100]
	
	mov ch, 6
	mov ah, 0
	mov bx, 0
	outerloop:
		add ah, [num + bx]	
			
		add bx, 1
		sub ch, 1
		jnz outerloop

	mov [result], ah	

	mov ax, 0x4c00
	int 0x21

num: db 1,2,3,1,2,1
num1: db 0
result: db 0