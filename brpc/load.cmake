include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../openssl/load.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../gflags/load.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../leveldb/load.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../protobuf/load.cmake)
# https://github.com/apache/incubator-brpc

MakeDepReady(
        VERSION 1.3.0
        AUTHOR apache
        PROJECT incubator-brpc
        DEPENDS gflags leveldb protobuf openssl
        EXTRA_ARGS -DWITH_SNAPPY=ON
        SET_PKG_CONFIG_PATH
)