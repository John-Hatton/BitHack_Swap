#pragma once

#ifdef __cplusplus
#include <cstdint>
extern "C"
{
#else //is pure C
#include <stdint.h>
#endif //__cplusplus


        // Class / Function definitions go here
        // Anything inside here is declared a C function, and will
        //  not get mangled by the compiler

        // Function names should correspond with the globally declared subroutine names from the assembly file


        void bitHackSwap(int* x, int* y);

        void println(const char*);

#ifdef __cplusplus
} //End of extern "C" bloc
#endif //__cplusplus

// Can define regular C++ classes here