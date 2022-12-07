include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)
# https://github.com/openssl/openssl

function(Process)
    get_filename_component(DEP_NAME ${CMAKE_CURRENT_LIST_DIR} NAME)
    SetBasicVariables(NAME ${DEP_NAME} VERSION OpenSSL_1_1_1s)
    # TODO 安装位置不对
    ExternalProject_Add(
            ${DEP_NAME}
            PREFIX ${DEPS_PREFIX}
            URL ${GITHUB_DOWNLOAD_URL}
            INSTALL_DIR ${DEP_INSTALL_DIR}
            CONFIGURE_COMMAND <SOURCE_DIR>/config --prefix=${DEP_INSTALL_DIR}
            BUILD_COMMAND ${MAKE_EXECUTABLE} -j -C <SOURCE_DIR>
            INSTALL_COMMAND ${MAKE_EXECUTABLE} -j -C <SOURCE_DIR> install PREFIX=<INSTALL_DIR> prefix=<INSTALL_DIR>
    )
endfunction(Process)
Process()
unset(Process)