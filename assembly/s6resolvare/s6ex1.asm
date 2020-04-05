.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem msvcrt.lib, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern printf: proc
extern scanf: proc

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
.data
    mesaj1 DB "Give me two numbers", 0
    number1 DB 0
    number2 DB 0
    result DD 0
    format DB "%d %d",0
    mesaj2 DB "The sum of the numbers is %d", 0

.code
start:
    push offset mesaj1
    call printf
    add ESP, 4

    push offset number2
    push offset number1
    push offset format
    call scanf
    add ESP, 12

    xor EAX, EAX
    add AL, number1
    add AL, number2
    mov result, EAX

    push result
    push offset mesaj2
    call printf
    add ESP, 8
    push 0
    call exit
end start
