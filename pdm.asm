org 100h
jmp start
Section .data
msg db 'Enter a 3 digit number: $'
num dd 0, 's'
pelind db ' is a pelindrome$'
nonpelind db ' is not pelindrome$'
num1 : dd 0, 0, '$'

Section .code

printf:		;cout
	push bp;
	mov bp, sp;
	mov dx, [bp+4]
	mov ax, 0
	mov ah, 9
	int 21h
	pop bp;
ret 2

scanchr:
	; Take input
	mov ah, 7
	int 21h
	mov [num], al
	mov dx, num
	mov ah, 9
	int 21h
ret 2

scanString:
	mov ah, 7
	int 21h		; input character will be stored in al 
	mov byte[num], al
	mov ah, 7
	int 21h		; input character will be stored in al 
	mov byte[num+1], al
	mov ah, 7
	int 21h		; input character will be stored in al 
	mov byte[num+2], al
	mov byte[num+3], '$'
	; print the entered number
	mov dx, num
	mov ah, 9
	int 21h
ret 2

pelindrome:
	mov al, byte[num]
	mov bl, byte[num + 2]
	
	cmp al, bl
	je equal

	mov ax, nonpelind
	push ax
	call printf
	ret

	equal:
		mov ax, pelind
		push ax
		call printf
	ret

start:
mov ax, msg
push ax
call printf
call scanString
call pelindrome
mov ah, 4ch
int 0x21