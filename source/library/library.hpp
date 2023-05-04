#ifndef BITHACK_SWAP_LIBRARY_HPP
#define BITHACK_SWAP_LIBRARY_HPP

#ifdef __cplusplus
#include <cstdint>
#include <HugeInt/HugeInt.h>
extern "C"
{
#else //is pure C
#include <stdint.h>
#endif //__cplusplus


        // Class / Function definitions go here
        // Anything inside here is declared a C function, and will
        //  not get mangled by the compiler

        // Function names should correspond with the globally declared subroutine names from the assembly file


        void bitHackSwap(HugeInt* x, HugeInt* y);


        void holdUp(int waitMillis);

        void print(const char*);
        void println(const char*);

#ifdef __cplusplus
} //End of extern "C" bloc
#endif //__cplusplus

// Can define regular C++ classes here



#endif //BITHACK_SWAP_LIBRARY_HPP