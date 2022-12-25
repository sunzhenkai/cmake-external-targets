include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)
# https://github.com/abseil/abseil-cpp

if (BUILD_GCC)
    MakeDepReady(
            VERSION releases/gcc-10.4.0
            AUTHOR gcc-mirror
            BUILD_IN_SOURCE TRUE
            CONFIGURE_COMMAND ./contrib/download_prerequisites && ./configure --prefix=<INSTALL_DIR> --enable-languages=c,c++
            BUILD_COMMAND ${MAKE_EXECUTABLE} -j -C <SOURCE_DIR>
            INSTALL_COMMAND ${MAKE_EXECUTABLE} -j -C <SOURCE_DIR> install
    )
endif ()