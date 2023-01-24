[org 0x0100]
jmp start

data: db 'Kashmir'
msg1end:

printstr:
	mov cx, msg1end - data		; calculate msg size
	mov al, 1
	mov bh, 0
	mov bl, 67h	; color the text and background
	mov dh, 5	; row number
	mov dl, 13	; column no 13
	push cs
	pop es
	mov bp, data
	mov ah, 13h
	int 10h

ret

clearscreen:
    mov ah, 07h	; Scroll down function
	xor al, al	; Number of lines by which to scroll up
	xor cx, cx	; Upper left corner ch=row, cl=column
	mov dx, 174fh	; Lower right corner dh=row, dl=column
	mov bh, 00h	; BlackOnBlack
	int 10h
ret

background:
	mov ah, 07h
	xor al, al
	xor cx, cx
	mov dx, 50c8h
	mov bh, 20h
	int 10h
ret

box:
	mov ah, 07h
	xor al, al
	xor cx, cx
	mov dx, 0928h
	mov bh, 60h
	int 10h
ret

stripe1:
	mov ah, 07h
	xor al, al
	mov cx, 0c00h
	mov dx, 0dc8h
	mov bh, 70h
	int 10h
ret

stripe2:
	mov ah, 07h
	xor al, al
	mov cx, 0f00h
	mov dx, 10c8h
	mov bh, 70h
	int 10h
ret

stripe3:
	mov ah, 07h
	xor al, al
	mov cx, 1200h
	mov dx, 13c8h
	mov bh, 70h
	int 10h
ret

stripe4:
	mov ah, 07h
	xor al, al
	mov cx, 1500h
	mov dx, 16c8h
	mov bh, 70h
	int 10h
ret

start:
call clearscreen
call background
call box
call stripe1
call stripe2
call stripe3
call stripe4
call printstr


mov ax, 0x4c00
int 0x21