include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)

MakeDepReady(
        VERSION v2.0.16
        CONFIGURE_COMMAND ./autogen.sh --prefix=<INSTALL_DIR> && ./configure --prefix=<INSTALL_DIR>
        BUILD_IN_SOURCE TRUE
        BUILD_COMMAND ${MAKE_EXECUTABLE} -j -C <SOURCE_DIR>
        INSTALL_COMMAND ${MAKE_EXECUTABLE} -j -C <SOURCE_DIR> install PREFIX=<INSTALL_DIR> prefix=<INSTALL_DIR>
)