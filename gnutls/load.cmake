include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../nettle/load.cmake)

MakeDepReady(VERSION 3.1.5
        URL https://mirrors.tuna.tsinghua.edu.cn/gnu/gnutls/gnutls-3.1.5.tar.xz
        CONFIGURE_COMMAND ./configure --prefix=<INSTALL_DIR>
        BUILD_IN_SOURCE TRUE
        BUILD_COMMAND ${MAKE_EXECUTABLE} -j -C <SOURCE_DIR>
        INSTALL_COMMAND ${MAKE_EXECUTABLE} -j -C <SOURCE_DIR> install PREFIX=<INSTALL_DIR> prefix=<INSTALL_DIR>
        ADD_BIN_PATH
        DEPENDS nettle
        )