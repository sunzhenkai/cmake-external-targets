PROJECT(cmake-external-targets)
CMAKE_MINIMUM_REQUIRED(VERSION 3.24)
SET(CMAKE_CXX_STANDARD 17)
include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)

# https://github.com/scylladb/seastar
MakeDepReady(
        # non-official git repo, fix apps compile error
        VERSION ${VERSION}
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
)
