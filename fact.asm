[org 0x0100]
jmp main

Factorial:
    	push bp
    	mov  bp, sp
	
    	mov ax, [bp + 6]
	mov bx, [bp + 6]
	sub bx, 1

	fact: 
	mul bx
	sub bx, 1
	
	cmp bx, 1
	jne fact
    			
    	pop bp
ret


main:
 mov ax, 5
 mov bx, 0

 push ax
 push bx

call Factorial

    mov  ax, 0x4c00
    int  0x21