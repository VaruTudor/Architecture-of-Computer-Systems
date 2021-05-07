;bits 32
;global start
;
;import printf msvcrt.dll
;import exit msvcrt.dll
;extern printf, exit
;
;extern factorial
;
;segment data use32
;	format_string db "factorial=%d", 10, 13, 0
;
;segment code use32 public code
;start:
;	push dword 6
;	call factorial
;
;	push eax
;	push format_string
;	call [printf]
;	add esp, 2*4

;	push 0
;	call [exit]

;Read from the keyboard a string of numbers, given in the base 10 as signed numbers (a string of characters is read from the keyboard and a string of numbers must be stored in the memory).

bits 32
global start

import scanf msvcrt.dll
import printf msvcrt.dll
import exit msvcrt.dll
extern scanf, exit, printf

extern transform

global a

segment data use32 class=data public
    a dd 0
    format db "%c", 0
    result db "result is %d", 0
    
segment code use32 class=code public
start:
    
    push dword a
    push dword format
    call [scanf]
    add esp, 4*2
    
    push dword a
    call transform
    
    push eax
    push result
    call [printf]
    add esp, 2*4
    
    
    push dword 0
    call [exit]
    
    
    
    
    