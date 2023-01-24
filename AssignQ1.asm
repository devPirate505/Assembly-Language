[org 0x0100]
	
	mov cx, 6	;setting the outerloop counter to 6
	outerloop:
		mov bx, 0	;initializing the inner loop counter
		
		innerloop:
			mov ax, [num + bx]	;moving the current digit into accumulator
			cmp ax, [num + bx +2]		;comparing the current digit with the next one

			ja next		; jump to next if the first digit is greater then the next one
			
			mov dx, [num + bx + 2] 		;swaping the digits if the current digit is smaller than the next digit 
			mov [num + bx + 2], ax
			mov [num + bx], dx


			next:
			add bx, 2		;adding 2 to the innerloop counter
			cmp bx, 10		;if bx is equal to 10, end innerloop
			jne innerloop		;if bx not equal to 10 jump to innerloop

		sub cx, 1		;decrementing from outerloop counter
		jnz outerloop

		mov ax, 0x4c00
		int 0x21

num: dw 2,1,8,0,2,3
