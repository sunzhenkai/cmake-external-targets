include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)
# https://github.com/sctp/lksctp-tools
# dependencies: libtoolize

MakeDepReady(VERSION v1.0.19
        AUTHOR sctp
        CONFIGURE_COMMAND ./bootstrap && ./configure --prefix=<INSTALL_DIR>
        BUILD_IN_SOURCE TRUE
        BUILD_COMMAND ${MAKE_EXECUTABLE} -j -C <SOURCE_DIR>
        INSTALL_COMMAND ${MAKE_EXECUTABLE} -j -C <SOURCE_DIR> install PREFIX=<INSTALL_DIR> prefix=<INSTALL_DIR>
        )