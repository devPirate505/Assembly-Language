clrscr:
	push es
	push ax
	push cx
	push di

	mov ax, 0xb800
	mov es, ax

	xor di, di
	mov ax, 0x0720
	mov cx, 2000

	cld			; auto-increment
	rep stosw		;automatically writes starting from [es:di]

	pop di
	pop cx
	pop ax
	pop es
	ret3