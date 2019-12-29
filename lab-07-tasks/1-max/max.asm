%include "io.inc"

section .text
global CMAIN
CMAIN:
    ; cele doua numere se gasesc in eax si ebx
    mov eax, 4
    mov ebx, 1

    ; TODO: aflati maximul folosind doar o instructiune de salt si push/pop
    cmp eax, ebx
    jge case2

case1:
    push ebx
    pop eax
    
case2:
    push eax
    pop eax
    
    PRINT_DEC 4, eax ; afiseaza minimul
    NEWLINE

    ret
