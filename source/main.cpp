//
// Created by physiker on 10/27/2022.
//

#include <iostream>

#include "library/library.hpp"
#include <iostream>

int main()
{
    char returnString[100];

    int x = 5;
    int y = 6;

    int* pX = &x;
    int* pY = &y;

    bitHackSwap(pX, pY);

    sprintf(returnString, "The value of X is: %d, and the value of Y is: %d!", x, y);
    println(returnString);

    return 0;
}
