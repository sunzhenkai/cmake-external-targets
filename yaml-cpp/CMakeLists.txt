PROJECT(cmake-external-targets)
CMAKE_MINIMUM_REQUIRED(VERSION 3.24)
SET(CMAKE_CXX_STANDARD 17)
include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)

# https://github.com/jbeder/yaml-cpp
MakeDepReady(
        VERSION ${VERSION}
        AUTHOR jbeder
        EXTRA_ARGS -DYAML_CPP_BUILD_TESTS=OFF
)