/* 
Insanity Shader is based from BSL Shaders by Capt Tatsu.

Most of the code is made by Capt Tatsu. They gave me permission to use their code for Insanity.

Support the original author by donating to them.
*/ 

//Settings//
#include "/lib/settings.glsl"

//Fragment Shader///////////////////////////////////////////////////////////////////////////////////
#ifdef FSH

//Varyings//
varying vec2 texCoord;

//Uniforms//
uniform float far, near;
uniform float frameTimeCounter;
uniform float viewWidth, viewHeight, aspectRatio;

uniform mat4 gbufferProjection;

uniform sampler2D depthtex0;
uniform sampler2D noisetex;

//Common Functions//
float GetLinearDepth(float depth) {
   return (2.0 * near) / (far + near - depth * (far - near));
}

//Includes//
#include "/lib/util/dither.glsl"
#include "/lib/lighting/ambientOcclusion.glsl"

//Program//
void main() {
    float ao = AmbientOcclusion(Bayer64(gl_FragCoord.xy));
    
    /* DRAWBUFFERS:4 */
    gl_FragData[0] = vec4(ao, 0.0, 0.0, 0.0);
}

#endif

//Vertex Shader/////////////////////////////////////////////////////////////////////////////////////
#ifdef VSH

//Varyings//
varying vec2 texCoord;

//Program//
void main() {
	texCoord = gl_MultiTexCoord0.xy;
	
	gl_Position = ftransform();
}

#endif
