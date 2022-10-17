#include "ComponentTest.hpp"

MyGame::ComponentTest::ComponentTest(std::shared_ptr<KapEngine::GameObject> &go) : KapEngine::Component(go, "TestComp") {

}

MyGame::ComponentTest::~ComponentTest() {
}

void MyGame::ComponentTest::onStart() {
    KapEngine::Debug::log("starting...");
}
