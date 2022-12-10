include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)
# https://github.com/google/leveldb

set(python3_version 3.11.1)
MakeDepReady(VERSION ${python3_version}
        AUTHOR google
        URL https://wii-share.oss-cn-beijing.aliyuncs.com/cpp/external/Python-${python3_version}.tar.xz
#        URL https://www.python.org/ftp/python/${python3_version}/Python-${python3_version}.tar.xz
        CONFIGURE_COMMAND env CC=${CMAKE_C_COMPILER} CXX=${CMAKE_CXX_COMPILER}
        <SOURCE_DIR>/configure --prefix=<INSTALL_DIR> --enable-shared --enable-unicode=ucs4 --with-ensurepip=yes
        LDFLAGS=-Wl,-rpath,\\\$\$ORIGIN/../lib
        BUILD_IN_SOURCE TRUE
        BUILD_COMMAND ${MAKE_EXECUTABLE} -j -C <SOURCE_DIR>
        INSTALL_COMMAND ${MAKE_EXECUTABLE} -j -C <SOURCE_DIR> install
        )
