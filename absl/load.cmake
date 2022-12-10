include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)
# https://github.com/abseil/abseil-cpp

MakeDepReady(
        VERSION 20220623.1
        AUTHOR abseil
        PROJECT abseil-cpp
        EXTRA_ARGS -DABSL_BUILD_TESTING=OFF -DABSL_USE_GOOGLETEST_HEAD=ON
)