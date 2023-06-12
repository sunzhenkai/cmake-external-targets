include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../help2man/load.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../textinfo/load.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../bison/load.cmake)
# https://github.com/westes/flex

MakeDepReady(
        VERSION v2.6.4
        AUTHOR westes
        URL https://github.com/westes/flex/releases/download/v2.6.4/flex-2.6.4.tar.gz
        CONFIGURE_COMMAND ./autogen.sh --prefix=<INSTALL_DIR> && ./configure --prefix=<INSTALL_DIR>
        BUILD_IN_SOURCE TRUE
        BUILD_COMMAND env PATH=$ENV{PATH} ${MAKE_EXECUTABLE} -j -C <SOURCE_DIR>
        INSTALL_COMMAND ${MAKE_EXECUTABLE} -j -C <SOURCE_DIR> install PREFIX=<INSTALL_DIR> prefix=<INSTALL_DIR>
        DEPENDS help2man_lib textinfo_lib bison_lib
        ADD_BIN_PATH
)
