include(FetchContent)

get_filename_component(_TGT_NAME ${CMAKE_CURRENT_LIST_DIR} NAME)
set(_TGT_VERSION boost-1.80.0)
set(_TGT_AUTHOR boostorg)

message(${_TGT_NAME})

FetchContent_Declare(
        ${_TGT_NAME}
        PREFIX ${DEPS_DIR}
        URL https://codeload.github.com/${_TGT_AUTHOR}/${_TGT_NAME}/tar.gz/refs/tags/${_TGT_VERSION}
)
FetchContent_MakeAvailable(${_TGT_NAME})
#FetchContent_GetProperties(${_TGT_NAME})
#if (NOT ${_TGT_NAME}_POPULATED)
#    FetchContent_Populate(${_TGT_NAME})
#    FetchContent_MakeAvailable(${_TGT_NAME})
#    #    add_subdirectory(${${_TGT_NAME}_SOURCE_DIR} ${${_TGT_NAME}_BINARY_DIR})
#endif ()

