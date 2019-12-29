%include "io.inc"

section .data
    array_1 db 27, 46, 55, 83, 84
    array_2 db 1, 4, 21, 26, 59, 92, 105
    array_output times 12 db 0

%define ARRAY_1_LEN 5
%define ARRAY_2_LEN 7
%define ARRAY_OUTPUT_LEN 12

section .text
global CMAIN
CMAIN:
    mov ebp, esp
    mov eax, ARRAY_1_LEN ; counter used for array_1
    mov ebx, ARRAY_2_LEN ; counter used for array_2
    mov ecx, ARRAY_OUTPUT_LEN ; counter used for the output array
   
merge_arrays:
    mov dl, byte [array_1 + eax - 1]
    mov dh, byte [array_2 + ebx - 1]
    cmp dl, dh
    jg array_2_lower
    
array_1_lower:
    xor dh, dh
    push dx
    dec eax
    dec ecx
    jmp verify_array_end
    
    ;mov byte [array_output + ecx], dl
    ;inc eax
    ;inc ecx
    ;jmp verify_array_end
array_2_lower:
    xor dl, dl
    mov dl, dh
    xor dh, dh
    push dx
    dec ecx
    dec ebx
    ;mov byte [array_output + ecx], dh
    ;inc ecx
    ;inc ebx

verify_array_end:
cmp eax, 0
    jbe copy_array_2
    cmp ebx, 0
    jbe copy_array_1
    jmp merge_arrays
    
    ;cmp eax, ARRAY_1_LEN
    ;jge copy_array_2
    ;cmp ebx, ARRAY_2_LEN
    ;jge copy_array_1
    ;jmp merge_arrays

copy_array_1:
    mov dl, byte [array_1 + eax - 1]
    xor dh, dh
    push dx
    
    dec ecx
    dec eax
    cmp eax, 0
    jg copy_array_1
    jmp print_array

    ;mov dl, byte [array_1 + eax]
    ;mov byte [array_output + ecx], dl
    ;inc ecx
    ;inc eax
   ;cmp eax, ARRAY_1_LEN
    ;jb copy_array_1
    ;jmp print_array
copy_array_2:
mov dh, byte [array_2 + ebx - 1]
    xor dl, dl
    mov dl, dh
    xor dh, dh
    push dx
    dec ecx
    dec ebx
    cmp ebx, 0
    jg copy_array_2
    ;mov dh, byte [array_2 + ebx]
    ;mov byte [array_output + ecx], dh
    ;inc ecx
    ;inc ebx
    ;cmp ebx, ARRAY_2_LEN
    ;jb copy_array_2

print_array:
    PRINT_STRING "Array merged: "
    NEWLINE
    mov ecx, 0
print:
    pop dx
    PRINT_UDEC 2, dx
    NEWLINE
    inc ecx
    cmp ecx, ARRAY_OUTPUT_LEN
    jb print
    mov esp, ebp
    ;PRINT_UDEC 1, [array_output + ecx]
    ;NEWLINE
    ;inc ecx
    ;cmp ecx, ARRAY_OUTPUT_LEN
    ;jb print

    xor eax, eax
    ret