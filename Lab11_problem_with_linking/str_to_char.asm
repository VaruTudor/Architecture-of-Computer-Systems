;bits 32                         
;segment code use32 public code
;global factorial

;factorial:
;	mov eax, 1
;	mov ecx, [esp + 4]
;	
;	repeat: 
;		mul ecx
;	loop repeat
;	ret 4 ; in this case, 4 represents the number of bytes that need to be cleared from the stack (the parameter of the function)



;Read from the keyboard a string of numbers, given in the base 10 as signed numbers (a string of characters is read from the keyboard and a string of numbers must be stored in the memory).


bits 32
segment code use32 public code

global transform

extern a

transform:
    mov eax, [a]
    
    sub eax, 48 ; the ascii code for '0' is 48, so this instruction should return the integer coresponding to the number
    mov [a], eax
    
    ret 
    