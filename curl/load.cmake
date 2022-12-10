include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../openssl/load.cmake)
# https://github.com/curl/curl

MakeDepReady(
        VERSION curl-7_86_0
        DEPENDS openssl
)