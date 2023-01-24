[org 0x0100]
jmp main

Sum2:
	add ax, [bp - 2]
	add ax, bx
ret

Sum1:
    	push bp
    	mov  bp, sp
 
    	mov  ax, [bp + 6]
   	mov  bx, [bp + 4]
    	add ax, bx
    	push ax;
	mov  ax, [bp + 6]
	
	call Sum2
    	pop bp
	pop bp
ret 4


main:
	mov ax, 4
	mov bx, 2

	push ax
	push bx

call Sum1

    mov  ax, 0x4c00
    int  0x21