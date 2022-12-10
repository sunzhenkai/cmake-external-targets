include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)
# https://github.com/jemalloc/jemalloc

MakeDepReady(VERSION 5.3.0
        BUILD_IN_SOURCE TRUE
        CONFIGURE_COMMAND ./autogen.sh --prefix=<INSTALL_DIR>
        BUILD_COMMAND ${MAKE_EXECUTABLE} -j
        INSTALL_COMMAND ${MAKE_EXECUTABLE} -j install PREFIX=<INSTALL_DIR> prefix=<INSTALL_DIR>
        )