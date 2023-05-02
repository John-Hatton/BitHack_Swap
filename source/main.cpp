//
// Created by physiker on 10/27/2022.
//

#include <iostream>

#include "library/library.hpp"
#include <iostream>

int main()

{
    println("Hallo Welt");
    println("Ich drücke mal Textzeilen vom C++ mit Assembly aus!!!"); // I'm printing lines of text with assembly!!!



    // These are essentially no-operations, because we have to align our stack to line up with gtest stack
    
    int* a = new int();
    int* b = new int();

    int* x = new int();
    int* y = new int();

    *x = 5;
    *y = 6;

//    int x = 5;
//    int y = 6;

    bitHackSwap(x, y);


    std::cout << "The Value of X is: " << *x << "\n and the value of Y is: " << *y << std::endl;

    return 0;
}
