[org 0x0100]
jmp main

output: dw 0
sum: dw 0
Data: dw 72, 31, 47

DoubleD:
	push bp
	mov bp, sp
	
	mov bx, 10
	mov ax , [bp + 4]
	div bx
	push ax
	mul bx
	mov bx, [bp + 4]
	sub bx, ax
	add bx, [bp - 2]
	mov ax, [sum]
	cmp ax, bx
	ja noupdate
	mov [sum], bx
	mov bx, [bp + 4]
	mov [output], bx
	noupdate:
	pop bp
	pop bp
	
ret

main:
	mov ax, [Data]
	push ax

	call DoubleD

	mov ax, [Data + 2]
	push ax

	call DoubleD

	mov ax, [Data + 4]
	push ax

	call DoubleD




mov ax, 0x4c00
int 0x21