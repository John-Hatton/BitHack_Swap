project(Google_Tests)

# adding the Google_Tests_run target
add_executable(BitHack_Swap_Tests BitHack_Swap_Tests.cpp)


# This step is crutial to see your BitHack code from GTEST
# linking BitHack_Swap_Tests with BitHack_Swap_lib which will be tested
target_link_libraries(BitHack_Swap_Tests BitHack_Swap_lib)
target_link_libraries(BitHack_Swap_Tests ${CMAKE_SOURCE_DIR}/library/HugeInt/lib/libHugeInt_lib.a)


# We also link with the GTest stuff!
target_link_libraries(BitHack_Swap_Tests gtest gtest_main)
