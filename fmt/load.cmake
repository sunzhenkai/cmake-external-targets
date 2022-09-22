include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)

get_filename_component(_TGT_NAME ${CMAKE_CURRENT_LIST_DIR} NAME)
set(_TGT_VERSION 9.1.0)
set(_TGT_AUTHOR fmtlib)
set(_TGT_PROJECT fmt)

FetchContent_Declare(
        ${_TGT_NAME}
        PREFIX ${DEPS_DIR}/${_TGT_NAME}
        URL https://codeload.github.com/${_TGT_AUTHOR}/${_TGT_PROJECT}/tar.gz/refs/tags/${_TGT_VERSION}
)

FetchContent_MakeAvailable(${_TGT_NAME})

unset(_TGT_NAME)
unset(_TGT_AUTHOR)
unset(_TGT_VERSION)