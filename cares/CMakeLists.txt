PROJECT(cmake-external-targets)
CMAKE_MINIMUM_REQUIRED(VERSION 3.24)
SET(CMAKE_CXX_STANDARD 17)
include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)

# https://github.com/abseil/abseil-cpp
MakeDepReady(VERSION ${VERSION} AUTHOR c-ares PROJECT c-ares)