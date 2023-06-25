PROJECT(cmake-external-targets)
CMAKE_MINIMUM_REQUIRED(VERSION 3.24)
SET(CMAKE_CXX_STANDARD 17)
include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)

# https://github.com/jemalloc/jemalloc
MakeDepReady(
        VERSION ${VERSION}
        URL https://mirrors.tuna.tsinghua.edu.cn/gnu/bison/bison-3.8.tar.xz
        CONFIGURE_COMMAND ./configure --prefix=<INSTALL_DIR>
        BUILD_IN_SOURCE TRUE
        BUILD_COMMAND ${MAKE_EXECUTABLE} -j
        INSTALL_COMMAND ${MAKE_EXECUTABLE} -j install PREFIX=<INSTALL_DIR> prefix=<INSTALL_DIR>
        ADD_BIN_PATH
)