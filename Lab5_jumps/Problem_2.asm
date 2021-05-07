bits 32
global start
extern exit
import exit msvcrt.dll


;Given a character string S, obtain the string D containing all special characters (!@#$%^&*) of the string S.
;Example:
;S: '+', '4', '2', 'a', '@', '3', '$', '*'
;D: '@','$','*'

    ; copies every chr???????
segment data use32 class=data
    S db '+', '4', '2', 'a', '@', '3', '$', '*'     ; declare the string of bytes     
    len equ $-S     ; compute the length of the string in len
    D times len db 0    ; reserve len bytes for the destination string and initialize it
    
segment code use32 class=code
    start:
        mov ecx,len ; we put the length len in ECX in order to make a loop of len steps
        mov esi,S   ;we put string S in esi
        mov edi,D   ;we put string D in edi
        cld     ;DF = 0
        repeat:
            mov al,[esi]  ;AL takes the byte from the offset [s+esi]
            inc esi ; esi moves to the next byte
            
            cmp al,'!'  ; compares al with '!'
            je change  ; jums to change is equal (zf=1) 
            cmp al,'@'
            je change
            cmp al,'#'
            je change
            cmp al,'$'
            je change
            cmp al,'%'
            je change
            cmp al,'^'
            je change
            cmp al,'&'
            je change
            cmp al,'*'
            je change
            
            loop repeat
            
            change:
                ; add character to D
                mov [edi],al
                inc edi

            loop repeat
        
    push dword 0
    call [exit]
