[org 0x0100]
jmp main

data: dw 2, 1, 1, 1 ,4 ,3, 1,1,3,4
;data: dw 1,1,2,2,2,3,3,3,4,4
size: dw 10
mode: dw 0,0,0
count: dw 0

swapflag:   db  0

check:
	cmp ax, [count]
	jb skip
	je add1
	mov [count], ax
	mov [mode], bx
	add si, 2
	jmp skip
	add1:
	mov [count], ax
	mov [mode + si], bx
	skip:

ret
swap:
    mov  ax, [bx + si]          ; this changes ax
    xchg ax, [bx + si + 2]
    mov  [bx + si], ax
    ret  

bubblesort:
    mainloop:  
        mov  si, 0               ; This changes si
        mov  byte[swapflag], 0  
        innerloop:
            mov  ax, [bx + si]   ; This changes ax
            cmp  ax, [bx + si + 2]
            jbe  noswap

               call swap          ; another call here
               mov  byte[swapflag], 1
            noswap:
            add  si, 2
            cmp  si, cx
            jne  innerloop

        cmp  byte[swapflag], 1
        je   mainloop

    ret    ; notice this

calculateMode:
	mov  si, 0
	mov  di, 0
	mainl:
	mov dx, 1
	mov ax, [bx + di]
	push ax
	innerl:
		cmp  ax, [bx + si + 2]
		jne nocount
		add dx, 1
		nocount:
		add si, 2
		cmp si, 20
		jne innerl
	push dx
	next:
	add di, 2
	cmp ax, [bx + di]
	je next
	mov si, di
	cmp di, 20
	jne mainl
	
	mov si, 0
	pop ax
	pop bx
	mov [count], ax
	mov [mode], bx
	pop ax
	pop bx
	call check
	pop ax
	pop bx
	call check
	pop ax
	pop bx
	call check
ret
	
main:
	mov  bx, data
    	mov  cx, 20

	call bubblesort
	
	mov cx, [size]
	call calculateMode


mov ax, 0x4c00
int 0x21