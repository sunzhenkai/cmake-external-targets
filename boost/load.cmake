include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)

get_filename_component(_TGT_NAME ${CMAKE_CURRENT_LIST_DIR} NAME)
set(_TGT_VERSION boost-1.80.0)
set(_TGT_AUTHOR boostorg)

message(${_TGT_NAME})

FetchContent_Declare(
        ${_TGT_NAME}
        PREFIX ${DEPS_DIR}/${_TGT_NAME}
        URL $ENV{SPEED_UP_BASE}/${_TGT_NAME}-submodule-${_TGT_VERSION}.tar.gz
)
FetchContent_MakeAvailable(${_TGT_NAME})
#FetchContent_GetProperties(${_TGT_NAME})
#if (NOT ${_TGT_NAME}_POPULATED)
#    FetchContent_Populate(${_TGT_NAME})
#    FetchContent_MakeAvailable(${_TGT_NAME})
#    #    add_subdirectory(${${_TGT_NAME}_SOURCE_DIR} ${${_TGT_NAME}_BINARY_DIR})
#endif ()

unset(_TGT_NAME)
unset(_TGT_AUTHOR)
unset(_TGT_VERSION)

