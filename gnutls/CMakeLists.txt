PROJECT(cmake-external-targets)
CMAKE_MINIMUM_REQUIRED(VERSION 3.24)
SET(CMAKE_CXX_STANDARD 17)
include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../nettle/load.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../zlib/load.cmake)

MakeDepReady(
        VERSION ${VERSION}
        URL https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.16.tar.xz
        #        URL https://mirrors.tuna.tsinghua.edu.cn/gnu/gnutls/gnutls-3.1.5.tar.xz
        CONFIGURE_COMMAND ./configure --prefix=<INSTALL_DIR> --with-included-unistring
        BUILD_IN_SOURCE TRUE
        BUILD_COMMAND ${MAKE_EXECUTABLE} -j -C <SOURCE_DIR>
        INSTALL_COMMAND ${MAKE_EXECUTABLE} -j -C <SOURCE_DIR> install PREFIX=<INSTALL_DIR> prefix=<INSTALL_DIR>
        ADD_BIN_PATH
)