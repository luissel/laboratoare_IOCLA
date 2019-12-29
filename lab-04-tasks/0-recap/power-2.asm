%include "io.inc"

section .text
global CMAIN
CMAIN:
    push ebp
    mov ebp, esp

    mov eax, 211    ; to be broken down into powers of 2
    mov ebx, 1      ; stores the current power
    ; TODO - print the powers of 2 that generate number stored in EAX
    mov ecx, 128
    push ecx
    mov edx, eax
    sub edx, ecx
    
for:   
    cmp edx, ecx 
    jg case1
    jle case2
    
case1:
   sub edx, ecx
   cmp edx, 0
   je exit
   jmp for
    
case2:
    shr ecx, 1
    cmp ecx, 0
    je exit
    cmp edx, ecx
    jge print
    jmp for

print:
    push ecx
    add ebx, 1
    jmp for
    
for1:
    pop ecx
    PRINT_DEC 4, ecx
    NEWLINE
    sub ebx, 1
    cmp ebx, 0
    jg for1
    je exitt
    
exit: 
    jmp for1

exitt:    
    leave
    ret
