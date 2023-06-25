# 外置定义
# DEPS_INSTALL_DIR, DEPS_BUILD_PREFIX, BUILD_DEPS, BUILD_GCC
# CMAKE_C_COMPILER, CMAKE_CXX_COMPILER, CFLAGS, CXXFLAGS
set(EXTERN_VARIABLES
        DEPS_INSTALL_DIR DEPS_BUILD_PREFIX BUILD_DEPS BUILD_GCC VERSION
        CMAKE_C_COMPILER CMAKE_CXX_COMPILER CFLAGS CXXFLAGS CPATH)
find_program(MAKE_EXECUTABLE NAMES make gmake mingw32-make REQUIRED)
find_package(PkgConfig REQUIRED)
macro(InitVariables)
    set(DEPS_INSTALL_DIR "/tmp/cpp-external-lib" CACHE STRING "library install prefix")
    set(DEPS_BUILD_PREFIX "/tmp/cpp-external-prefix" CACHE STRING "library install prefix")
    option(BUILD_DEPS "build and install deps" ON)
    option(BUILD_GCC "build gcc" OFF)

    include(FetchContent)
    set(FETCHCONTENT_BASE_DIR "${DEPS_BUILD_PREFIX}")
    include(ExternalProject)

    set(ENV{CC} ${CMAKE_C_COMPILER})
    set(ENV{CXX} ${CMAKE_CXX_COMPILER})
    set(ENV{CPATH} "$ENV{CPATH}")
    set(ENV{CFLAGS} "$ENV{CFLAGS} -I${DEP_INSTALL_DIR}/include")
    #    set(ENV{CFLAGS} "-fPIC $ENV{CFLAGS}")
    set(ENV{CXXFLAGS} "$ENV{CXXFLAGS} -I${DEP_INSTALL_DIR}/include")
    #    set(ENV{CXXFLAGS} "-fPIC $ENV{CXXFLAGS}")
    message(STATUS "[InitVariables] Configure info. [DEP_NAME=${DEP_NAME}, DEPS_INSTALL_DIR=${DEPS_INSTALL_DIR}"
            ", DEPS_BUILD_PREFIX=${DEPS_BUILD_PREFIX}"
            ", BUILD_DEPS=${BUILD_DEPS}"
            ", BUILD_GCC=${BUILD_GCC}"
            ", CMAKE_C_COMPILER=${CMAKE_C_COMPILER}"
            ", CMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}"
            ", CFLAGS=${CFLAGS}"
            ", CPATH=${CPATH}"
            ", CXXFLAGS=${CXXFLAGS}"
            "]")
endmacro(InitVariables)

function(GetCMakeArgs)
    #string(REPLACE ";" "|" CMAKE_PREFIX_PATH_STR "${CMAKE_PREFIX_PATH}")
    #string(REPLACE ";" "\\;" CMAKE_PREFIX_PATH_STR "${CMAKE_PREFIX_PATH}")
    set(CMAKE_ARGS
            #-DCMAKE_PREFIX_PATH=$<CMAKE_PREFIX_PATH>
            -DCMAKE_CXX_STANDARD=${CMAKE_CXX_STANDARD}
            -DCMAKE_BUILD_TYPE=Release
            -DCMAKE_INSTALL_PREFIX=${DEPS_INSTALL_DIR}/${DEP_NAME}
            -DCMAKE_INSTALL_LIBDIR=lib
            -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}
            -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
            -DBUILD_STATIC_LIB=ON
            -DBUILD_SHARED_LIB=OFF PARENT_SCOPE)
endfunction(GetCMakeArgs)


