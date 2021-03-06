%include "io.inc"
%define ARRAY_SIZE    10

section .data
    array dd 1893, 9773, 892, 891, 3921, 8929, 7299, 720, 2590, 28891
    
    
section .text
global CMAIN
CMAIN:
    ;write your code here
    push ebp
    mov ebp, esp
    
    xor eax, eax
    xor ebx, ebx
    xor edx, edx
    mov ecx, ARRAY_SIZE
    
add: 
    cmp ecx, 0
    je exit
    
    mov edx, dword[array + 4 * (ecx - 1)]
    test edx, 1
    jz par
    jnz impar
    
par:
    inc eax
    sub ecx, 1
    jmp add
    
impar:
    inc ebx
    sub ecx, 1
    jmp add    
    
exit:
    PRINT_STRING "Numere pare: "
    PRINT_DEC 4, eax
    NEWLINE
    PRINT_STRING "Numere impare: "
    PRINT_DEC 4, ebx
    
    leave
    ret