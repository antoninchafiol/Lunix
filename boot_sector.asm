[org 0x7c00]

mov bp, 0x8000 ; setting the stack away enough 
mov sp, bp 

mov bx, _pstring
call print
call print_nl
mov bx, _sload
call print
call print_nl

mov bx, 0x9000
mov dh, 2
call disk_load

jmp $ 

%include "bs_string.asm"
%include "bs_disk.asm"

_pstring:
    db 'Welcome to the Lunix system !', 0

_sload:
    db 'Loading from disk', 0

times 510 - ($-$$) db 0
dw 0xaa55 

times 256 dw 0xdada 
times 256 dw 0xface 