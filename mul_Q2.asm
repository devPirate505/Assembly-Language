[org 0x0100]
jmp main

result: dw 0, 0

Multiply:
    	push bp
    	mov  bp, sp
 
    	mov  ax, [bp + 6]
   	mov  bx, [bp + 4]
    	mul bx
    	mov [result], ax

    	mov  ax, [bp + 6]
    	div bx
	mov [result + 2], ax	
	
    	pop bp
ret


main:
 mov ax, 4
 mov bx, 2

 push ax
 push bx

call Multiply

    mov  ax, 0x4c00
    int  0x21