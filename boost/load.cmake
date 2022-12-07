include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)

get_filename_component(_TGT_NAME ${CMAKE_CURRENT_LIST_DIR} NAME)
set(_TGT_VERSION boost-1.80.0)

#FetchContent_Declare(
#        ${_TGT_NAME}
#        PREFIX ${DEPS_DIR}/${_TGT_NAME}
#        INSTALL_DIR ${DEPS_DIR}/${_TGT_NAME}
#        GIT_REPOSITORY https://github.com/boostorg/boost.git
#        GIT_TAG ${_TGT_VERSION}
#        GIT_SHALLOW TRUE
#)

#FetchContent_Declare(
#        ${_TGT_NAME}
#        PREFIX ${DEPS_DIR}/${_TGT_NAME}
#        INSTALL_DIR ${DEPS_DIR}/${_TGT_NAME}
#        URL https://wii-share.oss-cn-beijing.aliyuncs.com/cpp/external/boost-submodule-boost-1.80.0.tar.gz
#)

FetchContent_Declare(
        ${_TGT_NAME}
        PREFIX ${DEPS_DIR}/${_TGT_NAME}
        URL file:///tmp/boost-submodule-boost-1.80.0-1.tar.gz
)

FetchContent_MakeAvailable(${_TGT_NAME})

unset(_TGT_NAME)
unset(_TGT_VERSION)
