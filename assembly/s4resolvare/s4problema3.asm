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
    .code
start:
    mov eax, 1
    mov ebx, 2
    mov ecx, 3
    mov edx, 4
    push eax
    push ebx
    push ecx
    push edx
    pop eax
    pop edx
    pop ecx
    pop ebx

    push 0
    call exit
end start
