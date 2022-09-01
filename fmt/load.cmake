include(ExternalProject)
include(FetchContent)

get_filename_component(_TGT_NAME ${CMAKE_CURRENT_LIST_DIR} NAME)
set(_TGT_VERSION 9.1.0)
set(_TGT_AUTHOR fmtlib)
#ExternalProject_Add(
#        ${_TGT_NAME}
#        PREFIX ${DEPS_DIR}
#        URL https://codeload.github.com/${_TGT_AUTHOR}/${_TGT_NAME}/tar.gz/refs/tags/${_TGT_VERSION}
#)
#ExternalProject_Get_Property (${libTLS} install_dir)
#include_directories (${install_dir}/include)


FetchContent_Declare(
        ${_TGT_NAME}
        PREFIX ${DEPS_DIR}
        URL https://codeload.github.com/${_TGT_AUTHOR}/${_TGT_NAME}/tar.gz/refs/tags/${_TGT_VERSION}
)

FetchContent_MakeAvailable(${_TGT_NAME})