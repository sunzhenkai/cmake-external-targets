include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)
# https://github.com/abseil/abseil-cpp

MakeDepReady(
        VERSION CRYPTOPP_8_7_0
        AUTHOR weidai11
        DISABLE_CONFIGURE
        BUILD_IN_SOURCE TRUE
        BUILD_COMMAND ${MAKE_EXECUTABLE} -j -C <SOURCE_DIR>
        INSTALL_COMMAND ${MAKE_EXECUTABLE} -j -C <SOURCE_DIR> install PREFIX=<INSTALL_DIR> prefix=<INSTALL_DIR>
)