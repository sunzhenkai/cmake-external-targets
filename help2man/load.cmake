include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)

MakeDepReady(VERSION 1.49.2
        URL https://mirrors.tuna.tsinghua.edu.cn/gnu/help2man/help2man-1.49.2.tar.xz
        CONFIGURE_COMMAND ./configure --prefix=<INSTALL_DIR>
        BUILD_IN_SOURCE TRUE
        BUILD_COMMAND ${MAKE_EXECUTABLE} -j -C <SOURCE_DIR>
        INSTALL_COMMAND ${MAKE_EXECUTABLE} -j -C <SOURCE_DIR> install PREFIX=<INSTALL_DIR> prefix=<INSTALL_DIR>
        ADD_BIN_PATH
        )