; ./main.asm

; Copyright © Lachlan Harris 2025.
; SPDX-License-Identifier: MIT

%define ENDL 0x0D, 0x0A

org  0x7c00
bits 16

; jump to entrypoint
start:
    jmp main

; puts prints a string to stdout
;   * ds:si points to string
puts:
    ; "save" modified regs
    push si
    push ax
.loop:
    ; `lodsb` loads next character into al
    lodsb

    ; if char is null, finish
    or al, al
    jz .done

    mov ah, 0x0e
    mov bh, 0
    int 0x10

    jmp .loop
.done:
    ; restore modified regs
    pop ax
    pop si
    ret

main:
    ; set data segments to 0
    mov ax, 0
    mov ds, ax
    mov es, ax

    ; stack grows downwards; point behind OS
    mov ss, ax
    mov sp, 0x7C00

    ; print boot msg
    mov si, szBootMsg
    times 5 call puts

    hlt

.halt:
    jmp .halt

; constants
szBootMsg: db "Hello, world!", ENDL, 0

; ---
times 510-($-$$) db 0
dw 0AA55h
