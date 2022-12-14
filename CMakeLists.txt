PROJECT(cmake-external-targets)
CMAKE_MINIMUM_REQUIRED(VERSION 3.16)
SET(CMAKE_CXX_STANDARD 17)

include(absl/load.cmake)
include(bison/load.cmake)
include(boost/load.cmake)
include(brpc/load.cmake)
include(c-ares/load.cmake)
include(cryptopp/load.cmake)
include(curl/load.cmake)
include(flatbuffers/load.cmake)
include(flex/load.cmake)
include(fmt/load.cmake)
include(gcc/load.cmake)
include(gflags/load.cmake)
include(gnutls/load.cmake)
include(googletest/load.cmake)
include(gperftools/load.cmake)
include(grpc/load.cmake)
include(jemalloc/load.cmake)
include(leveldb/load.cmake)
include(lksctp-tools/load.cmake)
include(lz4/load.cmake)
include(nettle/load.cmake)
include(lz4/load.cmake)
include(openssl/load.cmake)
include(protobuf/load.cmake)
include(python2/load.cmake)
include(python3/load.cmake)
include(rapidjson/load.cmake)
include(re2/load.cmake)
include(rocksdb/load.cmake)
include(seastar/load.cmake)
include(snappy/load.cmake)
include(spdlog/load.cmake)
include(thrift/load.cmake)
include(valgrind/load.cmake)
include(yaml-cpp/load.cmake)

add_custom_target(cmake-external-libs ${CMAKE_COMMAND} ${CMAKE_SOURCE_DIR} DEPENDS ${DEPS_LIST})