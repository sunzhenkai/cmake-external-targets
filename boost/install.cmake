include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)
# https://github.com/boostorg/boost

function(Process)
    get_filename_component(_DEP_NAME ${CMAKE_CURRENT_LIST_DIR} NAME)
    set(_DEP_VERSION 1.80.0)
    set(_DEP_AUTHOR boostorg)
    set(_DEP_PROJECT boost)
    set(CUSTOM_ARGS -DABSL_BUILD_TESTING=OFF -DABSL_USE_GOOGLETEST_HEAD=ON)
    GetCMakeArgs()

    set(CMAKE_ARGS
            -DCMAKE_BUILD_TYPE=Release
            -DCMAKE_INSTALL_PREFIX=${DEPS_PREFIX}
            -DCMAKE_INSTALL_LIBDIR=lib
            -DBUILD_STATIC_LIB=ON
            -DBUILD_SHARED_LIB=OFF)

    ExternalProject_Add(
            ${_DEP_NAME}
            URL file:///tmp/boost-submodule-boost-1.80.0.tar.gz
            CMAKE_ARGS ${CMAKE_ARGS}
    )

    unset(_DEP_NAME)
    unset(_DEP_VERSION)
endfunction(Process)
Process()
unset(Process)