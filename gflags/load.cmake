include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)
# https://github.com/gflags/gflags

MakeDepReady(VERSION v2.2.2)

#function(Process)
#    get_filename_component(DEP_NAME ${CMAKE_CURRENT_LIST_DIR} NAME)
#    SetBasicVariables(NAME ${DEP_NAME} VERSION v2.2.2)
#
#    ExternalProject_Add(
#            ${DEP_NAME}
#            PREFIX ${DEP_PREFIX}
#            URL ${GITHUB_DOWNLOAD_URL}
#            CMAKE_ARGS ${CMAKE_ARGS}
#            DEPENDS fmt_build
#    )
#
#    add_custom_target(${DEP_NAME}_build ${CMAKE_COMMAND} ${CMAKE_SOURCE_DIR} DEPENDS ${DEP_NAME})
#endfunction(Process)
#Process()
#unset(Process)