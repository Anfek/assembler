;Nikishina Anna KKCO-03-19
section .data
    str1 db 'ghfk', 0xA
;    len equ $ - str1
    filename db 'buffile.txt', 0

section .bss
    x resb 1
    fd resb 4

section .text
    global _start

_start:
    pop ebx
    pop ebx
    pop ebx
    mov eax, 5
    mov ecx, 2
    mov edx, 0
    int 0x80

    mov [fd], eax
        
    point1:
        mov esi, 0
        mov ecx, 4
        point2:
            push ecx
            mov eax, 3 
            mov ebx, [fd]
            mov ecx, x
            mov edx, 1
            int 0x80

            cmp eax, 0
            je exit


            mov al, [str1+esi]
            mov bl, [x]
            xor al, bl

            mov [x], al

            mov eax, 19
            mov ebx, [fd]
            mov ecx, -1
            mov edx, 1
            int 0x80

            mov eax, 4
            mov ebx, [fd]
            mov ecx, x 
            mov edx, 1
            int 0x80
            
            inc esi
            pop ecx

            loop point2
        
        jmp point1

    exit:
        mov eax, 6
        mov ebx, [fd]
        int 0x80

        mov eax, 1
        mov ebx, 0
        int 0x80
        

