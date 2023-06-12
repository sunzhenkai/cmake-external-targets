include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../hwloc/load.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../numactl/load.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../fmt/load.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../boost/load.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../protobuf/load.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../yaml-cpp/load.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../cares/load.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../lz4/load.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../cryptopp/load.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../valgrind/load.cmake)
# https://github.com/scylladb/seastar

MakeDepReady(
        # non-official git repo, fix apps compile error
        VERSION v0.0.1
        AUTHOR sunzhenkai
        # seastar official git repo (github)
        #        VERSION seastar-22.11.0
        #        AUTHOR scylladb
        EXTRA_ARGS
        -DCMAKE_BUILD_TYPE=RelWithDebInfo
        -DBoost_USE_STATIC_LIBS=OFF
        -DBoost_NO_BOOST_CMAKE=ON
        -DBoost_NO_SYSTEM_PATHS=TRUE
        -DSeastar_INSTALL=ON
        -DSeastar_APPS=OFF
        -DSeastar_DEMOS=OFF
        -DSeastar_DOCS=OFF
        -DSeastar_TESTING=OFF
        -DSeastar_COMPRESS_DEBUG=OFF
        -DSeastar_CXX_FLAGS=-Wno-error
        -DSeastar_LD_FLAGS=-pthread
        -DSeastar_DEFERRED_ACTION_REQUIRE_NOEXCEPT=OFF
        -DCMAKE_CXX_STANDARD=20
        DEPENDS fmt_lib boost_lib protobuf_lib yaml-cpp_lib cares_lib lz4_lib cryptopp_lib hwloc_lib numactl_lib valgrind_lib
)
