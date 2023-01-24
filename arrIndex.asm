org 100h
jmp start
prompt db "Enter a message: $"
msg db 50, 0
resb 50
msg1end:
prompt1 db "Enter a starting index: $"
prompt2 db "Enter a ending index: $"
startIn dd 0, 's'
startIn1 dd 0, 's'
endIn dd 0, 's'
endIn1 dd 0, 's'

printf:         ;print function
    push bp
    mov bp, sp
    mov dx, [bp+4]
    mov ax, 0
    mov ah, 9
    int 21h
    pop bp
ret 2

getData:        ;input number
	mov dx, msg
	mov ah, 0x0a
	int 0x21
ret

getIndexes:
    mov ax, prompt1
    push ax
    call printf
    mov ah, 7
    int 21h
    mov byte[startIn], al
    mov byte[startIn1], al
    mov byte[startIn+1], '$'

    mov dx, startIn
    mov ah, 9
    int 21h

    call nextLine

    mov ax, prompt2
    push ax
    call printf
    mov ah, 7
    int 21h
    mov byte[endIn], al
    mov byte[endIn1], al
    mov byte[endIn+1], '$'

    mov dx, endIn
    mov ah, 9
    int 21h
ret 2

nextLine:
    mov dl, 10
    mov ah, 02h
    int 21h
ret


start:
mov ax, prompt
push ax
call printf
call getData
call nextLine
call getIndexes

mov si, [endIn1]
sub si, 30h
add si, 3
mov bl, '$'
mov [msg + si], bl

xor bx, bx
mov bx, [startIn1]
sub bx, 30h
mov si, bx
mov bx, msg + 2
add bx, si

call nextLine
mov ax, bx
push ax
call printf 



mov ax, 0x4c00
int 21h