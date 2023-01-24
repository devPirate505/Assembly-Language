org 100h
jmp start
data: db 'Assembly Language - Course, FAST University Peshawar Campus'
msg1end:

data1: db 'I Love Pakistan'
msg2end:

clearscreen:
	mov ah, 07h
	xor al, al
	xor cx, cx
	mov dx, 174fh
	mov bh, 00h
int 10h
ret

printstr:
	mov cx, msg1end - data		; calculate msg size
	mov al, 5
	mov bh, 0
	mov bl, 07	; color the text and background
	mov dh, 5	; row number
	mov dl, 13	; column no 13
	push cs
	pop es
	mov bp, data
	mov ah, 13h
	int 10h
	; mov ah, 00h		; BIOS.WaitKeyboardKey
	; int 16h		; -> AX
ret

start:
call clearscreen
call printstr

mov ax, 0x4c00
int 0x21

	
	