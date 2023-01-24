org 100h
jmp start
clearscreen:
	mov ah, 07h	; Scroll down function
	xor al, al	; Number of lines by which to scroll up
	xor cx, cx	; Upper left corner ch=row, cl=column
	mov dx, 174fh	; Lower right corner dh=row, dl=column
	mov bh, 00h	; BlackOnBlack
	int 10h
ret

box:
	mov ah, 07h
	xor al, al
	mov cx, 071fh
	mov dx, 0f2fh
	mov bh, 20h
	int 10h
ret

topborder:
	mov ah, 07h
	xor al, al
	xor cx, cx
	mov dx, 02c8h
	mov bh, 30h
	int 10h
ret 

leftborder
	mov ah, 07h
	xor al, al
	xor cx, cx
	mov dx, 5003h
	mov bh, 30h
	int 10h
ret

rightborder
	mov ah, 07h
	xor al, al
	mov cx, 00c5h
	mov dx, 50c8h
	mov bh, 30h
	int 10h
ret

start:
call clearscreen
call box
call topborder
call leftborder
call rightborder
mov ax, 0x4c00
int 0x21