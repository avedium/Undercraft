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
uniform float viewWidth, viewHeight, aspectRatio;

uniform sampler2D colortex1;

//Optifine Constants//
#ifdef LIGHT_SHAFT
const bool colortex1MipmapEnabled = true;
#endif

//Common Functions//
float GetLuminance(vec3 color) {
	return dot(color, vec3(0.299, 0.587, 0.114));
}

//Includes//
#include "/lib/antialiasing/fxaa.glsl"

//Program//
void main() {
	vec3 color = texture2DLod(colortex1, texCoord, 0.0).rgb;

	#ifdef FXAA
	color = FXAA311(color);	
	#endif

    /*DRAWBUFFERS:1*/
	gl_FragData[0] = vec4(color, 1.0);
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