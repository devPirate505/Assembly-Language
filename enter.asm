org 100h
jmp start
Section .data
msg db 'Enter a number: $'
num dd 0, 's'

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


scanString:
    startq:
	mov ah, 7
	int 21h		; input character will be stored in al 
    cmp al, 0x0d
    je end
	mov byte[num], al
	mov byte[num + 1], '$'
	; print the entered number
	mov dx, num
	mov ah, 9
	int 21h
    jmp startq
    end:
ret 2

start:
mov ax, msg
push ax
call printf

mov bl, 0
call scanString



mov ah, 4ch
int 0x21