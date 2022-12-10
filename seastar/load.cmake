include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)
# https://github.com/scylladb/seastar

MakeDepReady(VERSION seastar-22.11.0
        AUTHOR scylladb
        EXTRA_ARGS -DCMAKE_BUILD_TYPE=RelWithDebInfo)
