org 0x100
main:
	mov dx, prompt
	call prtstring

	call getAnswer
	cmp al, 'a'
	je amLabel

pmLabel:

	mov dx, pm
	call prtstring
	jmp done

amLabel:
	mov dx, am
	call prtstring
	jmp done
done:
	mov al, 0
	mov ah, 0x4c
	int 0x21

prtstring:
	mov ah, 9
	int 0x21
	ret

getAnswer:
	mov dx, answer
	mov ah, 0x0a
	int 0x21
	mov al, [answer+2]
ret

section .data
prompt  db "am or pm? $"
am	db "Good Morning!", 0x0d, 0x0a, '$'
pm	db "Good Afternoon!", 0x0d, 0x0a, '$'
answer 	db 20, 0
resb 20
