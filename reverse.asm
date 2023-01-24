org 100h
main:
	mov dx, prompt
	call prtstring

	call getAnswer
    
    mov al, '$'
    mov [answer + 12], al

    mov al, [answer + 2]
    mov [answer1 + 11], al

    mov al, [answer + 3]
    mov [answer1 + 10], al

    mov al, [answer + 4]
    mov [answer1 + 9], al

    mov al, [answer + 5]
    mov [answer1 + 8], al

    mov al, [answer + 6]
    mov [answer1 + 7], al

    mov al, [answer + 7]
    mov [answer1 + 6], al

    mov al, [answer + 8]
    mov [answer1 + 5], al

    mov al, [answer + 9]
    mov [answer1 + 4], al

    mov al, [answer + 10]
    mov [answer1 + 3], al

    mov al, [answer + 11]
    mov [answer1 + 2], al

    call nextLine

    mov dx, ansprint
    call prtstring
    mov al, '$'
    mov [answer1 + 12], al
    mov dx, answer1+2
    call prtstring

    mov ax, 0x4c00
    int 21h

prtstring:
	mov ah, 9
	int 0x21
	ret

getAnswer:
	mov dx, answer
	mov ah, 0x0a
	int 0x21
ret

nextLine:
    mov dl, 10
    mov ah, 02h
    int 21h
ret

section .data
prompt  db "Enter 10 characters(A-Z): $"
ansprint db "The reverse order is: $"
answer 	db 15, 0
resb 15
answer1 db 12, 0
resb 12
