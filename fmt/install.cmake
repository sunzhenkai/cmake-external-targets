include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)
# https://github.com/fmtlib/fmt

function(Process)
    get_filename_component(_DEP_NAME ${CMAKE_CURRENT_LIST_DIR} NAME)
    set(_DEP_VERSION 9.1.0)
    set(_DEP_AUTHOR fmtlib)
    set(_DEP_PROJECT fmt)
    GetCMakeArgs()

    ExternalProject_Add(
            ${_DEP_NAME}
            URL https://codeload.github.com/${_DEP_AUTHOR}/${_DEP_PROJECT}/tar.gz/refs/tags/${_DEP_VERSION}
            CMAKE_ARGS ${CMAKE_ARGS}
    )
endfunction(Process)
Process()
unset(Process)