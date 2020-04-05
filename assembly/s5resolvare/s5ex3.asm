.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem msvcrt.lib, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
.data
    numar dw 1580
    numardebiti db 0
.code
start:
    xor eax, eax
    mov ax, numar
    mov bl, 0
main_loop:
    shr ax, 1
    jnc cmp_carry
    inc bl
cmp_carry:
    cmp eax, 0
    jg main_loop
    mov numardebiti, bl
    push 0
    call exit
end start
