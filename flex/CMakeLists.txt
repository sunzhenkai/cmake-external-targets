PROJECT(cmake-external-targets)
CMAKE_MINIMUM_REQUIRED(VERSION 3.24)
SET(CMAKE_CXX_STANDARD 17)
include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)

# https://github.com/westes/flex
MakeDepReady(
        VERSION ${VERSION}
        AUTHOR westes
        URL https://github.com/westes/flex/releases/download/v2.6.4/flex-2.6.4.tar.gz
        CONFIGURE_COMMAND ./autogen.sh --prefix=<INSTALL_DIR> && ./configure --prefix=<INSTALL_DIR>
        BUILD_IN_SOURCE TRUE
        BUILD_COMMAND env PATH=$ENV{PATH} ${MAKE_EXECUTABLE} -j -C <SOURCE_DIR>
        INSTALL_COMMAND ${MAKE_EXECUTABLE} -j -C <SOURCE_DIR> install PREFIX=<INSTALL_DIR> prefix=<INSTALL_DIR>
        #        DEPENDS help2man_lib textinfo_lib bison_lib
        ADD_BIN_PATH
)
