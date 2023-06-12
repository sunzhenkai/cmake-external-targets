include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../snappy/load.cmake)
# https://github.com/google/leveldb

MakeDepReady(
        VERSION 1.23
        AUTHOR google
        URL https://wii-share.oss-cn-beijing.aliyuncs.com/cpp/external/leveldb-submodule-1.23.tar.gz
        DEPENDS snappy_lib
)