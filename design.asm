[org 0x0100]
jmp start

data1: db 'I'
msg1end:

data2: db 'Love'
msg2end:

data3: db 'Pakistan'
msg3end:

printstr1:
	mov cx, msg1end - data1		; calculate msg size
	mov al, 1
	mov bh, 0
	mov bl, 70h	; color the text and background
	mov dh, 21	; row number
	mov dl, 10	; column no
	push cs
	pop es
	mov bp, data1
	mov ah, 13h
	int 10h

ret

printstr3:
	mov cx, msg3end - data3		; calculate msg size
	mov al, 1
	mov bh, 0
	mov bl, 70h	; color the text and background
	mov dh, 4	; row number
	mov dl, 64	; column no 13
	push cs
	pop es
	mov bp, data3
	mov ah, 13h
	int 10h

ret

printstr2:
	mov cx, msg2end - data2		; calculate msg size
	mov al, 1
	mov bh, 0
	mov bl, 70h	; color the text and background
	mov dh, 12	; row number
	mov dl, 38	; column no 13
	push cs
	pop es
	mov bp, data2
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

box1:
	mov ah, 07h
	xor al, al
	xor cx, cx
	mov dl, 26
	mov dh, 7
	mov bh, 70h
	int 10h
ret

box2:
	mov ah, 07h
	xor al, al
	mov cl, 00
	mov ch, 17
	mov dl, 26
	mov dh, 25
	mov bh, 70h
	int 10h
ret

box3:
	mov ah, 07h
	xor al, al
	mov cl, 26
	mov ch, 07
	mov dl, 52
	mov dh, 17
	mov bh, 70h
	int 10h
ret

box4:
	mov ah, 07h
	xor al, al
	mov cl, 52
	mov ch, 00
	mov dl, 80
	mov dh, 07
	mov bh, 70h
	int 10h
ret

box5:
	mov ah, 07h
	xor al, al
	mov cl, 52
	mov ch, 17
	mov dl, 80
	mov dh, 25
	mov bh, 70h
	int 10h
ret


start:
call clearscreen
call box1
call box2
call box3
call box4
call box5
call printstr1
call printstr2
call printstr3


mov ax, 0x4c00
int 0x21