org 100h
jmp start

arr1 db 'a', 'b', 'c', '$'
arr2 db 'x', 'y', 'z', '$'
arr3 db 0
swapflag: db  0

clrscreen:
    mov ah, 07
    mov al, 0
    mov cx, 0
    mov dx, 174fh
    mov bh, 00h
    int 10h
ret

printf:
    push bp
    mov bp, sp
    mov dx, [bp+4]
    mov ax, 0
    mov ah, 9
    int 21h
    pop bp
ret 2

check1:
    mov si, 0
    mov di, 0
    mov dx, 0
    mov cx, 0
    mov byte[swapflag], 0 
    
    innerloop:
    mov al, [arr1 + si]
    cmp al, '$'
    je end1

    mov ah, [arr2 + di]
    cmp ah, '$'
    je end
    cmp al, ah
    je equal

    add di, 1
    jmp innerloop
    
    equal:
        add si, 1
        add di, 0
        jmp innerloop

    end:
        add si, 1
        mov di, 0
        mov dl, al
        push dx
        add cx, 1
        jmp innerloop

    end1:

    mov si, 0
    insert1:
    pop dx
    mov [arr3 + si], dx
    add si, 1
    loop insert1

    mov bx, 0
    mov bx, si

ret

check2:
    mov si, 0
    mov di, 0
    mov dx, 0
    mov cx, 0
    mov byte[swapflag], 0 
    
    innerloop1:
    mov al, [arr2 + si]
    cmp al, '$'
    je end3

    mov ah, [arr1 + di]
    cmp ah, '$'
    je end2
    cmp al, ah
    je equal1

    add di, 1
    jmp innerloop1
    
    equal1:
        add si, 1
        add di, 0
        jmp innerloop1

    end2:
        add si, 1
        mov di, 0
        mov dl, al
        push dx
        add cx, 1
        jmp innerloop1

    end3:

    mov si, bx
    insert2:
    pop dx
    mov [arr3 + si], dx
    add si, 1
    loop insert2

    add si, 1
    mov bl, '$'

    mov [arr3 + si], bl
ret


start:
    call check1
    call check2
    mov ax, arr3
    push ax
    call printf

    

    mov ax, 0x4c00
    int 21h
        