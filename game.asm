org 100h

SECTION .TEXT
jmp start

msg db 'Enter a number from 0 to 9 and e to terminate: $'
msg1 db ' and $'
win db ' are equal. You are winner! $'
lose db ' are not equal. You are loser! $'
num dd 0, 's'
term db 'Program terminated! $'
printf:		;cout
	push bp;
	mov bp, sp;
	mov dx, [bp+4]
	mov ax, 0
	mov ah, 9
	int 21h
	pop bp;
ret 2

generateRamdomNo:
;***********Get number of clock ticks*******
mov cx, 0
mov AH, 00h
INT 1Ah  ;output will be in dx

mov ax, DX ; number of clock ticks since midnight.
mov dx, 00h
mov bx, 10 ; Random No between 0-10
div bx
;***********How Reminder work*******
; output will be in dx. 
; mov ax, 1234          ; dividend low half
; mov dx, 0             ; dividend high half = 0.  prefer  xor dx,dx
; mov bx, 10            ; divisor can be any register or memory
; div bx       ; Divides 1234 by 10.
;         ; DX =   4 = 1234 % 10  remainder
;         ; AX = 123 = 1234 / 10  quotient

; // Print the a character on screen 
   add  dl, 30h  ; to ascii conversion
   ;    print the number 
   mov ah, 2h   ; call interrupt to display a value in DL
   int 21h
ret

scanString:
	mov ah, 7
	int 21h		; input character will be stored in al 
	mov byte[num], al
    mov byte[num+1], '$'

	mov dx, num
	mov ah, 9
	int 21h
ret

compare:
mov al, byte[num]
cmp al, dl
je equal

mov ax, lose
push ax
call printf
ret

equal:
    mov ax, win
    push ax
    call printf
    ret

start
mov ax, msg
push ax
call printf
mov al, byte[num]
cmp al, 'e'
je terminate

call scanString
mov ax, msg1
push ax
call printf
call generateRamdomNo
call compare
jmp start

terminate
mov ax, term
push ax
call printf
mov ax, 0x4c00 ; terminate program
int 0x21