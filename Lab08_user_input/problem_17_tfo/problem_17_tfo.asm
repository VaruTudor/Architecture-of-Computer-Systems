bits 32
global start

; A file name is given (defined in the data segment). Create a file with the given name, then read numbers from the keyboard and write only the numbers divisible by 7 to file, until the value '0' is read from the keyboard.

extern exit, fopen, fclose, scanf, fprintf
import exit msvcrt.dll
import fclose msvcrt.dll
import fopen msvcrt.dll
import scanf msvcrt.dll
import fprintf msvcrt.dll

segment data use32 class=data
    file_name db "file.txt", 0
    acces_mode db "w", 0
    format db "%d", 0
    
    len equ 256
    file_descriptor dd -1
    array times len dd 0 ; we will hold the numbers here

segment code use32 class=code
    start:
        mov esi, array
        
        push esi
        push dword format
        call [scanf]
        add esp, 4*2
    
    
    
    
        ; create a file for writing
        push dword acces_mode
        push dword file_name
        call [fopen]
        add esp, 4*2
        
        mov [file_descriptor], eax
        
        cmp eax, 0
        je theEnd
        
        
        mov esi, array
        mov ecx, eax
        
        run:
            lodsb   ;   al:= the numbers from array
            mov ah, 0
            mov bl, 7
            div bl  ; we divide the number with 7   
            
            cmp ah, 0   ;   we check divisibility
            jne notDivisible
            
            mov edx, 0
            mov dl, al
                
            push edx
            push dword format
            push dword [file_descriptor]
            call [fprintf]
            add esp, 4*3
            
            notDivisible:  
                dec ecx
                jmp run
    
        theEnd:
            push dword 0
            call [exit]