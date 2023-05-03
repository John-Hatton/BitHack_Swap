//
// Created by physiker on 10/27/2022.
//


#include <gtest/gtest.h>


#include "../source/library/library.hpp"


TEST(bitHackSwap_Test, Demonstrate_Whether_BitHackSwap_Is_Valid)
{
    int x = 5;
    int y = 6;
    int* pX = &x;
    int* pY = &y;

    bitHackSwap(pX, pY);

    EXPECT_EQ(x, 6);
}
