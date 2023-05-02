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
        ; So much for it being doomed! I found a way to do it!!!

	; In the disassembled code, we move the second argument to edx, and the first argument to eax.
	; This means if x = 5 when we start, we want it to equal 6 when we finish.
	; When we first start, rdi is 5. That means after the swap rdi is now 6, and we can move it
	; back to eax. Similarly we must move the value of rsi back to edx, ie 5 goes to edx.

	mov DWORD [rbp-0x18], edi
	mov DWORD [rbp-0x20], esi


        ret
