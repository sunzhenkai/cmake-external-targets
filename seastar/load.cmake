include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../fmt/load.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../boost/load.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../protobuf/load.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../yaml-cpp/load.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../c-ares/load.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../lz4/load.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../cryptopp/load.cmake)
# https://github.com/scylladb/seastar

MakeDepReady(VERSION seastar-22.11.0
        AUTHOR scylladb
        EXTRA_ARGS -DCMAKE_BUILD_TYPE=RelWithDebInfo
        -DBoost_USE_STATIC_LIBS=OFF
        -DBoost_NO_BOOST_CMAKE=ON
        -DBoost_NO_SYSTEM_PATHS=TRUE
        -DProtobuf_USE_STATIC_LIBS=ON
        -DSeastar_INSTALL=ON
        -DSeastar_APPS=ON
        -DSeastar_DEMOS=OFF
        -DSeastar_DOCS=OFF
        -DSeastar_TESTING=OFF
        -DSeastar_CXX_FLAGS=-Wno-error
        -DSeastar_LD_FLAGS=-pthread
        -DSeastar_STD_OPTIONAL_VARIANT_STRINGVIEW=ON
        -DSeastar_CXX_DIALECT=c++17
        DEPENDS fmt boost protobuf yaml-cpp c-ares lz4 cryptopp
        )
