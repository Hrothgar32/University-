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
    dummy1 DD 23
    dummy2 DD 34
.code
start:
    mov eax, 5
    mov ebx, 8
    mov ecx, 7
    mul ecx ;; Calcul 7*EAX
    mov dummy2, eax 
    mov eax, ebx
    mov dummy1, ebx
    mov ecx, 2
    mul ecx ;; Calcul 2*EBX
    mov ebx, eax
    mov eax, dummy2
    sub eax, ebx ;; Calcul 7*EAX - 2*EBX
    mov dummy2, eax
    mov eax, dummy1
    mov ecx, 8
    div ecx ;; Calcul EBX/8
    mov ebx, eax
    mov eax, dummy2
    sub eax, ebx ;; Calcul 7*EAX - 2*EBX - EBX/8
    push 0
    call exit
end start
