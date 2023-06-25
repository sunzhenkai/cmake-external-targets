PROJECT(cmake-external-targets)
CMAKE_MINIMUM_REQUIRED(VERSION 3.24)
SET(CMAKE_CXX_STANDARD 17)

include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../openssl/load.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../gflags/load.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../leveldb/load.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../protobuf/load.cmake)

# https://github.com/apache/incubator-brpc
MakeDepReady(
        VERSION ${VERSION}
        AUTHOR apache
        #        AUTHOR sunzhenkai
        PROJECT incubator-brpc
        EXTRA_ARGS -DWITH_SNAPPY=ON
)
