bits 32
global start

extern exit, printf, scanf
import exit msvcrt. dll
import printf msvcrt.dll
import scanf msvcrt.dll

segment data use32 class=data
    numbers times len dd 0
    
    len equ 256

segment code use32 class=code
    start:
        mov ecx
    
        theEnd:
            push dword 0
            call [exit]      