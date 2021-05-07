bits 32
global start

extern exit, fopen, fread, fclose, printf
import exit msvcrt.dll
import fopen msvcrt.dll
import fread msvcrt.dll
import fclose msvcrt.dll
import printf msvcrt.dll

segment data use32 class=data
    file_name db "file.txt", 0
    file_descriptor dd -1 
    acces_mode db "r", 0
    len equ 256
    final_result dd 0
    text times len db 0

    result db 'The number of consonants from the text is %d', 0
segment code use32 class=code
    start:
        ; open the file
        push dword acces_mode
        push dword file_name
        call [fopen]
        add esp, 8
        
        mov [file_descriptor], eax
        
        cmp eax,0
        je theEnd
        
        ; read the file and add in text
        push dword[file_descriptor]
        push dword len
        push dword 1
        push dword text
        call [fread]
        add esp, 4*4
        
        mov ecx, eax
        mov bl, 0
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
            je next
            cmp ecx, 0
            jne repeat1
            
            
            consonant:
                inc bl
                dec ecx
                cmp ecx, 0
                jne repeat1
        
        next:
            mov [final_result], bl
            mov eax, [final_result]
            
            push eax
            push result
            call [printf]
            add esp, 4*2
        
        theEnd:
            push dword 0
            call [exit]