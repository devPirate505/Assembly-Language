org 100h
main:
	mov dx, userOut
	call prtstring
    call getUser

    call nextLine

    mov dx, passOut
    call prtstring
    call getPass

    mov al, [userIn + 2]
    mov ah, [savUser]
    cmp al, ah
    jne notequal
    mov al, [userIn + 3]
    mov ah, [savUser + 1]
    cmp al, ah
    jne notequal
    mov al, [userIn + 4]
    mov ah, [savUser + 2]
    cmp al, ah
    jne notequal
    mov al, [userIn + 5]
    mov ah, [savUser + 3]
    cmp al, ah
    jne notequal

    mov al, [passIn + 2]
    mov ah, [savPass]
    cmp al, ah
    jne notequal

    mov al, [passIn + 3]
    mov ah, [savPass + 1]
    cmp al, ah
    jne notequal

    mov al, [passIn + 4]
    mov ah, [savPass + 2]
    cmp al, ah
    jne notequal

    mov al, [passIn + 5]
    mov ah, [savPass + 3]
    cmp al, ah
    jne notequal

    jmp continue

    notequal:
    mov dx, loginerror
	call prtstring
    call nextLine
    jmp main

    continue:
    call nextLine
    mov dx, enterKey
    call prtstring

    mov ah, 7
    int 21h
    mov byte[characIn], al
    mov byte[characIn + 1], '$'
    mov dx, characIn
	mov ah, 9
	int 21h

    call nextLine

    mov al, byte[characIn]

    cmp al, 0dh
    je end

    cmp al, 5ah
    jle capital
    cmp al, 7ah
    jg invalid

    small:
    cmp al, 61h
    jl invalid
    mov dx, uppCase
    call prtstring
    sub al, 32
    mov byte[characIn], al
    mov dx, characIn
    mov ah, 9
	int 21h
    call nextLine
    jmp continue

    capital:
    cmp al, 41h
    jl invalid
    mov dx, lowCase
    call prtstring
    add al, 32
    mov byte[characIn], al
    mov dx, characIn
    mov ah, 9
	int 21h

    call nextLine
    jmp continue
    
    invalid:
    mov dx, invalidIn
    call prtstring
    call nextLine
    jmp continue

    end:

    mov ax, 0x4c00
	int 0x21

prtstring:
	mov ah, 9
	int 0x21
	ret

getUser:
	mov dx, userIn
	mov ah, 0x0a
	int 0x21
ret

getPass:
	mov dx, passIn
	mov ah, 0x0a
	int 0x21
ret

getCharacter:
	mov dx, characIn
	mov ah, 0x0a
	int 0x21
    mov al, [characIn + 2]
ret

nextLine:
    mov dl, 10
    mov ah, 02h
    int 21h
ret

section .data
userOut  db "Enter Username: $"
passOut  db "Enter Password: $"
loginerror db "Wrong Username or Password! Try Again. $"
enterKey db "Enter a character (A-Z or a-z): $"
invalidIn db "Wrong entry! Try again. $"
lowCase db "The lowercase is: $"
uppCase db "The Uppercase is: $"
savUser db "user"
savPass db "pass"
userIn 	db 10, 0
resb 10
passIn 	db 10, 0
resb 10
characIn dd 0, 's'
check db "check $"