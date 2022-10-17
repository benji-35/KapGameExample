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
    git rm -f --cached Library/KapEngine/
    rm -rf Library/KapEngine/
    rm -rf .git/modules/Library/KapEngine/
    git submodule add git@github.com:benji-35/KapEngine.git Library/KapEngine
    clear
}

function loadNinja() {
    setGameName
    rm -rf build/
    git submodule update --init --recursive
    mkdir build
    cd build
    cmake -G Ninja .. -DEXE_NAME=$GAME_NAME
    ninja
    cd ../
    clear
    ./build/$GAME_NAME
}

function loadMake() {
    setGameName
    rm -rf build/
    git submodule update --init --recursive
    mkdir build
    cd build
    cmake .. -DEXE_NAME=$GAME_NAME
    make
    cd ../
    clear
    ./build/$GAME_NAME
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
