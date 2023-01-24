[org 0x0100]
	
	mov ax, 0
	mov bx, 0
	mov cx, 0
	outerloop:
		mov cx, [num + bx]
		cmp cx, 2 
		je skip

		add ax,	[num + bx]	
		
		skip:
			add bx, 2
			cmp bx, 24
			jne outerloop
	
	mov [result], ax
	mov ax, 0x4c00
	int 0x21
			


num: dw 2,2,3,2,1,2,3,0,1,1,1
result: dw 0