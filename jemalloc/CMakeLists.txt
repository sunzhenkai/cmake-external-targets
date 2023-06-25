PROJECT(cmake-external-targets)
CMAKE_MINIMUM_REQUIRED(VERSION 3.24)
SET(CMAKE_CXX_STANDARD 17)
include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)

# https://github.com/jemalloc/jemalloc
MakeDepReady(
        VERSION ${VERSION}
        BUILD_IN_SOURCE TRUE
        CONFIGURE_COMMAND ./autogen.sh --prefix=<INSTALL_DIR>
        BUILD_COMMAND ${MAKE_EXECUTABLE} -j
        INSTALL_COMMAND ${MAKE_EXECUTABLE} -j install PREFIX=<INSTALL_DIR> prefix=<INSTALL_DIR>
)