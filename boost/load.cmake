include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)

get_filename_component(_TGT_NAME ${CMAKE_CURRENT_LIST_DIR} NAME)
set(_TGT_VERSION boost-1.80.0)

FetchContent_Declare(
        ${_TGT_NAME}
        PREFIX ${DEPS_DIR}/${_TGT_NAME}
        INSTALL_DIR ${DEPS_DIR}/${_TGT_NAME}
        GIT_REPOSITORY https://github.com/boostorg/boost.git
        GIT_TAG ${_TGT_VERSION}
)
FetchContent_MakeAvailable(Boost)

unset(_TGT_NAME)
unset(_TGT_VERSION)
