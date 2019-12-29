%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp
    
    sub esp, 20
    mov eax, 'A'   ; ASCII code for A
    mov ecx, 0
init:
    mov byte [esp + ecx], al
    inc al
    inc ecx
    cmp ecx, 20
    jne init
    
    mov ecx, 0
printInit:
    mov al, byte [esp + ecx]
    PRINT_CHAR al
    inc ecx
    cmp ecx, 20
    jne printInit
    
    NEWLINE
    
    add esp, 20
    xor eax, eax
    
    leave
    ret