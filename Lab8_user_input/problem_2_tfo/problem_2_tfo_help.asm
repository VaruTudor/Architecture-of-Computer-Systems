;A text file is given. Read the content of the file, count the number of consonants and display the result on the screen. The name of text file is defined in the data segment.
bits 32
global start

extern exit
import exit msvcrt.dll

segment data use32 class=data
    result db 0
    text db 'Am 2 mere si 2 cirese', 0
    len equ $-text
    
segment code use32 class=code
    start:
        mov bl, 0   ; we calculate the number of consonants in bl
        mov ecx, len
        mov esi, text
        cld
        
        repeat1:
            ;B, C, D, F, G, H, J, K, L, M, N, P, Q, R, S, T, V, W, X, Y, Z
            lodsb   ; al:=letters from text
            cmp al,'b'
            je consonant
            cmp al,'B'
            je consonant
            cmp al,'c'
            je consonant
            cmp al,'C'
            je consonant
            cmp al,'d'
            je consonant
            cmp al,'D'
            je consonant
            cmp al,'f'
            je consonant
            cmp al,'F'
            je consonant
            cmp al,'g'
            je consonant
            cmp al,'G'
            je consonant
            cmp al,'h'
            je consonant
            cmp al,'H'
            je consonant
            cmp al,'J'
            je consonant
            cmp al,'J'
            je consonant
            cmp al,'k'
            je consonant
            cmp al,'K'
            je consonant
            cmp al,'l'
            je consonant
            cmp al,'L'
            je consonant
            cmp al,'m'
            je consonant
            cmp al,'M'
            je consonant
            cmp al,'n'
            je consonant
            cmp al,'N'
            je consonant
            cmp al,'p'
            je consonant
            cmp al,'P'
            je consonant
            cmp al,'q'
            je consonant
            cmp al,'Q'
            je consonant
            cmp al,'r'
            je consonant
            cmp al,'R'
            je consonant
            cmp al,'s'
            je consonant
            cmp al,'S'
            je consonant
            cmp al,'t'
            je consonant
            cmp al,'T'
            je consonant
            cmp al,'v'
            je consonant
            cmp al,'V'
            je consonant
            cmp al,'w'
            je consonant
            cmp al,'W'
            je consonant
            cmp al,'x'
            je consonant
            cmp al,'X'
            je consonant
            cmp al,'y'
            je consonant
            cmp al,'Y'
            je consonant
            cmp al,'z'
            je consonant
            cmp al,'Z'
            je consonant
            
            dec ecx
            cmp ecx, 0
            je theend
            cmp ecx, 0
            jne repeat1
            
            
            consonant:
                inc bl
                dec ecx
                cmp ecx, 0
                jne repeat1
        
        theend:
            mov [result],bl
        
            push dword 0
            call [exit]