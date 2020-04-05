.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem msvcrt.lib, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
    .data
    ANGAJAT struct
        nume db 20 dup(0)
        salariu dw 0
    ANGAJAT ends
    nrAngajati dw 4
    angajati ANGAJAT {"georgescu", 100}, {"pop", 100},
                     {"popescu", 300}, {"ionescu", 450}
.code
start:
    mov eax, 0
    mov esi, 0
    mov ebx, 0

    add esi, 20
    add ax, word ptr angajati[ebx][esi]

    add ebx, 22
    add ax, word ptr angajati[ebx][esi]
    add ebx, 22
    add ax, word ptr angajati[ebx][esi]
    add ebx, 22
    add ax, word ptr angajati[ebx][esi]
    push 0
    call exit
end start
