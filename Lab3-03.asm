[org 0x0100]

	; initialize stuff
	mov ax, 0		; reset the accumulator 

	mov cx, 3
	mov bx, num1

	outerloop:
		add ax, [bx]
		add bx, 2

		sub cx, 1
		jnz outerloop	;jump to outerloop lable if zero flag(ZF!=1) is not sent.
; its mean if previous result of arithematic or logical operation is not zero
; then move to outerloop otherwise ignore
	
	mov [result], ax

	mov ax, 0x4c00
	int 0x21


num1: dw 5, 10, 15, 0
result: dw 0