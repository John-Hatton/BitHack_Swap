#CMakeLists.txt for Project

cmake_minimum_required(VERSION 3.14)

project(BitHack_Swap)


set(CMAKE_CXX_STANDARD 20)

include_directories(library)


add_subdirectory(source)
add_subdirectory(tests)




#include_directories(${BitHack_Swap_SOURCE_DIR}/include)


#
##
#
########
#
##
#

####################
#					#
#    Google Test	#
#					#
####################



include(FetchContent)
FetchContent_Declare(
        googletest
        GIT_REPOSITORY https://github.com/google/googletest.git
        GIT_TAG release-1.12.1 # most recent version 9/2022 Check GITHUB!
)


# This is to ensure that GTest will work with Windows
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)
