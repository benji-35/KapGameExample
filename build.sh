#!/bin/bash
# ██╗  ██╗ █████╗ ██████╗ ███████╗███╗   ██╗ ██████╗ ██╗███╗   ██╗███████╗
# ██║ ██╔╝██╔══██╗██╔══██╗██╔════╝████╗  ██║██╔════╝ ██║████╗  ██║██╔════╝
# █████╔╝ ███████║██████╔╝█████╗  ██╔██╗ ██║██║  ███╗██║██╔██╗ ██║█████╗  
# ██╔═██╗ ██╔══██║██╔═══╝ ██╔══╝  ██║╚██╗██║██║   ██║██║██║╚██╗██║██╔══╝  
# ██║  ██╗██║  ██║██║     ███████╗██║ ╚████║╚██████╔╝██║██║ ╚████║███████╗
# ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝╚═╝  ╚═══╝╚══════╝
#
# by Benjamin Delvert

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
    rm -rf build/
    git submodule update --init --recursive
    mkdir build
    cd build
    cmake -G Ninja ..
    ninja
    cd ../
    clear
    ./build/GameExample
}

function loadMake() {
    rm -rf build/
    git submodule update --init --recursive
    mkdir build
    cd build
    cmake ..
    make
    cd ../
    clear
    ./build/GameExample
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
