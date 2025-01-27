;Nikishina Anna KKCO-03-19
section .bss
    size resb 4
    counter resb 1
    x resb 1
    fd resb 4

section .text
    global _start

_start:
    pop ebx
    pop ebx
    pop ebx
    mov eax, 5
    mov ecx, 0
    mov edx, 0
    int 0x80

    mov [fd], eax

    mov eax, 19
    mov ebx, [fd]
    mov ecx, 0
    mov edx, 2
    int 0x80

    mov [size], eax

    mov ebx, 0
    mov [counter], ebx

    mov ebx, 0xA
    xor edx, edx
    div ebx
    push edx
    
    inc byte [counter]

    xor edx, edx
    add eax, 0 ;check 1
    jz print

    point1:
        div ebx
        push edx
        xor edx, edx
        inc byte [counter]
        add eax, 0
        jnz point1

    print:
        pop edx
        dec byte [counter]
        add edx, 0x30
        mov [x], edx

        mov eax, 4
        mov ebx, 1
        mov ecx, x
        mov edx, 1
        int 0x80

        mov bl, [counter]
        cmp bl, 0
        jne print

        mov eax, 6
        mov ebx, [fd]
        int 0x80

        mov eax, 1
        mov ebx, 0
        int 0x80
