#include "ComponentTest.hpp"

// #include "KapRaylib/KapRaylib.hpp"
#include "KapRaylib/KapRaylibVersion.hpp"

MyGame::ComponentTest::ComponentTest(std::shared_ptr<KapEngine::GameObject> &go) : KapEngine::Component(go, "TestComp") {

}

MyGame::ComponentTest::~ComponentTest() {
}

void MyGame::ComponentTest::onStart() {
    KAP_DEBUG_LOG("ComponentTest::onStart");

    #if KAPRAYLIB_BETA
        KAP_DEBUG_LOG("Raylib is set to beta mode");
    #else
        KAP_DEBUG_LOG("Raylib is not set to beta mode");
    #endif
}
