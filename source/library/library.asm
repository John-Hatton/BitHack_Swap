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

        ; Move the values pointed to by rdi and rsi to r13 and r15 respectively
        mov r13, [rdi]
        mov r15, [rsi]

        xor     rsi, rdi
        xor     rdi, rsi
        xor     rsi, rdi

        ; Move the immediate values back from r13 and r15 to rdi and rsi (after swap)
	    mov DWORD [rdi], r13d ; the ptr in rdi points to the stack address where our immediate X is stored
	    mov DWORD [rsi], r15d ; the ptr in rsi points to the stack address where our immediate Y is stored

        ; Well it seems this project was doomed from the start, but it was a lot of fun to write!
            ; Nothing goes to waste!
            ; So much for it being doomed! I found a way to do it!!!
            ; Debugging with Voltron and gdb was a lifesaver.
        ret
