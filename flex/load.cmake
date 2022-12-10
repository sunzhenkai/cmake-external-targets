include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../help2man/load.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../textinfo/load.cmake)
# https://github.com/westes/flex

message("hello $ENV{PATH}")

MakeDepReady(VERSION v2.6.4 AUTHOR westes
        CONFIGURE_COMMAND ./autogen.sh --prefix=<INSTALL_DIR> && ./configure --prefix=<INSTALL_DIR>
        BUILD_IN_SOURCE TRUE
        BUILD_COMMAND env PATH=$ENV{PATH} ${MAKE_EXECUTABLE} -j -C <SOURCE_DIR>
        INSTALL_COMMAND ${MAKE_EXECUTABLE} -j -C <SOURCE_DIR> install PREFIX=<INSTALL_DIR> prefix=<INSTALL_DIR>
        DEPENDS help2man textinfo
        )