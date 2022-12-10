include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)
# https://github.com/facebook/rocksdb

MakeDepReady(VERSION v7.7.3 AUTHOR facebook EXTRA_ARGS -DWITH_TESTS=OFF -DROCKSDB_BUILD_SHARED=OFF)
