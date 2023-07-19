PROJECT(cmake-external-targets)
CMAKE_MINIMUM_REQUIRED(VERSION 3.24)
SET(CMAKE_CXX_STANDARD 17)
include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)

MakeDepReady(
        VERSION ${VERSION}
        URL https://wii-share.oss-cn-beijing.aliyuncs.com/cpp/external/Python-${VERSION}.tar.xz
        #        URL https://www.python.org/ftp/python/${python2_version}/Python-${VERSION}.tar.xz
        CONFIGURE_COMMAND env CC=${CMAKE_C_COMPILER} CXX=${CMAKE_CXX_COMPILER} LIBRARY_PATH=$ENV{LIBRARY_PATH} CPATH=$ENV{CPATH}
        <SOURCE_DIR>/configure --prefix=<INSTALL_DIR> --enable-shared --enable-unicode=ucs4 --with-ensurepip=yes
        LDFLAGS=-Wl,-rpath,\\\$\$ORIGIN/../lib
        BUILD_IN_SOURCE TRUE
        BUILD_COMMAND ${MAKE_EXECUTABLE} -j -C <SOURCE_DIR>
        INSTALL_COMMAND ${MAKE_EXECUTABLE} -j -C <SOURCE_DIR> install
)