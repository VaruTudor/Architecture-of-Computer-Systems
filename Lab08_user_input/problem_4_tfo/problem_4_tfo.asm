bits 32

global start

extern exit,printf,fopen,fread,fclose
import exit msvcrt.dll
import printf msvcrt.dll
import fopen msvcrt.dll
import fread msvcrt.dll
import fclose msvcrt.dll

segment data use32 class=data
    file_name db "file.txt", 0
    acces_mode db "r", 0
    result db "the number of even digits is %d", 0
    
    len equ 256
    file_descriptor dd -1
    
    text times len db 0
    
    ;A text file is given. Read the content of the file, count the number of even digits and display the result on the screen. The name of text file is defined in the data segment.
segment code use32 class=code
    start:
        push dword acces_mode ; the next 4 instructions open the file for reading
        push dword file_name
        call [fopen]
        add esp, 4*2    
        
        mov [file_descriptor], eax ; we kkep the identifier in eax
        
        cmp eax, 0  ; if eax is 0 we terminate the prorgam
        je theEnd
        
        push dword [file_descriptor]
        push len
        push 1
        push dword text
        call [fread]
        add esp, 4*4
        
        mov ecx, eax    ; we  reapeat the for each element read from the file
        cld
        mov bl, 0; we count the number of even digits in bl
        mov esi, text
        
        whilee:
            lodsb   ;al:= bytes from text
            rcr al,1    ; in cf we will have the last binary digit
            
            mov bh, 0   ; we put the last binary digit in bh
            adc bh, 0
            
            cmp bh, 0
            jne raise
            
            dec ecx
            cmp ecx, 0
            je next
            
            cmp ecx, 0
            jne whilee
            
            raise:
                inc bl
                dec eax
                cmp eax, 0
                jne whilee
                
                
        next:
            mov eax,0
            mov al, bl
            
            push eax
            push dword result
            call [printf]
            add esp, 4*2
            
            push dword[file_descriptor]
            call [fclose]
            add esp, 4
        
        
        theEnd:
            push dword 0
            call [exit]