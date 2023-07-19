PROJECT(cmake-external-targets)
CMAKE_MINIMUM_REQUIRED(VERSION 3.24)
SET(CMAKE_CXX_STANDARD 17)
include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../boost/load.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../flex/load.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../libevent/load.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../openssl/load.cmake)

# https://github.com/apache/thrift
MakeDepReady(
        VERSION ${VERSION}
        AUTHOR apache
        EXTRA_ARGS -DBUILD_CPP=ON -DBUILD_C_GLIB=ON
        -DBUILD_JAVA=OFF -DBUILD_JAVASCRIPT=OFF -DBUILD_KOTLIN=OFF -DBUILD_NODEJS=OFF -DBUILD_PYTHON=OFF
        -DBUILD_TESTING=OFF
)