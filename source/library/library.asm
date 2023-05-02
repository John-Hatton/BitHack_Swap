        extern  printf
        global  bitHackSwap, println


        section .data



msg:    db "Hallo Welt!", 10, 0


fmt:    db "%s", 0
fmtln:  db "%s", 10, 0
fmtd:   db "%d", 0
fmtdln: db "%d", 10, 0


        section .text
bits 64





%macro printLn 1

        mov     rdi, fmtln
        mov     rsi, %1
        xor     rax, rax
        call    printf

%endmacro


println:

        mov     rbx, rdi
        printLn rbx

        ret

bitHackSwap:

        ; Two Parameters, X and Y Remember ...
          ;
          ;    rdi -- First Param.
          ;    rsi -- Second Param.
        mov r13, [rdi]
        mov r15, [rsi]

        xor     r13, r15
        xor     r15, r13
        xor     r13, r15

        ; Well it seems this project was doomed from the start, but it was a lot of fun to write!
        ; Nothing goes to waste!
        ; So much for it being doomed! I found a way to do it!!!


	    mov DWORD [rdx], r15d ; the ptr in rdx points to the stack address where arg1 is stored
	    mov DWORD [rax], r13d ; the ptr in rax points to the stack address where arg2 is stored
	    
        ret
