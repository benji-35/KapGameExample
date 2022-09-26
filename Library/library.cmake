# KapEngine
add_subdirectory(Library/KapEngine)
target_link_libraries(GameExample KapEngine)
include(Library/KapEngine/CMake/engine_include.cmake)

