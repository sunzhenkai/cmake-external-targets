include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)
# https://github.com/c-ares/c-ares

function(Process)
    get_filename_component(_DEP_NAME ${CMAKE_CURRENT_LIST_DIR} NAME)
    set(_DEP_VERSION cares-1_18_1)
    set(_DEP_AUTHOR ${_DEP_NAME})
    set(_DEP_PROJECT ${_DEP_NAME})
    set(CUSTOM_ARGS -DABSL_BUILD_TESTING=OFF -DABSL_USE_GOOGLETEST_HEAD=ON)
    GetCMakeArgs()

    ExternalProject_Add(
            ${_DEP_NAME}
            URL https://codeload.github.com/${_DEP_AUTHOR}/${_DEP_PROJECT}/tar.gz/refs/tags/${_DEP_VERSION}
            CMAKE_ARGS ${CMAKE_ARGS} ${CUSTOM_ARGS}
    )
endfunction(Process)
Process()
unset(Process)