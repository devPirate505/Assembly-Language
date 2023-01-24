; a program to understand the difference between Jz, Jnz, Je, Jne)
[org 0x0100]
	mov cx,2
	;ZF=1 mean set
	;ZF=0 mean not set or reset
	
	L1:
		cmp cx, 0
		jz L1
	L2:
		sub cx, 1
		cmp cx, 1
		je L4
	L3:
		cmp cx, 0
		jne L4
	L4:
		cmp cx, 1
		je L3

mov ax, 0x4c00
int 0x21