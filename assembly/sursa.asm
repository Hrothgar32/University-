    .386
    .model flat, stdcall

    includelib msvcrt.lib
    extern exit: proc

    public start

    .data

    .code
start:
    push 0
    call exit
end start
