PROJECT(cmake-external-targets)
CMAKE_MINIMUM_REQUIRED(VERSION 3.24)
SET(CMAKE_CXX_STANDARD 17)
include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)

# https://github.com/facebook/rocksdb
MakeDepReady(VERSION ${VERSION} AUTHOR facebook EXTRA_ARGS -DWITH_TESTS=OFF -DROCKSDB_BUILD_SHARED=OFF)
