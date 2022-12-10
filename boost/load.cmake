include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)
# oss speedup url: https://wii-share.oss-cn-beijing.aliyuncs.com/cpp/external/boost-submodule-boost-1.80.0.tar.gz
# github git repository: https://github.com/boostorg/boost.git

MakeDepReady(
        VERSION boost-1.80.0
        AUTHOR boostorg
        EXTRA_ARGS -DABSL_BUILD_TESTING=OFF -DABSL_USE_GOOGLETEST_HEAD=ON
        URL https://wii-share.oss-cn-beijing.aliyuncs.com/cpp/external/boost-submodule-boost-1.80.0.tar.gz
)
