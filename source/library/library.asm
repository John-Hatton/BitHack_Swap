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


        xor     rdi, rsi
        xor     rsi, rdi
        xor     rdi, rsi

        ; Well it seems this project was doomed from the start, but it was a lot of fun to write!
        ; Nothing goes to waste!

        ret
