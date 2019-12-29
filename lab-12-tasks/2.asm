%include "io.inc"

%define ARRAY_SIZE    5

section .data
    val1: dd 0x0e000000
    string: db "Hello", 0
    dword_array: dd 1, 2, 3, 4, 5
    print_format: db "Array sq_sum is ", 0

section .text
global CMAIN

countBits:
    push ebp
    mov ebp, esp
    
    mov esi, [ebp + 8]
    test esi, esi
    jns notNegative
    not esi
    add esi, 1
notNegative:
    mov ecx, 1
    mov edx, 0
    mov eax, 2
    and eax, esi
    test eax, eax
    jz start
    inc edx
start:
    mov eax, 2
    push eax
for:
    pop eax
    cmp ecx, 16
    ja return
    shl eax, 2
    push eax
    and eax, esi
    inc ecx
    test eax, eax
    jz for
    inc edx
    jmp for
return:
    mov eax, edx
    pop ebp
    ret
    
pairs111:
    push ebp
    mov ebp, esp
    
    mov esi, [ebp + 8]
    test esi, esi
    jns notNegative1
    not esi
    add esi, 1
notNegative1:
    mov ecx, 1
    mov eax, 1
    mov edx, 0
    push eax
for1:
    pop eax
    cmp ecx, 29
    ja return1
    push eax
    inc ecx
firstBit:
    and eax, esi
    test eax, eax
    jz endFor
secondBit:
    pop eax
    push eax
    shl eax, 1
    and eax, esi
    test eax, eax
    jz endFor
thirdBit:
    pop eax
    push eax
    shl eax, 2
    and eax, esi
    test eax, eax
    jz endFor
    inc edx
endFor:
    pop eax
    shl eax, 1
    push eax
    jmp for1
return1:
    mov eax, edx
    pop ebp
    ret
    
;   void reverse(char *s, int len)
reverse:
    push ebp
    mov ebp, esp
    mov esi, [ebp + 8]
    mov ecx, [ebp + 12]
    
    sub esp, ecx
    lea edi, [esp]
    cld
    rep movsb
    
    mov edi, [ebp + 8]
    mov ecx, [ebp + 12]
    
move_bytes:
    mov al, [esp]
    mov [edi + ecx - 1], al
    inc esp
    loop move_bytes
    
    add esp, 5

    leave
    ret

CMAIN:
    mov ebp, esp; for correct debugging
    ;   1a)
    ;   first msb in the second ms byte
    mov eax, [val1]
    and eax, 0x08000000
    cmp eax, 0
    jne bit1_1
    PRINT_STRING "0"
    jmp finish1
bit1_1:
    PRINT_STRING "1"
finish1:
    ;   second msb in the second ms byte
    mov eax, [val1]
    and eax, 0x04000000
    cmp eax, 0
    jne bit1_2
    PRINT_STRING "0"
    jmp finish2
bit1_2:
    PRINT_STRING "1"
finish2:
    NEWLINE
    
    ;   1b)
    mov eax, [val1]
    push eax
    call countBits
    add esp, 4
    PRINT_STRING "bits num: "
    PRINT_DEC 4, eax
    NEWLINE
    
    ;   1c)
    mov eax, [val1]
    push eax
    call pairs111
    add esp, 4
    PRINT_STRING "num of pairs: "
    PRINT_DEC 4, eax
    NEWLINE
    
    ;   2a)
    sub esp, 20
    mov eax, 0x41   ; ASCII code for A
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
    
    ;   2b)
    mov ecx, 5
    push ecx
    mov eax, string
    push eax
    call reverse
    add esp, 8
    
   mov ecx, 0
   mov edi, string
print1:
   mov al, byte [edi + ecx]
   PRINT_CHAR al
   inc ecx
   cmp ecx, 5
   jne print1 
   NEWLINE
   
   ;    2c)
    mov ecx, ARRAY_SIZE
    xor ebx, ebx
    xor edx, edx
    
add_dword_array_element:
    mov edx, dword [dword_array + (ecx-1)*4]
    mov eax, edx
    mul eax
    add ebx, eax
    loop add_dword_array_element
    
    PRINT_STRING print_format
    PRINT_UDEC 4, ebx
    NEWLINE

    xor eax, eax
    ret