[org 0x7c00]

mov bp, 0x9000 ; setting the stack away enough 
mov sp, bp 

mov bx, _pstring
call print
call print_nl
; mov bx, _sload
; call print
; call print_nl

; mov bx, 0x9000 ; needed for 
; mov dh, 2
; call disk_load

; mov bx, [0x9000+512]
; call print
call switch_to_pm
jmp $ 

%include "bs_string.asm"
%include "bs_disk.asm"
%include "bs_32print.asm"
%include "bs_32gdt.asm"
%include "bs_32switch.asm"

[bits 32]
BEGIN_PM:
    mov ebx, MSG_PROT_MODE
    call print_string_pm
    jmp $ 

_pstring:
    db 'Welcome to the Lunix system !', 0

_sload:
    db 'Loading from disk', 0

MSG_PROT_MODE:
    db '32 bits protected mode loaded !', 0

times 510 - ($-$$) db 0
dw 0xaa55 

; times 256 dw 0xdada 
; times 256 dw 0xdead