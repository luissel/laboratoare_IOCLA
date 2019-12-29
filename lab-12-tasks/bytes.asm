%include "io.inc"

section .data

nr dd 0xa50000

section .text
global CMAIN
CMAIN:
    ;write your code here
    ;a
    xor eax, eax
    mov al, byte[nr+2]
    shr al, 6
    test al, 2
    jz zero
    PRINT_CHAR '1'
    jmp ok
zero:
    PRINT_CHAR '0'
ok:
    and al, 1
    test al, 1
    jz zero1
    PRINT_CHAR '1'
    jmp ok1
zero1:
    PRINT_CHAR '0'
ok1:
    NEWLINE 
    
    xor eax, eax
    xor ecx, ecx
    ; ch for nr of bytes
    mov eax, 1
    
for:
    test eax, [nr]
    jz n
    inc ch
n:  
    shl eax, 2
    cmp eax, 0
    jg for
    PRINT_DEC 1, CH
    PRINT_STRING "  :)"
    NEWLINE
    
    ; eax is already 0
    xor ecx, ecx
    mov eax, 0x7
for1:
    mov edx, [nr]
    and edx, eax
    cmp edx, eax
    jne notfound
    inc ecx
notfound:
    shl eax, 1
    cmp eax, 0xc0000000
    jne for1
    PRINT_DEC 4, ecx
    
    xor eax, eax
    ret