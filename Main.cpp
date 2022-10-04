#include "KapEngine.hpp"
#include "GameObject.hpp"
#include "ComponentTest.hpp"
#include "Factory.hpp"
#include "Entity.hpp"

int main(int ac, char **av) {
    KapEngine::KapEngine engine(false);

    try {
        auto &scene = engine.getSceneManager()->getCurrentScene();

        auto obj = scene.createGameObject("Object");
    } catch(...) {}

    engine.run();
}
