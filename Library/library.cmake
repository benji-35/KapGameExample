# KapEngine

option(KAPENGINE_THREAD "" ${GAME_THREAD})
option(KAPENGINE_BETA "" ${GAME_BETA})
option(KAPENGINE_DEBUG "" ${GAME_DEBUG})
option(KAPENGINE_EDITOR "" OFF)
add_subdirectory(Library/KapEngine)
target_link_libraries(${EXE_NAME} KapEngine)
include(Library/KapEngine/CMake/engine_include.cmake)

##   Ajout d'un nouveau module
# add_subdirectory(Library/dossierCible)
# target_link_libraries(NomDuProjet NomSubmodule)
# include_directories(Library/dossierCible)

