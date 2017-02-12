#version 330 core
layout(location = 0) in vec3 gVertexPosition;
layout(location = 3) in vec4 gVertexBoneWeight;
layout(location = 4) in ivec4 gVertexBoneIndex;

uniform mat4 gProjectionMatrix;
uniform mat4 gViewMatrix;
uniform mat4 gModelMatrix;
uniform bool gAnimated;
layout (std140) uniform gBonesUniform
{
    mat4 gBoneMatrix[227];
};

void main()
{
    mat4 rigMatrix = mat4(1.f);
    if(gAnimated == true)
    {
        rigMatrix = gBoneMatrix[gVertexBoneIndex.x]*gVertexBoneWeight.x;
        rigMatrix += gBoneMatrix[gVertexBoneIndex.y]*gVertexBoneWeight.y;
        rigMatrix += gBoneMatrix[gVertexBoneIndex.z]*gVertexBoneWeight.z;
        rigMatrix += gBoneMatrix[gVertexBoneIndex.w]*gVertexBoneWeight.w;
    }
    gl_Position = gProjectionMatrix*gViewMatrix*gModelMatrix*rigMatrix*vec4(gVertexPosition,1.0);
}