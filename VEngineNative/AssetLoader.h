#pragma once
#include "Mesh3d.h"
#include "Light.h"
#include "Scene.h"
#include "Material.h"
#include "MaterialNode.h"
#include "Object3dInfo.h"
class AssetLoader
{
public:
    AssetLoader();
    ~AssetLoader();

    Material *loadMaterialString(string source);
    Material *loadMaterialFile(string source);

    Mesh3d *loadMeshString(string source);
    Mesh3d *loadMeshFile(string source);

    Light *loadLightString(string source);
    Light *loadLightFile(string source);

    Scene *loadSceneString(string source);
    Scene *loadSceneFile(string source);

private:
    void splitByLines(vector<string>& output, string src);
    void splitBySpaces(vector<string>& output, string src);
    int replaceEnum(string enumstr);
};

