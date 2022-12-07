set(DEPS_DIR "/tmp/cpp-external-lib" CACHE STRING "library install prefix")

include(FetchContent)
set(FETCHCONTENT_BASE_DIR "${DEPS_DIR}")
include(ExternalProject)