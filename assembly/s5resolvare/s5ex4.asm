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
    string1 db "Am fost la munte"
    lgstring1 dd $-string1
    string2 db "fost la"
    lgstring2 dd $-string2
    string2val dd 0
.code
start:
    lea esi, string2
    mov ecx, lgstring2
    mov eax, 0ffffffffh

evaluate_string2:
    xor edx, edx
    add dl, [esi]
    add string2val, edx
    inc esi
    loop evaluate_string2

    lea esi, string1

evaluate_if_cur_pos:
    mov ecx, lgstring2
    mov edx, lgstring1
    cmp edx, ecx
    jl out_of_loop
    push esi
    xor ebx, ebx

calculatefrom_pos:
    xor edx, edx
    add dl, [esi]
    add ebx, edx
    inc esi
    loop calculatefrom_pos

    pop esi
    cmp ebx, string2val
    je place_pos
    mov ebx, lgstring1
    sub ebx, 1
    mov lgstring1, ebx
    inc esi
    jmp evaluate_if_cur_pos

place_pos:
    mov eax, esi

out_of_loop:
    push 0
    call exit
end start
