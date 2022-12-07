include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)
# https://github.com/weidai11/cryptopp

function(Process)
    get_filename_component(DEP_NAME ${CMAKE_CURRENT_LIST_DIR} NAME)
    SetBasicVariables(NAME ${DEP_NAME}
            VERSION CRYPTOPP_8_7_0
            AUTHOR weidai11)

    ExternalProject_Add(
            ${DEP_NAME}
            URL https://codeload.github.com/${DEP_AUTHOR}/${DEP_PROJECT}/tar.gz/refs/tags/${DEP_VERSION}
            INSTALL_DIR ${DEP_PREFIX}
            CONFIGURE_COMMAND ""
            BUILD_COMMAND ${MAKE_EXECUTABLE} -j -C <SOURCE_DIR>
            INSTALL_COMMAND ${MAKE_EXECUTABLE} -j -C <SOURCE_DIR> install PREFIX=<INSTALL_DIR> prefix=<INSTALL_DIR>
    )
endfunction(Process)
Process()
unset(Process)