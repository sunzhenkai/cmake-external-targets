PROJECT(cmake-external-targets)
CMAKE_MINIMUM_REQUIRED(VERSION 3.24)
SET(CMAKE_CXX_STANDARD 17)

message(STATUS "AAA LDFLAGS=$ENV{LDFLAGS}, DEP=${DEP_NAME}")
include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)
message(STATUS "CCC LDFLAGS=$ENV{LDFLAGS}, DEP=${DEP_NAME}")

# https://github.com/apache/incubator-brpc
MakeDepReady(
        VERSION ${VERSION}
        AUTHOR apache
        #        AUTHOR sunzhenkai
        PROJECT incubator-brpc
        EXTRA_ARGS -DWITH_SNAPPY=ON
)