macro(SetBasicVariables)
    cmake_parse_arguments(ARG "" "NAME;VERSION;AUTHOR;PROJECT" "" ${ARGN})
    if ("${DEPS_INSTALL_DIR}" STREQUAL "")
        message(FATAL_ERROR "Variable DEPS_INSTALL_DIR not configured.")
    endif ()

    set(DEP_VERSION ${ARG_VERSION})
    set(DEP_NAME ${ARG_NAME})
    string(TOUPPER ${DEP_NAME} DEP_UNAME)
    set(DEP_AUTHOR ${ARG_AUTHOR})
    set(DEP_PROJECT ${ARG_PROJECT})
    set(DEP_PREFIX ${DEPS_BUILD_PREFIX}/${DEP_NAME})
    if ("X${${DEP_UNAME}_INSTALL_DIR}" STREQUAL "X")
        set(DEP_INSTALL_DIR ${DEPS_INSTALL_DIR}/${ARG_NAME})
    else ()
        set(DEP_INSTALL_DIR ${${DEP_UNAME}_INSTALL_DIR})
    endif ()

    if ("X${MAKE_EXECUTABLE}" STREQUAL "X")
        set(MAKE_EXECUTABLE make)
    endif ()

    if ("${DEP_PROJECT}" STREQUAL "")
        set(DEP_PROJECT ${ARG_NAME})
    endif ()
    if ("${DEP_AUTHOR}" STREQUAL "")
        set(DEP_AUTHOR ${ARG_NAME})
    endif ()
    #    set(GITHUB_DOWNLOAD_URL https://github.com/${DEP_AUTHOR}/${DEP_PROJECT}/releases/download/${DEP_VERSION}/${DEP_FILE}.tar.gz)
    set(GITHUB_DOWNLOAD_URL https://codeload.github.com/${DEP_AUTHOR}/${DEP_PROJECT}/tar.gz/refs/tags/${DEP_VERSION})
    set(DEP_GIT_REPOSITORY https://github.com/${DEP_AUTHOR}/${DEP_PROJECT}.git)
    set(DEP_GIT_TAG ${DEP_VERSION})
    GetCMakeArgs()
endmacro(SetBasicVariables)

function(CheckVersion)
    if ("X${DEP_INSTALL_DIR}" STREQUAL "X")
        message(FATAL_ERROR "DEP_INSTALL_DIR not set")
    endif ()
    if (NOT EXISTS ${DEP_INSTALL_DIR}/VERSION)
        set(REBUILD_NEEDED TRUE)
    else ()
        file(STRINGS ${DEP_INSTALL_DIR}/VERSION BUILD_VERSION)
        if ("${BUILD_VERSION}" STREQUAL "${DEP_VERSION}")
            set(REBUILD_NEEDED FALSE)
        else ()
            set(REBUILD_NEEDED TRUE)
        endif ()
    endif ()
    set(REBUILD_NEEDED ${REBUILD_NEEDED} PARENT_SCOPE)
endfunction(CheckVersion)

macro(SetEnvVariables _DEP_INSTALL_DIR)
    if (EXISTS "${_DEP_INSTALL_DIR}/lib")
        set(ENV{LDFLAGS} "$ENV{LDFLAGS} -L${_DEP_INSTALL_DIR}/lib")
        set(ENV{LIBRARY_PATH} "${_DEP_INSTALL_DIR}/lib:$ENV{LIBRARY_PATH}")
    endif ()
    if (EXISTS "${_DEP_INSTALL_DIR}/lib64")
        set(ENV{LDFLAGS} "$ENV{LDFLAGS} -L${_DEP_INSTALL_DIR}/lib64")
        set(ENV{LIBRARY_PATH} "${_DEP_INSTALL_DIR}/lib64:$ENV{LIBRARY_PATH}")
    endif ()
    set(ENV{CPATH} "$ENV{CPATH}:${_DEP_INSTALL_DIR}/include")
    set(ENV{CFLAGS} "$ENV{CFLAGS}")
    set(ENV{CPPFLAGS} "$ENV{CPPFLAGS}")
    # 设置 bin 到 PATH
    if (EXISTS "${_DEP_INSTALL_DIR}/bin")
        set(ENV{PATH} "${_DEP_INSTALL_DIR}/bin:$ENV{PATH}")
    endif ()
    message(STATUS "[SetEnvVariables] [DEP_INSTALL_DIR=${_DEP_INSTALL_DIR}]")
endmacro(SetEnvVariables)

macro(SetLoadVariables)
    set(${ARG_NAME}_IMPORT TRUE PARENT_SCOPE)
    set(ENV{${DEP_UNAME}_ROOT_DIR} ${DEP_INSTALL_DIR})
    set(${DEP_NAME}_DIR ${DEP_INSTALL_DIR} PARENT_SCOPE)
    set(${DEP_UNAME}_DIR ${DEP_INSTALL_DIR} PARENT_SCOPE)
    set(${DEP_UNAME}_ROOT_DIR ${DEP_INSTALL_DIR} PARENT_SCOPE)
    set(${DEP_UNAME}_INSTALL_DIR ${DEP_INSTALL_DIR} PARENT_SCOPE)
    set(${DEP_UNAME}_INCLUDE_DIR ${DEP_INSTALL_DIR}/include PARENT_SCOPE)
    set(CMAKE_PREFIX_PATH ${DEP_INSTALL_DIR} ${CMAKE_PREFIX_PATH} PARENT_SCOPE)
endmacro(SetLoadVariables)

# CMakeLists.txt
function(MakeDepReady)
    set(FLAG_OPT "FROM_GIT;DISABLE_CONFIGURE;ADD_BIN_PATH")
    set(ONE_VALUE_OPT "VERSION;AUTHOR;PROJECT;URL;BUILD_IN_SOURCE")
    set(MUL_VALUE_OPT "DEPENDS;EXTRA_ARGS;BUILD_COMMAND;INSTALL_COMMAND;CONFIGURE_COMMAND")
    cmake_parse_arguments(ARG "${FLAG_OPT}" "${ONE_VALUE_OPT}" "${MUL_VALUE_OPT}" ${ARGN})
    InitVariables()
    get_filename_component(DEP_NAME ${CMAKE_CURRENT_LIST_DIR} NAME)
    if (DEFINED ${DEP_NAME}_IMPORT)
        return()
    endif ()
    SetBasicVariables(NAME ${DEP_NAME} VERSION ${ARG_VERSION} AUTHOR ${ARG_AUTHOR} PROJECT ${ARG_PROJECT})
    CheckVersion()

    if (ARG_FROM_GIT)
        unset(ARG_URL)
    else ()
        unset(DEP_GIT_REPOSITORY)
        unset(DEP_GIT_TAG)
        if ("${ARG_URL}" STREQUAL "")
            set(ARG_URL "${GITHUB_DOWNLOAD_URL}")
        endif ()
        # 替换 URL 中的变量
        cmake_language(EVAL CODE "set(ARG_URL ${ARG_URL})")
    endif ()

    #    if (NOT "${ARG_CONFIGURE_COMMAND}" STREQUAL "")
    #        cmake_language(EVAL CODE "set(ARG_CONFIGURE_COMMAND ${ARG_CONFIGURE_COMMAND})")
    #    endif ()
    if (ARG_DISABLE_CONFIGURE)
        set(ARG_CONFIGURE_COMMAND "\"\"")
    endif ()
    if (REBUILD_NEEDED)
        message(STATUS "[MakeDepReady] download dependency. [DEP_NAME=${DEP_NAME}, URL=${ARG_URL}]")
        string(REPLACE ";" "|" CMAKE_PREFIX_PATH_STR "${CMAKE_PREFIX_PATH}")
        #        CONFIGURE_COMMAND env CFLAGS=\$ENV{CFLAGS} CPPFLAGS=\$ENV{CPPFLAGS} LDFLAGS=\$ENV{LDFLAGS} LIBRARY_PATH=\$ENV{LIBRARY_PATH} \${ARG_CONFIGURE_COMMAND}
        #        set(ENV{LIBRARY_PATH} \$ENV{LIBRARY_PATH})
        #        set(ENV{LD_LIBRARY_PATH} \$ENV{LIBRARY_PATH})
        #        set(ENV{CFLAGS} \$ENV{CFLAGS})
        #        set(ENV{CPATH} \$ENV{CPATH})
        #        set(ENV{CPPFLAGS} \$ENV{CPPFLAGS})
        #        set(ENV{LDFLAGS} \$ENV{LDFLAGS})

        # 透传 空字符串的 COMMAND 有问题, 套一层 EVAL 来解决
        cmake_language(EVAL CODE "
            ExternalProject_Add(\${DEP_NAME}_build
                PREFIX \${DEP_PREFIX}
                INSTALL_DIR \${DEP_INSTALL_DIR}
                GIT_REPOSITORY \${DEP_GIT_REPOSITORY}
                GIT_TAG \${DEP_GIT_TAG}
                GIT_SUBMODULES_RECURSE TRUE
                GIT_SHALLOW TRUE
                URL \${ARG_URL}
                LIST_SEPARATOR |
                CMAKE_ARGS \${CMAKE_ARGS} \${ARG_EXTRA_ARGS} -DCMAKE_PREFIX_PATH=\${CMAKE_PREFIX_PATH_STR}
                DEPENDS \${ARG_DEPENDS}
                DOWNLOAD_EXTRACT_TIMESTAMP TRUE
                BUILD_IN_SOURCE \${ARG_BUILD_IN_SOURCE}
                CONFIGURE_COMMAND ${ARG_CONFIGURE_COMMAND}
                BUILD_COMMAND \${ARG_BUILD_COMMAND}
                INSTALL_COMMAND \${ARG_INSTALL_COMMAND}
            )
        ")
    else ()
        if (NOT EXISTS ${DEP_INSTALL_DIR})
            message(FATAL_ERROR "${DEP_NAME} install failed.")
        endif ()
        add_custom_target(${DEP_NAME}_build echo "${DEP_NAME} exists with version ${DEP_VERSION}.")
    endif ()
    add_custom_target(${DEP_NAME}_lib ALL COMMAND echo ${DEP_VERSION} > ${DEP_INSTALL_DIR}/VERSION DEPENDS ${DEP_NAME}_build)
    if (ARG_ADD_BIN_PATH)
        set(ENV{PATH} "${DEP_INSTALL_DIR}/bin:$ENV{PATH}")
    endif ()
endfunction(MakeDepReady)

macro(UnsetVariables)
    unset(DEP_VERSION)
    unset(DEP_NAME)
    unset(DEP_AUTHOR)
    unset(DEP_PROJECT)
    unset(DEP_INSTALL_DIR)
    unset(DEP_PREFIX)
    unset(GITHUB_DOWNLOAD_URL)
    unset(DEP_UNAME)
    unset(CMAKE_ARGS)
endmacro(UnsetVariables)

macro(NotEmpty DATA)
    if ("${${DATA}}" STREQUAL "")
        message(FATAL_ERROR "[MakeReadyNow] ${DATA} should not be empty.")
    endif ()
endmacro(NotEmpty)

# load functions
function(MakeReadyNow)
    # 处理参数
    set(ONE_VALUE_OPT "PATH;VERSION")
    cmake_parse_arguments(ARG "" "${ONE_VALUE_OPT}" "" ${ARGN})
    NotEmpty(ARG_PATH)
    NotEmpty(ARG_VERSION)
    # 初始化变量
    set(VERSION ${ARG_VERSION})
    set(CMAKE_DEFS)
    get_filename_component(DEP_NAME ${ARG_PATH} NAME)
    string(TOUPPER ${DEP_NAME} DEP_UNAME)
    InitVariables()
    SetBasicVariables(NAME ${DEP_NAME} VERSION ${ARG_VERSION})
    CheckVersion()
    if (NOT REBUILD_NEEDED)
        message(STATUS "[MakeReadyNow] target already exists, skip build. [target=${DEP_NAME}, version=${VERSION}]")
    else ()
        foreach (I IN LISTS EXTERN_VARIABLES)
            set(CMAKE_DEFS ${CMAKE_DEFS} -D${I}=${${I}})
        endforeach ()
        set(BUILD_DIR ${DEPS_BUILD_PREFIX}/${DEP_NAME}/build)
        file(MAKE_DIRECTORY ${BUILD_DIR})
        # configure
        string(REPLACE ";" "\;" CMAKE_PREFIX_PATH_STR "${CMAKE_PREFIX_PATH}")
        execute_process(
                COMMAND ${CMAKE_COMMAND} ${CMAKE_DEFS} -DCMAKE_PREFIX_PATH=${CMAKE_PREFIX_PATH_STR} ${ARG_PATH}
                WORKING_DIRECTORY ${BUILD_DIR}
                RESULT_VARIABLE STATUS
        )
        if (NOT "${STATUS}" EQUAL "0")
            message(FATAL_ERROR "[MakeReadyNow::Configure] configure failed. [DEP_NAME=${DEP_NAME}]")
        endif ()
        # build
        execute_process(
                COMMAND ${CMAKE_COMMAND} --build ${BUILD_DIR} -- -j
                RESULT_VARIABLE STATUS
        )
        if (NOT "${STATUS}" EQUAL "0")
            message(FATAL_ERROR "[MakeReadyNow::Build] build failed. [DEP_NAME=${DEP_NAME}]")
        endif ()
        #    file(REMOVE_RECURSE ${BUILD_DIR})
    endif ()
    SetLoadVariables()
    SetEnvVariables(${DEP_INSTALL_DIR})
    # TODO 遍历 pc 文件
    if (EXISTS "${DEP_INSTALL_DIR}/lib/pkgconfig/${DEP_NAME}.pc")
        set(ENV{PKG_CONFIG_PATH} "${DEP_INSTALL_DIR}/lib/pkgconfig:$ENV{PKG_CONFIG_PATH}")
        pkg_search_module(PKG_${DEP_UNAME} REQUIRED IMPORTED_TARGET GLOBAL QUIET ${DEP_NAME})
        message(STATUS "[MakeReadyNow::AddTarget] PkgConfig::PKG_${DEP_UNAME} ")
    endif ()
endfunction(MakeReadyNow)