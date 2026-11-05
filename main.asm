section .bss
    line resb 128           ; what we read
    rev resb 128            ; room for the result

section .text
    global _start
_start:
    mov rax, 0              ; read up to 128 bytes from stdin
    mov rdi, 0
    mov rsi, line
    mov rdx, 128
    syscall                 ; rax = number of bytes read
    ; TODO: put the reversed text and a newline into `rev`, then write it
    cmp byte [line + rax - 1], 10
    jne .no_newline
    dec rax

.no_newline:
    mov r12, rax
    xor rbx, rbx
.loop:
    cmp rbx, r12
    je .end ;set up the loop

    mov rcx, r12
    dec rcx
    sub rcx, rbx

    mov al, [line + rcx]
    mov [rev + rbx], al

    inc rbx
    jmp .loop
.end:
    mov byte [rev + r12], 10

    mov rax, 1
    mov rdi, 1
    mov rsi, rev
    mov rdx, r12
    inc rdx
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall
