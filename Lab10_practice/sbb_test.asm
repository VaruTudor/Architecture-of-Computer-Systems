bits 32
global start

extern exit
import exit msvcrt.dll

segment data use32 class=data


segment code use32 class=code
    start:
        mov ax, 5
        mov bx, 6
        stc
        sbb ax,bx
        
        push dword 0
        call [exit]