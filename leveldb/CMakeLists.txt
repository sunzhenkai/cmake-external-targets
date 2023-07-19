PROJECT(cmake-external-targets)
CMAKE_MINIMUM_REQUIRED(VERSION 3.24)
SET(CMAKE_CXX_STANDARD 17)
include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../snappy/load.cmake)

# https://github.com/google/leveldb
MakeDepReady(
        VERSION ${VERSION}
        AUTHOR google
        URL https://wii-share.oss-cn-beijing.aliyuncs.com/cpp/external/leveldb-submodule-1.23.tar.gz
)