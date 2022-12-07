include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)

get_filename_component(_DEP_NAME ${CMAKE_CURRENT_LIST_DIR} NAME)
set(_DEP_VERSION 9.1.0)

FetchContent_Declare(
        ${_DEP_NAME}
        PREFIX ${DEPS_PREFIX}/${_DEP_NAME}
        INSTALL_DIR ${DEPS_PREFIX}/${_DEP_NAME}
        URL https://codeload.github.com/fmtlib/${_DEP_NAME}/tar.gz/refs/tags/${_DEP_VERSION}
)

FetchContent_MakeAvailable(${_DEP_NAME})

unset(_DEP_NAME)
unset(_DEP_VERSION)