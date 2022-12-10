include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)
# https://github.com/Tencent/rapidjson

MakeDepReady(VERSION v1.1.0
        AUTHOR Tencent
        EXTRA_ARGS -DRAPIDJSON_BUILD_TESTS=OFF -DRAPIDJSON_BUILD_DOC=OFF -DRAPIDJSON_BUILD_EXAMPLES=OFF)
