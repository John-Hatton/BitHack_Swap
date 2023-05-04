//
// Created by physiker on 10/27/2022.
//

#include "library/library.hpp"
#include <iostream>
#include <sstream>


int main()
{
    println("Hello! The evil bit hack swap lurks...");

    holdUp(2500);

    println("");


    auto x = new HugeInt();
    auto y = new HugeInt();

    std::string xVal;
    std::string yVal;

    print("Enter a value for x: "); std::cin >> xVal;
    print("Enter a value for y: "); std::cin >> yVal;
    println("");

    x->setValue(xVal);
    y->setValue(yVal);

    print("Swapping....."); fflush(stdout); holdUp(1000);
    print("...");           fflush(stdout); holdUp(500);
    print(".");             fflush(stdout); holdUp(500);
    print("..");            fflush(stdout); holdUp(500);
    print("..");            fflush(stdout); holdUp(500);
    print(".....");         fflush(stdout); holdUp(500);
    print("....");          fflush(stdout); holdUp(500);
    println("DONE!!!\n");

    bitHackSwap(x, y);

    std::stringstream ss;
    ss << x->to_string();
    ss << y->to_string();
    ss << "The value of x is: %s, and the value of y is: %s!";
    std::string tostr = ss.str();
    int strlength = tostr.length();

    char returnString[strlength];

    sprintf(returnString, "The value of x is: %s, and the value of y is: %s!", x->to_string(), y->to_string());
    println(returnString);

    return 0;
}
