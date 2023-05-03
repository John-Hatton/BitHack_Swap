        extern  printf, nanosleep
        global  bitHackSwap, println, print, holdUp

        section .data

fmt:    db "%s", 0
fmtln:  db "%s", 10, 0

        section .text

bits 64

%macro printLn 1

        mov     rdi, fmtln
        mov     rsi, %1
        xor     eax, eax
        call    printf

%endmacro

%macro print_ 1

        mov     rdi, fmt
        mov     rsi, %1
        xor     eax, eax
        call    printf

%endmacro

print:

        mov     rbx, rdi
        print_  rbx

        ret

; Input:
;   rdi - number of milliseconds to wait
; Output:
;   None
; Clobbered registers:
;   rax
;holdUp:

    ; usleep requires microseconds, but we've given milliseconds
    ;imul    rdi, 1000
    ;call    usleep

    ;ret



;;;;;;;;;;;;;Custom Wait Subroutine;;;;;;;;;;;;;

holdUp:
    push    rbp          ; push rbp onto the stack to save the current stack frame
    mov     rbp, rsp     ; set the stack pointer to the current value of rsp
    sub     rsp, 32      ; allocate 32 bytes of space on the stack for local variables
    mov     DWORD [rbp-20], edi   ; move the first argument (milliseconds) into [rbp-20]
    mov     eax, DWORD [rbp-20]   ; move the value of [rbp-20] into eax
    movsx   rdx, eax     ; sign-extend eax to 64 bits and move the result into rdx
    imul    rdx, rdx, 274877907  ; multiply rdx by a constant (2^64/1000000) to convert from milliseconds to CPU clock ticks
    shr     rdx, 32      ; shift the upper 32 bits of rdx into the lower 32 bits
    sar     edx, 6      ; shift the lower 32 bits of rdx right by 6 bits to divide by 64 (approximating a division by 1000)
    sar     eax, 31     ; shift eax right by 31 bits to extract its sign bit
    sub     edx, eax    ; subtract the sign bit of eax from the lower 32 bits of rdx
    movsx   rax, edx    ; sign-extend the result of the previous subtraction and move it into rax
    mov     QWORD [rbp-16], rax   ; move rax into [rbp-16] as a 64-bit integer
    mov     eax, DWORD [rbp-20]   ; move the value of [rbp-20] into eax
    movsx   rdx, eax     ; sign-extend eax to 64 bits and move the result into rdx
    imul    rdx, rdx, 274877907  ; multiply rdx by a constant (2^64/1000000) to convert from milliseconds to CPU clock ticks
    shr     rdx, 32      ; shift the upper 32 bits of rdx into the lower 32 bits
    sar     edx, 6      ; shift the lower 32 bits of rdx right by 6 bits to divide by 64 (approximating a division by 1000)
    mov     ecx, eax    ; move the value of eax into ecx
    sar     ecx, 31    ; shift ecx right by 31 bits to extract its sign bit
    sub     edx, ecx   ; subtract the sign bit of ecx from the lower 32 bits of rdx
    imul    ecx, edx, 1000   ; multiply the result of the previous subtraction by 1000 and move the result into ecx
    sub     eax, ecx   ; subtract ecx from eax to obtain the remainder of the previous multiplication (approximating a modulus by 1000)
    mov     edx, eax   ; move the value of eax into edx
    imul    eax, edx, 1000000  ; multiply edx by 1000000 and move the result into eax (to convert the remainder from milliseconds to nanoseconds)
    cdqe                ; sign-extend eax to 64 bits
    mov     QWORD [rbp-8], rax  ; move rax into [rbp-8] as a 64-bit integer (to pass as the second argument to nanosleep)
    lea     rax, [rbp-16]   ; load the address of [rbp-16] into rax
    mov     esi, 0      ; move 0 into esi as the first argument to nanosleep (indicating that no signal interruptions should occur)
    mov     rdi, rax   ; move the address of [rbp-16] into rdi as the second argument to nanosleep (specifying the number of nanoseconds to sleep)
    call    nanosleep   ; call the nanosleep function with the specified arguments
    nop                 ; do nothing (no operation)
    leave               ; restore the previous stack frame by setting rsp to rbp and popping rbp off the stack
    ret                 ; return from the function, popping the return address off the stack and jumping to that address

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




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
