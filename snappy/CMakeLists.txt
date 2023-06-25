PROJECT(cmake-external-targets)
CMAKE_MINIMUM_REQUIRED(VERSION 3.24)
SET(CMAKE_CXX_STANDARD 17)
include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)

# https://github.com/google/snappy
MakeDepReady(
        VERSION ${VERSION}
        AUTHOR google
        URL https://wii-share.oss-cn-beijing.aliyuncs.com/cpp/external/snappy-submodule-1.1.9.tar.gz
)
