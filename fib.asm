org 100h
jmp start
msg db 'Enter a number: $'
num dd 0, 's'


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
	mov al, '$'
	mov [num + 1], al
	mov dx, num
	mov ah, 9
	int 21h
ret 2

fibonacci:
	push bp
	mov bp, sp
	add ax, bx
	mov [num], ax
	mov ax, bx
	mov bx, [num]
	pop bp
	
	cmp cx, 0
	je end

	sub cx, 1
	call fibonacci


	end:

ret

nextLine:
    mov dl, 10
    mov ah, 02h
    int 21h
ret


start:
    mov ax, msg
    push ax
    call printf
	call scanchr
	mov ax, 0
	mov bx, 1
	mov cx, 3
	mov al, [num]
	sub al, 30h
	push cx
	call fibonacci

	;call nextLine

	add ax, 30h
	mov dx, ax
	mov ah, 9
	int 21h

mov ax, 0x4c00
int 21h