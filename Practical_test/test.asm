bits 32

global start

extern exit,scanf,fread,fopen,fclose,fscanf,fprintf
import exit msvcrt.dll
import scanf msvcrt.dll
import fread msvcrt.dll
import fopen msvcrt.dll
import fclose msvcrt.dll
import fscanf msvcrt.dll
import fprintf msvcrt.dll

segment data use32 class=data
    file_name times 50 db 0     ;will hold the name of the file
    access_mode db 'r+',0       ;the accessing mode for the file 
    format_string db '%s',0     ;format for string
    format_char db '%c',0       ;format for character
    format_decimal db '%u',0    ;format for integer positive number
    
    file_descriptor dd 0        ;32 bit variable holding the file descriptor
    no_bytes dd 0               ;32 bit variable counting the number of bytes from the file
    s times 20 db 0             ;string of 20 bytes
    
segment code use32 class=code
    start:
        ;reads from the keyboard
        push dword file_name
        push dword format_string
        call [scanf]
        add esp,4*2
        
        ;opens the file 
        push dword access_mode
        push dword file_name
        call [fopen]
        add esp,4*2
        
        
        mov [file_descriptor],eax
        
        ;checks if the file has been open corectly
        cmp eax,0
        je ending
        
        read_char:
            ;reads a char from the file
            push dword s
            push dword format_char
            push dword [file_descriptor]
            call [fscanf]
            add esp,4*3
            
            ;checks the file descriptor and if it reaches the end of the file it jumps to next
            cmp eax,-1
            je next
            
            ;raises the value of no_bytes by 1
            inc dword [no_bytes]
            
            jmp read_char
        
        next:
            ;appends to the file the no bytes
            push dword [no_bytes]
            push dword format_decimal
            push dword [file_descriptor]
            call [fprintf]
            add esp,4*3
        
        ending:
            ;closes the file
            push dword [file_descriptor]
            call [fclose]
            add esp,4
            
            ;exits the program
            push dword 0
            call [exit]