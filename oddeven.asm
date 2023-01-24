org 100h
jmp start

num dd 0, 's'
prompt db "Enter a number: $"
odd db "This is an odd number. $"
even db "This is an even number. $"
prime db "This is a prime number. $"
nonprime db "This is not a prime number. $" 


printf:
    push bp
    mov bp, sp
    mov dx, [bp+4]
    mov ax, 0
    mov ah, 9
    int 21h
    pop bp
ret 2

getNum: 
    mov ax, prompt
    push ax
    call printf
    mov ah, 7
    int 21h
    mov byte[num], al
    mov byte[num+1], '$'

    mov dx, num
    mov ah, 9
    int 21h
ret 2

nextLine:
    mov dl, 10
    mov ah, 02h
    int 21h
ret

checkPrime:
    xor bx, bx
    mov cl, 1
    mov bl, 2

    divide:
    xor ax, ax
    mov al, [num]
    sub al, 30h
    div bl
    cmp ah, 0
    jne notDivisible
    add cl, 1
    
    notDivisible:
    add bl, 1
    
    mov al, [num]
    sub al, 30h
    cmp bl, al
    jle divide

    cmp cl, 2
    jg notPrime
    mov ax, prime
    push ax
    call printf

    jmp return

    notPrime:
    mov ax, nonprime
    push ax
    call printf
    jmp return


    return:
ret



start:
call getNum
call nextLine
xor ax, ax
mov al, [num]
sub al, 30h
mov bl, 2
div bl
cmp ah, 0
je evenNum
jne oddNum
evenNum:
    mov ax, even
    push ax
    call printf
    jmp end

oddNum:
    mov ax, odd
    push ax
    call printf
    jmp end

end:
call nextLine
call checkPrime

mov ax, 0x4c00
int 21h