git rm -f --cached Library/KapEngine/
rm -rf Library/KapEngine/
rm -rf .git/modules/Library/KapEngine/
git submodule add git@github.com:benji-35/KapEngine.git Library/KapEngine
clear
rm -rf build/ && git submodule update --init --recursive && mkdir build && cd build && cmake -G Ninja .. && ninja && clear && ./RType
