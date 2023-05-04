//
// Created by physiker on 10/27/2022.
//


#include <gtest/gtest.h>
#include <HugeInt/HugeInt.h>
#include "../source/library/library.hpp"


TEST(bitHackSwap_Test, Demonstrate_Whether_BitHackSwap_Is_Valid)
{
    HugeInt* x = new HugeInt(5);
    HugeInt* y = new HugeInt(6);

    bitHackSwap(x, y);

    EXPECT_EQ(strcmp(x->to_string(), "6"), 0);
}
