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
    v3 db 255, 0ffh
    v8 dd 12345678h
    .code
start:
    mov eax, [eax+ebx]
    mov ebx, ebp
    lea ecx, [edx+esi+3]
    mov edx, [ebx+3*edi]
    mov eax, edx+esi
    mov ebx, [ecx+al]
    mov edx, [ebx+4*edi]
    mov eax, [eax+ebx+1]
    call exit
end start
