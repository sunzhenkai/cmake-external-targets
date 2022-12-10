include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)
# https://github.com/abseil/abseil-cpp

MakeDepReady(
        VERSION OpenSSL_1_1_1s
        CONFIGURE_COMMAND <SOURCE_DIR>/config --prefix=<INSTALL_DIR>
        BUILD_IN_SOURCE TRUE
        BUILD_COMMAND ${MAKE_EXECUTABLE} -j
        INSTALL_COMMAND ${MAKE_EXECUTABLE} -j install PREFIX=<INSTALL_DIR> prefix=<INSTALL_DIR>
)