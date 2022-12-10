include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)
# https://github.com/protocolbuffers/protobuf

MakeDepReady(VERSION v3.21.11
        AUTHOR protocolbuffers
        URL https://wii-share.oss-cn-beijing.aliyuncs.com/cpp/external/protobuf-submodule-v3.21.11.tar.gz
        EXTRA_ARGS -Dprotobuf_BUILD_TESTS=OFF)