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
        DEPENDS gflags_lib leveldb_lib protobuf_lib openssl_lib
        EXTRA_ARGS -DWITH_SNAPPY=ON
)
