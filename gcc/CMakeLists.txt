PROJECT(cmake-external-targets)
CMAKE_MINIMUM_REQUIRED(VERSION 3.24)
SET(CMAKE_CXX_STANDARD 17)
include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../flex/load.cmake)

#if (BUILD_GCC)
MakeDepReady(
        VERSION ${VERSION}
        #            AUTHOR gcc-mirror
        URL https://mirrors.tuna.tsinghua.edu.cn/gnu/gcc/\${DEP_VERSION}/\${DEP_VERSION}.tar.gz
        BUILD_IN_SOURCE TRUE
        CONFIGURE_COMMAND ./contrib/download_prerequisites && ./configure --prefix=<INSTALL_DIR> --enable-languages=c,c++ -disable-multilib
        BUILD_COMMAND ${MAKE_EXECUTABLE} -j -C <SOURCE_DIR>
        INSTALL_COMMAND ${MAKE_EXECUTABLE} -j -C <SOURCE_DIR> install
)
#endif ()