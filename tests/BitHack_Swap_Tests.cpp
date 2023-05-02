//
// Created by physiker on 10/27/2022.
//


#include <gtest/gtest.h>


#include "../source/library/library.hpp"


TEST(bitHackSwap_Test, Demonstrate_Whether_BitHackSwap_Is_Valid)
{
    int* x = new int();
    int* y = new int();

    *x = 5;
    *y = 6;

    bitHackSwap(x, y);

    EXPECT_EQ(*x, 6);
}
