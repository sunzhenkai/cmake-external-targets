PROJECT(cmake-external-targets)
CMAKE_MINIMUM_REQUIRED(VERSION 3.24)
SET(CMAKE_CXX_STANDARD 17)
include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)

#env LDFLAGS="-L/tmp/cpp-external-lib/nettle/lib64" CFLAGS="-I/tmp/cpp-external-lib/nettle/include" LD_LIBRARY_PATH=/tmp/cpp-external-lib/nettle/lib64
#set(ENV{LDFLAGS} "-L/tmp/cpp-external-lib/nettle/lib64")
#set(ENV{CFLAGS} "-I/tmp/cpp-external-lib/nettle/include")
#set(ENV{LD_LIBRARY_PATH} "/tmp/cpp-external-lib/nettle/lib64")

MakeDepReady(
        VERSION ${VERSION}
        URL https://mirrors.tuna.tsinghua.edu.cn/gnu/gnutls/gnutls-3.1.5.tar.xz
        CONFIGURE_COMMAND ./configure --prefix=<INSTALL_DIR>
        BUILD_IN_SOURCE TRUE
        BUILD_COMMAND ${MAKE_EXECUTABLE} -j -C <SOURCE_DIR>
        INSTALL_COMMAND ${MAKE_EXECUTABLE} -j -C <SOURCE_DIR> install PREFIX=<INSTALL_DIR> prefix=<INSTALL_DIR>
        ADD_BIN_PATH
)