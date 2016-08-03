#version 430 core

#include PostProcessEffectBase.glsl

#define CLOUD_SAMPLES 2
#define CLOUDCOVERAGE_DENSITY 90
#include Atmosphere.glsl

vec4 shade(){    
    if(shouldBreak()) return vec4(0);
    vec4 lastData = texture(cloudsCloudsTex, UV).rgba;
   vec4 val = CloudsGetCloudsCoverageShadow();
   /*
   //val.g = min(val.g, lastData.a);
    //return mix(lastData, vec4(mix(vec3(val.g), scatt, val.r), 1.0), 0.3);
    vec4 bufferedRes = val.rggg;
    bufferedRes.r = max(lastData.r, val.r);
    bufferedRes.g = mix(val.g, min(lastData.g, val.g), 0.99);
    //return vec4(0,1,0,0);
    bufferedRes = mix(val, bufferedRes, 0.99);
    bufferedRes = mix(lastData, bufferedRes, 0.6);
    return bufferedRes;*/
    vec4 data = val.b <= lastData.b ? val : lastData;
    vec3 pos = startpos + ssdir * data.b;
   // data.g = getAOPos(1.0, pos);
   // data.g = mix(data.g, lastData.g, 0.9);
    ///data = mix(val, data, 0.6);
    return data;
  //  return vec4(0,1,999999999,0);
}