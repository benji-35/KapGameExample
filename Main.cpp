/*

    ██╗  ██╗ █████╗ ██████╗ ███████╗███╗   ██╗ ██████╗ ██╗███╗   ██╗███████╗
    ██║ ██╔╝██╔══██╗██╔══██╗██╔════╝████╗  ██║██╔════╝ ██║████╗  ██║██╔════╝
    █████╔╝ ███████║██████╔╝█████╗  ██╔██╗ ██║██║  ███╗██║██╔██╗ ██║█████╗
    ██╔═██╗ ██╔══██║██╔═══╝ ██╔══╝  ██║╚██╗██║██║   ██║██║██║╚██╗██║██╔══╝
    ██║  ██╗██║  ██║██║     ███████╗██║ ╚████║╚██████╔╝██║██║ ╚████║███████╗
    ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝╚═╝  ╚═══╝╚══════╝

    Here is your main for your game

*/

#include "KapEngine.hpp"
#include "KapRaylib/KapRaylib.hpp"
#include "KapUI/KapUI.hpp"
#include "KapEngineUi.hpp"

#include "ComponentTest.hpp"

using namespace KapEngine;
using namespace KapEngine::Graphical::Raylib;

void setRaylib(KEngine &engine) {
    auto manager = engine.getGraphicalLibManager();
    auto raylib = std::make_shared<RaylibGraphical>(*manager, true);

    manager->addLib(raylib);
    manager->changeLib(raylib->getName());

    #if KAPRAYLIB_BETA
        KAP_DEBUG_LOG("Raylib is set to beta mode");
    #else
        KAP_DEBUG_LOG("Raylib is not set to beta mode");
    #endif

    #if KAPUI_BETA
        KAP_DEBUG_LOG("KapUI is set to beta mode");
        auto &scene = engine.getSceneManager()->getScene(1);
        auto canvas = KapEngine::UI::UiFactory::createCanvas(scene);
        auto toggle = scene.createGameObject("Toggle");
        KapEngine::UI::KapUiFactory::createToggle(toggle, false);

        auto &tr = toggle->getComponent<KapEngine::Transform>();
        tr.setPosition({40, 60, 0});
        tr.setScale({80, 80, 0.5});
        tr.setParent(canvas->getId());
    #else
        KAP_DEBUG_LOG("KapUI is not set to beta mode");
    #endif
}

int main(int ac, char **av) {
    #if IS_MIN_KAPENGINE_VERSION(1, 216)
        KEngine engine;
        engine.setScreenSize({720, 480});

        setRaylib(engine);

        try {
            auto &scene = engine.getSceneManager()->getScene(1);
            auto go = scene.createGameObject("Test");
            auto comp = std::make_shared<MyGame::ComponentTest>(go);
            go->addComponent(comp);
        } catch(...) {

        }

        engine.run();
    #else
        KEngine engine(false);
        engine.setScreenSize({720, 480});

        setRaylib(engine);

        try {
            auto &scene = engine.getSceneManager()->getScene(1);
            auto go = scene.createGameObject("Test");
            auto comp = std::make_shared<MyGame::ComponentTest>(go);
            go->addComponent(comp);
        } catch(...) {

        }

        engine.run();
    #endif
}
