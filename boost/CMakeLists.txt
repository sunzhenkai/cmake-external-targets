PROJECT(cmake-external-targets)
CMAKE_MINIMUM_REQUIRED(VERSION 3.24)
SET(CMAKE_CXX_STANDARD 17)
include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)

# oss speedup url: https://wii-share.oss-cn-beijing.aliyuncs.com/cpp/external/boost-submodule-boost-1.80.0.tar.gz
# github git repository: https://github.com/boostorg/boost.git

MakeDepReady(
        VERSION ${VERSION}
        AUTHOR boostorg
        EXTRA_ARGS -DABSL_BUILD_TESTING=OFF -DABSL_USE_GOOGLETEST_HEAD=ON
        URL https://wii-share.oss-cn-beijing.aliyuncs.com/cpp/external/boost-submodule-boost-1.80.0.tar.gz
)