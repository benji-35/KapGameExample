##
## ██╗  ██╗ █████╗ ██████╗ ███████╗███╗   ██╗ ██████╗ ██╗███╗   ██╗███████╗
## ██║ ██╔╝██╔══██╗██╔══██╗██╔════╝████╗  ██║██╔════╝ ██║████╗  ██║██╔════╝
## █████╔╝ ███████║██████╔╝█████╗  ██╔██╗ ██║██║  ███╗██║██╔██╗ ██║█████╗
## ██╔═██╗ ██╔══██║██╔═══╝ ██╔══╝  ██║╚██╗██║██║   ██║██║██║╚██╗██║██╔══╝
## ██║  ██╗██║  ██║██║     ███████╗██║ ╚████║╚██████╔╝██║██║ ╚████║███████╗
## ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝╚═╝  ╚═══╝╚══════╝
##
## by Benjamin DELVERT

cmake_minimum_required(VERSION 3.16)

if(${CMAKE_CURRENT_SOURCE_DIR} STREQUAL ${CMAKE_CURRENT_BINARY_DIR} AND NOT WIN32)
	message(FATAL_ERROR
	"You can not use CMake to build from the root of it's source tree!\n"
	"Remove the CMakeCache.txt file from this directory, then create a separate directory\n"
	"(either below this directory or elsewhere), and then re-run CMake from there.")
endif(${CMAKE_CURRENT_SOURCE_DIR} STREQUAL ${CMAKE_CURRENT_BINARY_DIR} AND NOT WIN32)

# set exe name
set(EXE_NAME "GameExample" CACHE STRING "Game Name")

project(${EXE_NAME} LANGUAGES CXX)

set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/CMake" ${CMAKE_MODULE_PATH})

set(CMAKE_CXX_STANDARD 17)

# use valgrind programm
option(VALGRIND "Use -g on project compile" OFF)

option(GAME_THREAD "define if game uses KapEngine threaded" OFF)
option(GAME_BETA "define if game uses KapEngine beta" OFF)
option(GAME_DEBUG "define if KapEngine is in debug mode" OFF)


# RayLib version
set(raylib_VERSION 4.0.0)
find_package(raylib REQUIRED)
message(STATUS "RayLib version: ${raylib_VERSION}")


file(GLOB_RECURSE SOURCES Main.cpp Assets/Components/*.cpp Packages/*.cpp)

add_executable(${EXE_NAME} ${SOURCES} ${HEADERS})

# Library
include(Library/library.cmake)

target_link_libraries(${EXE_NAME} raylib)

# Includes
include_directories(.)
include_directories(Assets/Components)

# Packages
include(Packages/packages.cmake)

if (VALGRIND)
	SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread -g")
else ()
	SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread")
endif()
