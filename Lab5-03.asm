[org 0x0100]
jmp start

num: dw 3, 2, 1, 4

start:
	
	outerloop:
		mov bx, 0	;initializing the inner loop counter
		
		innerloop:
			mov ax, [num + bx]
			cmp ax, [num + bx +2]

			jbe noswap
			
			mov dx, [num + bx + 2] 
			mov [num + bx + 2], ax
			mov [num + bx], dx


			noswap:
			add bx, 2
			cmp bx, 6	
			jne innerloop

		sub bx, 1	
		jnz outerloop

		mov ax, 0x4c00
		int 0x21