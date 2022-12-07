PROJECT(cmake-external-targets)
CMAKE_MINIMUM_REQUIRED(VERSION 3.16)
SET(CMAKE_CXX_STANDARD 17)

include(absl/install.cmake)
include(boost/install.cmake)
include(c-ares/install.cmake)
include(cryptopp/install.cmake)
include(fmt/install.cmake)