include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../cryptopp/install.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../openssl/install.cmake)
# https://github.com/curl/curl

function(Process)
    get_filename_component(DEP_NAME ${CMAKE_CURRENT_LIST_DIR} NAME)
    SetBasicVariables(NAME ${DEP_NAME} VERSION curl-7_86_0)
#    set(EXTRA_ARGS -DOPENSSL_CRYPTO_LIBRARY=${CRYPTOPP_INSTALL_DIR} -DOPENSSL_ROOT_DIR=)
    message("CKPT;  ${OPENSSL_ROOT_DIR},,, ${CMAKE_PREFIX_PATH}")

    ExternalProject_Add(
            ${DEP_NAME}
            URL ${GITHUB_DOWNLOAD_URL}
            CMAKE_ARGS ${CMAKE_ARGS}
    )
endfunction(Process)
Process()
unset(Process)