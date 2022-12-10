include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)
# https://github.com/apache/thrift

MakeDepReady(VERSION 3.18.1
#        URL https://sourceware.org/pub/valgrind/valgrind-3.18.1.tar.bz2
        URL https://wii-share.oss-cn-beijing.aliyuncs.com/cpp/external/valgrind-3.18.1.tar.bz2
        BUILD_IN_SOURCE TRUE
        CONFIGURE_COMMAND ./configure --prefix=<INSTALL_DIR> --enable-inner
        BUILD_COMMAND ${MAKE_EXECUTABLE} -j -C <SOURCE_DIR>
        INSTALL_COMMAND ${MAKE_EXECUTABLE} -j -C <SOURCE_DIR> install
        )