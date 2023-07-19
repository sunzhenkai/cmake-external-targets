include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)
# brpc 没有用 find_package 查找 zlib, 先在这里添加在
include(${CMAKE_CURRENT_LIST_DIR}/../zlib/load.cmake)
#MakeReadyNow(PATH ${CMAKE_CURRENT_LIST_DIR} VERSION t0.0.7)
include(${CMAKE_CURRENT_LIST_DIR}/../openssl/load.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../gflags/load.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../leveldb/load.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../protobuf/load.cmake)

MakeReadyNow(PATH ${CMAKE_CURRENT_LIST_DIR} VERSION 1.5.0)
