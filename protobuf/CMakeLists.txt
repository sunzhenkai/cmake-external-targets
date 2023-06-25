PROJECT(cmake-external-targets)
CMAKE_MINIMUM_REQUIRED(VERSION 3.24)
SET(CMAKE_CXX_STANDARD 17)
include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)

# https://github.com/protocolbuffers/protobuf
MakeDepReady(
        VERSION ${VERSION}
        AUTHOR protocolbuffers
        URL https://wii-share.oss-cn-beijing.aliyuncs.com/cpp/external/protobuf-submodule-v3.21.11.tar.gz
        EXTRA_ARGS -Dprotobuf_BUILD_TESTS=OFF -Dprotobuf_WITH_ZLIB=ON
)