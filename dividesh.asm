[org 0x0100]

jmp start

quotient: db 0
remainder: db 0
divisor: db 7
dividend: db 19
count: db 8

start:
	mov cl, [count]
	mov ah, 0
	mov al, [dividend]

	outerloop:

	shl ax, 1
	sub ah, [divisor]
	cmp ah, 0
	jl less
	jge greater
	greater:
		mov bh, al
		shl al, 7
		cmp al, 0x80
		je equal
		mov al, bh
		add al, 1b
		jmp continue

		equal:
		mov al, bh
		
		jmp continue
		

	less:
		shr al, 1
		shl al, 1
		add ah, [divisor]
	
	continue:
	sub cl, 1
	cmp cl, 0
	jne outerloop
	
	mov [quotient], al
	mov [remainder], ah
	
	

mov ax, 0x4c00
int 0x21