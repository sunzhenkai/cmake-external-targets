include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)

get_filename_component(_DEP_NAME ${CMAKE_CURRENT_LIST_DIR} NAME)
set(_DEP_VERSION boost-1.80.0)

#FetchContent_Declare(
#        ${_DEP_NAME}
#        PREFIX ${DEPS_INSTALL_DIR}/${_DEP_NAME}
#        INSTALL_DIR ${DEPS_INSTALL_DIR}/${_DEP_NAME}
#        GIT_REPOSITORY https://github.com/boostorg/boost.git
#        GIT_TAG ${_DEP_VERSION}
#        GIT_SHALLOW TRUE
#)

#FetchContent_Declare(
#        ${_DEP_NAME}
#        PREFIX ${DEPS_INSTALL_DIR}/${_DEP_NAME}
#        INSTALL_DIR ${DEPS_INSTALL_DIR}/${_DEP_NAME}
#        URL https://wii-share.oss-cn-beijing.aliyuncs.com/cpp/external/boost-submodule-boost-1.80.0.tar.gz
#)

FetchContent_Declare(
        ${_DEP_NAME}
        PREFIX ${DEPS_INSTALL_DIR}/${_DEP_NAME}
        URL file:///tmp/boost-submodule-boost-1.80.0-1.tar.gz
)

FetchContent_MakeAvailable(${_DEP_NAME})

unset(_DEP_NAME)
unset(_DEP_VERSION)
