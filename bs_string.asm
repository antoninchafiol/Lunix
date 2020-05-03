print:
    pusha 

start:
    mov ah, 0x0e
    mov al, [bx]
    cmp al, 0
    je end
    int 0x10
    add bx, 1
    jmp start

end:
    popa
    ret

print_nl:
    pusha
    mov ah, 0x0e
    mov al, 0x0D
    int 0x10
    mov al, 0x0A
    int 0x10
    popa
    ret