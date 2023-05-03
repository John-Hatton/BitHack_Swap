//
// Created by physiker on 10/27/2022.
//

#include "library/library.hpp"
#include <iostream>

int main()
{
    println("Hello! The evil bit hack swap lurks...");

    holdUp(2500);

    println("");

    int x;
    int y;
    char returnString[100];

    print("Enter a value for x: "); std::cin >> x;
    print("Enter a value for y: "); std::cin >> y;
    println("");

    int* pX = &x;
    int* pY = &y;

    print("Swapping....."); fflush(stdout); holdUp(1000);
    print("...");           fflush(stdout); holdUp(500);
    print(".");             fflush(stdout); holdUp(500);
    print("..");            fflush(stdout); holdUp(500);
    print("..");            fflush(stdout); holdUp(500);
    print(".....");         fflush(stdout); holdUp(500);
    print("....");          fflush(stdout); holdUp(500);
    println("DONE!!!\n");

    bitHackSwap(pX, pY);

    sprintf(returnString, "The value of x is: %d, and the value of y is: %d!", x, y);
    println(returnString);

    return 0;
}
