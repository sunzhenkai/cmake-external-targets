include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../help2man/load.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../textinfo/load.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../bison/load.cmake)

MakeReadyNow(PATH ${CMAKE_CURRENT_LIST_DIR} VERSION v2.6.4)
