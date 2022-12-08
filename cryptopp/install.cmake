include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)
# https://github.com/weidai11/cryptopp

function(Process)
    get_filename_component(DEP_NAME ${CMAKE_CURRENT_LIST_DIR} NAME)
    if (NOT TARGET ${DEP_NAME})
        SetBasicVariables(NAME ${DEP_NAME} VERSION CRYPTOPP_8_7_0 AUTHOR weidai11)
        ExternalProject_Add(
                ${DEP_NAME}
                PREFIX ${DEPS_PREFIX}
                URL ${GITHUB_DOWNLOAD_URL}
                INSTALL_DIR ${DEP_INSTALL_DIR}
                CONFIGURE_COMMAND ""
                BUILD_COMMAND ${MAKE_EXECUTABLE} -j -C <SOURCE_DIR>
                INSTALL_COMMAND ${MAKE_EXECUTABLE} -j -C <SOURCE_DIR> install PREFIX=<INSTALL_DIR> prefix=<INSTALL_DIR>
        )
    endif ()
endfunction(Process)
Process()
unset(Process)