include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)
# https://github.com/lz4/lz4/releases

MakeDepReady(VERSION v1.9.4
        DISABLE_CONFIGURE
        BUILD_IN_SOURCE TRUE
        BUILD_COMMAND ${MAKE_EXECUTABLE} -j
        INSTALL_COMMAND ${MAKE_EXECUTABLE} -j install PREFIX=<INSTALL_DIR> prefix=<INSTALL_DIR>
        )