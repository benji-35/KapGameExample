#!/bin/sh
#!/bin/bash
# ██╗  ██╗ █████╗ ██████╗ ███████╗███╗   ██╗ ██████╗ ██╗███╗   ██╗███████╗
# ██║ ██╔╝██╔══██╗██╔══██╗██╔════╝████╗  ██║██╔════╝ ██║████╗  ██║██╔════╝
# █████╔╝ ███████║██████╔╝█████╗  ██╔██╗ ██║██║  ███╗██║██╔██╗ ██║█████╗  
# ██╔═██╗ ██╔══██║██╔═══╝ ██╔══╝  ██║╚██╗██║██║   ██║██║██║╚██╗██║██╔══╝  
# ██║  ██╗██║  ██║██║     ███████╗██║ ╚████║╚██████╔╝██║██║ ╚████║███████╗
# ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝╚═╝  ╚═══╝╚══════╝
#
# by Benjamin Delvert

GAME_NAME="GameExample"

function title() {

    echo -e "\e[33m"
    echo -e "██╗  ██╗ █████╗ ██████╗ ███████╗███╗   ██╗ ██████╗ ██╗███╗   ██╗███████╗"
    echo -e "██║ ██╔╝██╔══██╗██╔══██╗██╔════╝████╗  ██║██╔════╝ ██║████╗  ██║██╔════╝"
    echo -e "█████╔╝ ███████║██████╔╝█████╗  ██╔██╗ ██║██║  ███╗██║██╔██╗ ██║█████╗  "
    echo -e "██╔═██╗ ██╔══██║██╔═══╝ ██╔══╝  ██║╚██╗██║██║   ██║██║██║╚██╗██║██╔══╝  "
    echo -e "██║  ██╗██║  ██║██║     ███████╗██║ ╚████║╚██████╔╝██║██║ ╚████║███████╗"
    echo -e "╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝╚═╝  ╚═══╝╚══════╝"
    echo -e ""
    echo -e "by Benjamin Delvert"
    echo -e "\e[0m"
    echo -e ""
    echo -e ""

}

function update() {
    git submodule update --init --recursive
    git pull --recurse-submodules
    git submodule update --remote
    clear
}

function loadNinja() {
    git submodule update --init --recursive
    setGameName
    cmake -B build -G Ninja -DEXE_NAME=$GAME_NAME
    cmake --build build/
}

function loadMake() {
    git submodule update --init --recursive
    setGameName
    cmake -B build -DEXE_NAME=$GAME_NAME
    cmake --build build/
}

function setGameName() {
    read -p "Enter the name of your game : " GAME_NAME
    echo -e "Game name set to $GAME_NAME"
    echo -e ""
}

function main() {
    clear
    title
    read -p "[KAP ENGINE] Do you want to upgrade KapEngine ? (Y/N) " confirm
    if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]
    then
        update
    fi
    clear
    title
    read -p "[KAP ENGINE] Do you want to load your game with ninja ? (Y/N) " confirm
    if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]
    then
        loadNinja
        return
    fi
    clear
    title
    read -p "[KAP ENGINE] Do you want to load your game with make ? (Y/N) " confirm
    if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]
    then
        loadMake
        return
    fi
}

main
