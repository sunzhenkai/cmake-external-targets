include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../openssl/load.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../gflags/load.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../leveldb/load.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../zlib/load.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../protobuf/load.cmake)

MakeReadyNow(PATH ${CMAKE_CURRENT_LIST_DIR} VERSION 1.3.0)
