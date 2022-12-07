include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)

get_filename_component(_TGT_NAME ${CMAKE_CURRENT_LIST_DIR} NAME)
set(_TGT_VERSION 9.1.0)

ExternalProject_Add(
        ${_TGT_NAME}
        PREFIX ${DEPS_DIR}/${_TGT_NAME}
        INSTALL_DIR ${DEPS_DIR}/${_TGT_NAME}
        URL file:///tmp/boost-submodule-boost-1.80.0-1.tar.gz
)
#        URL https://codeload.github.com/fmtlib/${_TGT_NAME}/tar.gz/refs/tags/${_TGT_VERSION}

unset(_TGT_NAME)
unset(_TGT_VERSION)