%include "io.inc"
section .data
    a: dd 0x17799c
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    mov ebp, esp
    
    mov eax, dword[a]
    xor ecx, ecx
cnt:
    test eax, eax
    je no
    
    shl eax, 1
    jc avem
    
nup:
     mov cl, 0   
    jmp cnt
    
avem:
    inc cl
    cmp cl, 3
    je plus
    jmp cnt
    
plus:
    shl eax, 1
    jc nup   
    inc ch
    mov cl, 0
    jmp cnt                                                            

no:
    mov cl, 0
    PRINT_STRING "nr secvente "
    PRINT_DEC 4, ch       
    xor eax, eax
    ret