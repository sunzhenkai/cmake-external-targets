set(DEPS_INSTALL_DIR "/tmp/cpp-external-lib" CACHE STRING "library install prefix")
set(DEPS_PREFIX "/tmp/cpp-external-prefix" CACHE STRING "library install prefix")

include(FetchContent)
set(FETCHCONTENT_BASE_DIR "${DEPS_INSTALL_DIR}")
include(ExternalProject)

function(GetCMakeArgs)
    set(CMAKE_ARGS
            -DCMAKE_CXX_STANDARD=${CMAKE_CXX_STANDARD}
            -DCMAKE_BUILD_TYPE=Release
            -DCMAKE_INSTALL_PREFIX=${DEPS_INSTALL_DIR}/${_DEP_NAME}
            -DCMAKE_INSTALL_LIBDIR=lib
            -DBUILD_STATIC_LIB=ON
            -DBUILD_SHARED_LIB=OFF PARENT_SCOPE)
endfunction(GetCMakeArgs)

macro(SetBasicVariables)
    cmake_parse_arguments(ARG "" "" "NAME;VERSION;AUTHOR;PROJECT" ${ARGN})
    if ("${DEPS_INSTALL_DIR}" STREQUAL "")
        message(FATAL "Variable DEPS_INSTALL_DIR not configured.")
    endif ()

    set(DEP_VERSION ${ARG_VERSION})
    set(DEP_NAME ${ARG_NAME})
    set(DEP_AUTHOR ${ARG_AUTHOR})
    set(DEP_PROJECT ${ARG_NAME})
    set(DEP_INSTALL_DIR ${DEPS_INSTALL_DIR}/${ARG_NAME})
    find_program(MAKE_EXECUTABLE NAMES make gmake mingw32-make REQUIRED)

    if ("${DEP_PROJECT}" STREQUAL "")
        set(DEP_PROJECT ${ARG_NAME})
    endif ()
    if ("${DEP_AUTHOR}" STREQUAL "")
        set(DEP_AUTHOR ${ARG_NAME})
    endif ()
    set(GITHUB_DOWNLOAD_URL https://codeload.github.com/${DEP_AUTHOR}/${DEP_PROJECT}/tar.gz/refs/tags/${DEP_VERSION})
endmacro(SetBasicVariables)