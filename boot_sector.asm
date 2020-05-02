[org 0x7c00]

mov ah, 0x0e ; tty mode
mov bx, _pstring
call print

jmp $ 

%include "bs_string.asm"

_pstring:
    db 'Welcome to the Lunix system !', 0

times 510 - ($-$$) db 0
dw 0xaa55 