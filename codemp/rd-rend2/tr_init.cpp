/*
===========================================================================
Copyright (C) 1999-2005 Id Software, Inc.

This file is part of Quake III Arena source code.

Quake III Arena source code is free software; you can redistribute it
and/or modify it under the terms of the GNU General Public License as
published by the Free Software Foundation; either version 2 of the License,
or (at your option) any later version.

Quake III Arena source code is distributed in the hope that it will be
useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Quake III Arena source code; if not, write to the Free Software
Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
===========================================================================
*/
// tr_init.c -- functions that are not called every frame

#include "../rd-rend2/tr_local.h"
#include "ghoul2/g2_local.h"
#include "tr_cache.h"
#include "tr_allocator.h"
#include "tr_weather.h"
#include <algorithm>
#include "../cgame/cg_tempwrappers.h"
#include "client/snd_local.h"

static size_t FRAME_UNIFORM_BUFFER_SIZE = 8*1024*1024;
static size_t FRAME_VERTEX_BUFFER_SIZE = 12*1024*1024;
static size_t FRAME_INDEX_BUFFER_SIZE = 4*1024*1024;

#if defined(_WIN32)
extern "C" {
	__declspec(dllexport) DWORD NvOptimusEnablement = 0x00000001;
	__declspec(dllexport) int AmdPowerXpressRequestHighPerformance = 1;
}
#endif

glconfig_t  glConfig;
glconfigExt_t glConfigExt;
glRefConfig_t glRefConfig;
glstate_t	glState;
window_t	window;

cvar_t	*r_flareSize;
cvar_t	*r_flareFade;
cvar_t	*r_flareCoeff;

cvar_t	*r_verbose;
cvar_t	*r_ignore;

cvar_t	*r_detailTextures;

cvar_t	*r_znear;
cvar_t	*r_zproj;
cvar_t	*r_stereoSeparation;

cvar_t	*r_skipBackEnd;

cvar_t	*r_stereo;
cvar_t	*r_anaglyphMode;

cvar_t	*r_greyscale;

cvar_t	*r_measureOverdraw;

cvar_t	*r_inGameVideo;
cvar_t	*r_fastsky;
cvar_t	*r_drawSun;
cvar_t	*r_dynamiclight;

cvar_t	*r_lodbias;
cvar_t	*r_lodscale;
cvar_t	*r_autolodscalevalue;

cvar_t	*r_norefresh;
cvar_t	*r_drawentities;
cvar_t	*r_drawworld;
cvar_t	*r_speeds;
cvar_t	*r_fullbright;
cvar_t	*r_novis;
cvar_t	*r_nocull;
cvar_t	*r_facePlaneCull;
cvar_t	*r_showcluster;
cvar_t	*r_nocurves;

cvar_t	*r_allowExtensions;

cvar_t	*r_ext_compressed_textures;
cvar_t	*r_ext_multitexture;
cvar_t	*r_ext_compiled_vertex_array;
cvar_t	*r_ext_texture_env_add;
cvar_t	*r_ext_texture_filter_anisotropic;
cvar_t	*r_ext_preferred_tc_method;

cvar_t  *r_ext_draw_range_elements;
cvar_t  *r_ext_multi_draw_arrays;
cvar_t  *r_ext_texture_float;
cvar_t  *r_arb_half_float_pixel;
cvar_t  *r_ext_framebuffer_multisample;
cvar_t  *r_arb_seamless_cube_map;
cvar_t  *r_arb_vertex_type_2_10_10_10_rev;
cvar_t	*r_arb_buffer_storage;

cvar_t  *r_cameraExposure;

cvar_t  *r_externalGLSL;

cvar_t  *r_hdr;
cvar_t  *r_floatLightmap;

cvar_t  *r_toneMap;
cvar_t  *r_forceToneMap;
cvar_t  *r_forceToneMapMin;
cvar_t  *r_forceToneMapAvg;
cvar_t  *r_forceToneMapMax;

cvar_t  *r_autoExposure;
cvar_t  *r_forceAutoExposure;
cvar_t  *r_forceAutoExposureMin;
cvar_t  *r_forceAutoExposureMax;

cvar_t  *r_srgb;

cvar_t  *r_depthPrepass;
cvar_t  *r_ssao;

cvar_t  *r_normalMapping;
cvar_t  *r_specularMapping;
cvar_t  *r_deluxeMapping;
cvar_t  *r_parallaxMapping;
cvar_t  *r_cubeMapping;
cvar_t  *r_baseNormalX;
cvar_t  *r_baseNormalY;
cvar_t  *r_baseParallax;
cvar_t  *r_baseSpecular;
cvar_t  *r_mergeLightmaps;
cvar_t  *r_dlightMode;
cvar_t  *r_pshadowDist;
cvar_t  *r_imageUpsample;
cvar_t  *r_imageUpsampleMaxSize;
cvar_t  *r_imageUpsampleType;
cvar_t  *r_genNormalMaps;
cvar_t  *r_forceSun;
cvar_t  *r_forceSunMapLightScale;
cvar_t  *r_forceSunLightScale;
cvar_t  *r_forceSunAmbientScale;
cvar_t  *r_sunlightMode;
cvar_t  *r_drawSunRays;
cvar_t  *r_sunShadows;
cvar_t  *r_shadowFilter;
cvar_t  *r_shadowMapSize;
cvar_t  *r_shadowCascadeZNear;
cvar_t  *r_shadowCascadeZFar;
cvar_t  *r_shadowCascadeZBias;
cvar_t	*r_ignoreDstAlpha;

cvar_t	*r_ignoreGLErrors;
cvar_t	*r_logFile;

cvar_t	*r_texturebits;

cvar_t	*r_drawBuffer;
cvar_t	*r_lightmap;
cvar_t	*r_vertexLight;
cvar_t	*r_uiFullScreen;
cvar_t	*r_shadows;
cvar_t	*r_flares;
cvar_t	*r_nobind;
cvar_t	*r_singleShader;
cvar_t	*r_roundImagesDown;
cvar_t	*r_colorMipLevels;
cvar_t	*r_picmip;
cvar_t	*r_showtris;
cvar_t	*r_showsky;
cvar_t	*r_shownormals;
cvar_t	*r_finish;
cvar_t	*r_clear;
cvar_t	*r_markcount;
cvar_t	*r_textureMode;
cvar_t	*r_offsetFactor;
cvar_t	*r_offsetUnits;
cvar_t	*r_gamma;
cvar_t	*r_intensity;
cvar_t	*r_lockpvs;
cvar_t	*r_noportals;
cvar_t	*r_portalOnly;

cvar_t	*r_subdivisions;
cvar_t	*r_lodCurveError;



cvar_t	*r_overBrightBits;
cvar_t	*r_mapOverBrightBits;

cvar_t	*r_debugSurface;
cvar_t	*r_simpleMipMaps;

cvar_t	*r_showImages;

cvar_t	*r_ambientScale;
cvar_t	*r_directedScale;
cvar_t	*r_debugLight;
cvar_t	*r_debugSort;
cvar_t	*r_printShaders;
cvar_t	*r_saveFontData;

#ifdef _DEBUG
cvar_t	*r_noPrecacheGLA;
#endif

cvar_t	*r_noServerGhoul2;
cvar_t	*r_Ghoul2AnimSmooth=0;
cvar_t	*r_Ghoul2UnSqashAfterSmooth=0;
//cvar_t	*r_Ghoul2UnSqash;
//cvar_t	*r_Ghoul2TimeBase=0; from single player
//cvar_t	*r_Ghoul2NoLerp;
//cvar_t	*r_Ghoul2NoBlend;
//cvar_t	*r_Ghoul2BlendMultiplier=0;

cvar_t	*broadsword=0;
cvar_t	*broadsword_kickbones=0;
cvar_t	*broadsword_kickorigin=0;
cvar_t	*broadsword_playflop=0;
cvar_t	*broadsword_dontstopanim=0;
cvar_t	*broadsword_waitforshot=0;
cvar_t	*broadsword_smallbbox=0;
cvar_t	*broadsword_extra1=0;
cvar_t	*broadsword_extra2=0;

cvar_t	*broadsword_effcorr=0;
cvar_t	*broadsword_ragtobase=0;
cvar_t	*broadsword_dircap=0;

cvar_t	*r_marksOnTriangleMeshes;

cvar_t	*r_aviMotionJpegQuality;
cvar_t	*r_screenshotJpegQuality;
cvar_t	*r_surfaceSprites;

// the limits apply to the sum of all scenes in a frame --
// the main view, all the 3D icons, etc
#define	DEFAULT_MAX_POLYS		600
#define	DEFAULT_MAX_POLYVERTS	3000
cvar_t	*r_maxpolys;
cvar_t	*r_maxpolyverts;
int		max_polys;
int		max_polyverts;

cvar_t	*r_dynamicGlow;
cvar_t	*r_dynamicGlowPasses;
cvar_t	*r_dynamicGlowDelta;
cvar_t	*r_dynamicGlowIntensity;
cvar_t	*r_dynamicGlowSoft;
cvar_t	*r_dynamicGlowWidth;
cvar_t	*r_dynamicGlowHeight;

cvar_t *r_debugContext;

cvar_t	*r_aspectCorrectFonts;

extern void	RB_SetGL2D (void);
static void R_Splash()
{
	const GLfloat black[] = { 0.0f, 0.0f, 0.0f, 1.0f };

	qglViewport( 0, 0, glConfig.vidWidth, glConfig.vidHeight );
	qglClearBufferfv(GL_COLOR, 0, black);

	GLSL_InitSplashScreenShader();

	GL_Cull(CT_TWO_SIDED);

	image_t *pImage = R_FindImageFile( "menu/splash", IMGTYPE_COLORALPHA, IMGFLAG_NONE);
	if (pImage )
		GL_Bind( pImage );

	GL_State(GLS_DEPTHTEST_DISABLE);
	GLSL_BindProgram(&tr.splashScreenShader);
	qglDrawArrays(GL_TRIANGLES, 0, 3);

	WIN_Present(&window);
}

/*
** GLW_CheckForExtension

  Cannot use strstr directly to differentiate between (for eg) reg_combiners and reg_combiners2
*/
bool GL_CheckForExtension(const char *ext)
{
	const char *ptr = Q_stristr( glConfigExt.originalExtensionString, ext );
	if (ptr == NULL)
		return false;
	ptr += strlen(ext);
	return ((*ptr == ' ') || (*ptr == '\0'));  // verify it's complete string.
}


void GLW_InitTextureCompression( void )
{
	bool newer_tc, old_tc;

	// Check for available tc methods.
	newer_tc = GL_CheckForExtension("ARB_texture_compression") && GL_CheckForExtension("EXT_texture_compression_s3tc");
	old_tc = GL_CheckForExtension("GL_S3_s3tc");

	if ( old_tc )
	{
		Com_Printf ("...GL_S3_s3tc available\n" );
	}

	if ( newer_tc )
	{
		Com_Printf ("...GL_EXT_texture_compression_s3tc available\n" );
	}

	if ( !r_ext_compressed_textures->value )
	{
		// Compressed textures are off
		glConfig.textureCompression = TC_NONE;
		Com_Printf ("...ignoring texture compression\n" );
	}
	else if ( !old_tc && !newer_tc )
	{
		// Requesting texture compression, but no method found
		glConfig.textureCompression = TC_NONE;
		Com_Printf ("...no supported texture compression method found\n" );
		Com_Printf (".....ignoring texture compression\n" );
	}
	else
	{
		// some form of supported texture compression is avaiable, so see if the user has a preference
		if ( r_ext_preferred_tc_method->integer == TC_NONE )
		{
			// No preference, so pick the best
			if ( newer_tc )
			{
				Com_Printf ("...no tc preference specified\n" );
				Com_Printf (".....using GL_EXT_texture_compression_s3tc\n" );
				glConfig.textureCompression = TC_S3TC_DXT;
			}
			else
			{
				Com_Printf ("...no tc preference specified\n" );
				Com_Printf (".....using GL_S3_s3tc\n" );
				glConfig.textureCompression = TC_S3TC;
			}
		}
		else
		{
			// User has specified a preference, now see if this request can be honored
			if ( old_tc && newer_tc )
			{
				// both are avaiable, so we can use the desired tc method
				if ( r_ext_preferred_tc_method->integer == TC_S3TC )
				{
					Com_Printf ("...using preferred tc method, GL_S3_s3tc\n" );
					glConfig.textureCompression = TC_S3TC;
				}
				else
				{
					Com_Printf ("...using preferred tc method, GL_EXT_texture_compression_s3tc\n" );
					glConfig.textureCompression = TC_S3TC_DXT;
				}
			}
			else
			{
				// Both methods are not available, so this gets trickier
				if ( r_ext_preferred_tc_method->integer == TC_S3TC )
				{
					// Preferring to user older compression
					if ( old_tc )
					{
						Com_Printf ("...using GL_S3_s3tc\n" );
						glConfig.textureCompression = TC_S3TC;
					}
					else
					{
						// Drat, preference can't be honored
						Com_Printf ("...preferred tc method, GL_S3_s3tc not available\n" );
						Com_Printf (".....falling back to GL_EXT_texture_compression_s3tc\n" );
						glConfig.textureCompression = TC_S3TC_DXT;
					}
				}
				else
				{
					// Preferring to user newer compression
					if ( newer_tc )
					{
						Com_Printf ("...using GL_EXT_texture_compression_s3tc\n" );
						glConfig.textureCompression = TC_S3TC_DXT;
					}
					else
					{
						// Drat, preference can't be honored
						Com_Printf ("...preferred tc method, GL_EXT_texture_compression_s3tc not available\n" );
						Com_Printf (".....falling back to GL_S3_s3tc\n" );
						glConfig.textureCompression = TC_S3TC;
					}
				}
			}
		}
	}
}

// Truncates the GL extensions string by only allowing up to 'maxExtensions' extensions in the string.
static const char *TruncateGLExtensionsString (const char *extensionsString, int maxExtensions)
{
	const char *p = extensionsString;
	const char *q;
	int numExtensions = 0;
	size_t extensionsLen = strlen (extensionsString);

	char *truncatedExtensions;

	while ( (q = strchr (p, ' ')) != NULL && numExtensions <= maxExtensions )
	{
		p = q + 1;
		numExtensions++;
	}

	if ( q != NULL )
	{
		// We still have more extensions. We'll call this the end

		extensionsLen = p - extensionsString - 1;
	}

	truncatedExtensions = (char *)Z_Malloc(extensionsLen + 1, TAG_GENERAL);
	Q_strncpyz (truncatedExtensions, extensionsString, extensionsLen + 1);

	return truncatedExtensions;
}

static const char *GetGLExtensionsString()
{
	GLint numExtensions;
	glGetIntegerv(GL_NUM_EXTENSIONS, &numExtensions);
	size_t extensionStringLen = 0;

	for ( int i = 0; i < numExtensions; i++ )
	{
		extensionStringLen += strlen((const char *)qglGetStringi(GL_EXTENSIONS, i)) + 1;
	}

	char *extensionString = (char *)Z_Malloc(extensionStringLen + 1, TAG_GENERAL);
	char *p = extensionString;
	for ( int i = 0; i < numExtensions; i++ )
	{
		const char *extension = (const char *)qglGetStringi(GL_EXTENSIONS, i);
		while ( *extension != '\0' )
			*p++ = *extension++;

		*p++ = ' ';
	}

	*p = '\0';
	assert((p - extensionString) == extensionStringLen);

	return extensionString;
}

/*
** InitOpenGL
**
** This function is responsible for initializing a valid OpenGL subsystem.  This
** is done by calling GLimp_Init (which gives us a working OGL subsystem) then
** setting variables, checking GL constants, and reporting the gfx system config
** to the user.
*/
static void InitOpenGL( void )
{
	//
	// initialize OS specific portions of the renderer
	//
	// GLimp_Init directly or indirectly references the following cvars:
	//		- r_fullscreen
	//		- r_mode
	//		- r_(color|depth|stencil)bits
	//		- r_ignorehwgamma
	//		- r_gamma
	//

	if ( glConfig.vidWidth == 0 )
	{
		windowDesc_t windowDesc = {};
		memset(&glConfig, 0, sizeof(glConfig));

		windowDesc.api = GRAPHICS_API_OPENGL;
		windowDesc.gl.majorVersion = 3;
		windowDesc.gl.minorVersion = 2;
		windowDesc.gl.profile = GLPROFILE_CORE;
		if ( r_debugContext->integer )
			windowDesc.gl.contextFlags = GLCONTEXT_DEBUG;

		window = WIN_Init(&windowDesc, &glConfig);

		GLimp_InitCoreFunctions();

		Com_Printf( "GL_RENDERER: %s\n", (char *)qglGetString (GL_RENDERER) );

		// get our config strings
		glConfig.vendor_string = (const char *)qglGetString (GL_VENDOR);
		glConfig.renderer_string = (const char *)qglGetString (GL_RENDERER);
		glConfig.version_string = (const char *)qglGetString (GL_VERSION);
		glConfig.extensions_string = GetGLExtensionsString();

		glConfigExt.originalExtensionString = glConfig.extensions_string;
		glConfig.extensions_string = TruncateGLExtensionsString(glConfigExt.originalExtensionString, 128);

		// OpenGL driver constants
		qglGetIntegerv( GL_MAX_TEXTURE_SIZE, &glConfig.maxTextureSize );

		// Determine GPU IHV
		if ( Q_stristr( glConfig.vendor_string, "ATI Technologies Inc." ) )
		{
			glRefConfig.hardwareVendor = IHV_AMD;
		}
		else if ( Q_stristr( glConfig.vendor_string, "NVIDIA" ) )
		{
			glRefConfig.hardwareVendor = IHV_NVIDIA;
		}
		else if ( Q_stristr( glConfig.vendor_string, "INTEL") )
		{
			glRefConfig.hardwareVendor = IHV_INTEL;
		}
		else
		{
			glRefConfig.hardwareVendor = IHV_UNKNOWN;
		}

		// stubbed or broken drivers may have reported 0...
		glConfig.maxTextureSize = Q_max(0, glConfig.maxTextureSize);

		// initialize extensions
		GLimp_InitExtensions();

		// Create the default VAO
		GLuint vao;
		qglGenVertexArrays(1, &vao);
		qglBindVertexArray(vao);
		tr.globalVao = vao;

		// set default state
		GL_SetDefaultState();

		R_Splash();	//get something on screen asap
	}
	else
	{
		// set default state
		GL_SetDefaultState();
	}
}

/*
==================
GL_CheckErrors
==================
*/
void GL_CheckErrs( const char *file, int line ) {
#if defined(_DEBUG)
	GLenum	err;
	char	s[64];

	err = qglGetError();
	if ( err == GL_NO_ERROR ) {
		return;
	}
	if ( r_ignoreGLErrors->integer ) {
		return;
	}
	switch( err ) {
		case GL_INVALID_ENUM:
			strcpy( s, "GL_INVALID_ENUM" );
			break;
		case GL_INVALID_VALUE:
			strcpy( s, "GL_INVALID_VALUE" );
			break;
		case GL_INVALID_OPERATION:
			strcpy( s, "GL_INVALID_OPERATION" );
			break;
		case GL_OUT_OF_MEMORY:
			strcpy( s, "GL_OUT_OF_MEMORY" );
			break;
		default:
			Com_sprintf( s, sizeof(s), "%i", err);
			break;
	}

	R_Error( ERR_FATAL, "GL_CheckErrors: %s in %s at line %d", s , file, line);
#endif
}

/*
==============================================================================

						SCREEN SHOTS

NOTE TTimo
some thoughts about the screenshots system:
screenshots get written in fs_homepath + fs_gamedir
vanilla q3 .. baseq3/screenshots/ *.tga
team arena .. missionpack/screenshots/ *.tga

two commands: "screenshot" and "screenshotJPEG"
we use statics to store a count and start writing the first screenshot/screenshot????.tga (.jpg) available
(with FS_FileExists / FS_FOpenFileWrite calls)
FIXME: the statics don't get a reinit between fs_game changes

============================================================================== 
*/ 

/*
==================
RB_ReadPixels

Reads an image but takes care of alignment issues for reading RGB images.

Reads a minimum offset for where the RGB data starts in the image from
integer stored at pointer offset. When the function has returned the actual
offset was written back to address offset. This address will always have an
alignment of packAlign to ensure efficient copying.

Stores the length of padding after a line of pixels to address padlen

Return value must be freed with Hunk_FreeTempMemory()
==================
*/

static byte *RB_ReadPixels(
	int x, int y, int width, int height, size_t *offset, int *padlen)
{
	byte *buffer, *bufstart;
	int padwidth, linelen;
	GLint packAlign;

	qglGetIntegerv(GL_PACK_ALIGNMENT, &packAlign);

	linelen = width * 3;
	padwidth = PAD(linelen, packAlign);

	// Allocate a few more bytes so that we can choose an alignment we like
	buffer = (byte *)Hunk_AllocateTempMemory(padwidth * height + *offset + packAlign - 1);

	bufstart = (byte*)(PADP((intptr_t) buffer + *offset, packAlign));
	qglReadPixels(x, y, width, height, GL_RGB, GL_UNSIGNED_BYTE, bufstart);

	*offset = bufstart - buffer;
	*padlen = padwidth - linelen;

	return buffer;
}

static void ConvertRGBtoBGR(
	byte *dst, const byte *src, int stride, int width, int height)
{
	const byte *row = src;
	for (int y = 0; y < height; ++y)
	{
		const byte *pixelRGB = row;
		for (int x = 0; x < width; ++x)
		{
			// swap rgb to bgr
			const byte temp = pixelRGB[0];
			*dst++ = pixelRGB[2];
			*dst++ = pixelRGB[1];
			*dst++ = temp;
			
			pixelRGB += 3;
		}
		
		row += stride;
	}
}

static void R_SaveTGA(
	const char *filename,
	const byte *pixels,
	int width,
	int height,
	int stride)
{
	const size_t headerSize = 18;
	const size_t pixelBufferSize = stride * height;
	const size_t bufferSize = headerSize + pixelBufferSize;

	byte *buffer = (byte *)Hunk_AllocateTempMemory(bufferSize);

	// Write TGA header
	Com_Memset(buffer, 0, headerSize);
	buffer[2] = 2;		// uncompressed type
	buffer[12] = width & 255;
	buffer[13] = width >> 8;
	buffer[14] = height & 255;
	buffer[15] = height >> 8;
	buffer[16] = 24; // pixel size

	ConvertRGBtoBGR(buffer + headerSize, pixels, stride, width, height);

	FS_WriteFile(filename, buffer, bufferSize);
	Hunk_FreeTempMemory(buffer);
}

/* 
================== 
R_SaveScreenshotTGA
================== 
*/  
static void R_SaveScreenshotTGA(
	const screenshotReadback_t *screenshotReadback, byte *pixels)
{
	R_SaveTGA(
		screenshotReadback->filename,
		pixels,
		screenshotReadback->width,
		screenshotReadback->height,
		screenshotReadback->strideInBytes);
}

/*
================== 
R_SaveScreenshotPNG
================== 
*/
static void R_SaveScreenshotPNG(
	const screenshotReadback_t *screenshotReadback, byte *pixels)
{
	R_SavePNG(
		screenshotReadback->filename,
		pixels,
		screenshotReadback->width,
		screenshotReadback->height,
		3);
}

/*
==================
R_SaveScreenshotJPG
==================
*/
static void R_SaveScreenshotJPG(
	const screenshotReadback_t *screenshotReadback, byte *pixels)
{
	R_SaveJPG(
		screenshotReadback->filename,
		r_screenshotJpegQuality->integer,
		screenshotReadback->width,
		screenshotReadback->height,
		pixels,
		screenshotReadback->strideInBytes - screenshotReadback->rowInBytes);
}

void R_SaveScreenshot(screenshotReadback_t *screenshotReadback)
{
	qglBindBuffer(GL_PIXEL_PACK_BUFFER, screenshotReadback->pbo);

	byte *pixelBuffer = static_cast<byte *>(
		qglMapBuffer(GL_PIXEL_PACK_BUFFER, GL_READ_ONLY));

	if (pixelBuffer == nullptr)
	{
		R_Printf(
			PRINT_ALL,
			S_COLOR_RED "Failed to read screenshot data from GPU\n");
	}
	else
	{
		const int height = screenshotReadback->height;
		const int stride = screenshotReadback->strideInBytes;
		const size_t pixelBufferSize = stride * height;

		byte *pixels = (byte *)Hunk_AllocateTempMemory(pixelBufferSize);
		Com_Memcpy(pixels, pixelBuffer, pixelBufferSize);
		qglUnmapBuffer(GL_PIXEL_PACK_BUFFER);

		if (glConfig.deviceSupportsGamma)
			R_GammaCorrect(pixels, pixelBufferSize);

		switch (screenshotReadback->format)
		{
			case SSF_JPEG:
				R_SaveScreenshotJPG(screenshotReadback, pixels);
				break;

			case SSF_TGA:
				R_SaveScreenshotTGA(screenshotReadback, pixels);
				break;

			case SSF_PNG:
				R_SaveScreenshotPNG(screenshotReadback, pixels);
				break;
		}

		Hunk_FreeTempMemory(pixels);
	}

	qglDeleteBuffers(1, &screenshotReadback->pbo);
	screenshotReadback->pbo = 0;
}

/*
==================
R_TakeScreenshotCmd
==================
*/
const void *RB_TakeScreenshotCmd( const void *data ) {
	const screenshotCommand_t *cmd;
	
	cmd = (const screenshotCommand_t *)data;

	// finish any 2D drawing if needed
	if (tess.numIndexes)
		RB_EndSurface();

	const int frameNumber = backEndData->realFrameNumber;
	gpuFrame_t *thisFrame = &backEndData->frames[frameNumber % MAX_FRAMES];
	screenshotReadback_t *screenshot = &thisFrame->screenshotReadback;
	
	GLint packAlign;
	qglGetIntegerv(GL_PACK_ALIGNMENT, &packAlign);
	
	const int linelen = cmd->width * 3;
	const int strideInBytes = PAD(linelen, packAlign);
	
	qglGenBuffers(1, &screenshot->pbo);
	qglBindBuffer(GL_PIXEL_PACK_BUFFER, screenshot->pbo);
	qglBufferData(
		GL_PIXEL_PACK_BUFFER,
		strideInBytes * cmd->height,
		nullptr,
		GL_STATIC_COPY);
	qglReadPixels(
		cmd->x, cmd->y, cmd->width, cmd->height, GL_RGB, GL_UNSIGNED_BYTE, 0);

	screenshot->strideInBytes = strideInBytes;
	screenshot->rowInBytes = linelen;
	screenshot->width = cmd->width;
	screenshot->height = cmd->height;
	screenshot->format = cmd->format;
	Q_strncpyz(
		screenshot->filename, cmd->fileName, sizeof(screenshot->filename));
	
	return (const void *)(cmd + 1);	
}

/*
==================
R_TakeScreenshot
==================
*/
void R_TakeScreenshot( int x, int y, int width, int height, char *name, screenshotFormat_t format ) {
	static char	fileName[MAX_OSPATH]; // bad things if two screenshots per frame?
	screenshotCommand_t	*cmd;

	cmd = (screenshotCommand_t *)R_GetCommandBuffer( sizeof( *cmd ) );
	if ( !cmd ) {
		return;
	}
	cmd->commandId = RC_SCREENSHOT;

	cmd->x = x;
	cmd->y = y;
	cmd->width = width;
	cmd->height = height;
	Q_strncpyz( fileName, name, sizeof(fileName) );
	cmd->fileName = fileName;
	cmd->format = format;
}

/* 
================== 
R_ScreenshotFilename
================== 
*/  
void R_ScreenshotFilename( char *buf, int bufSize, const char *ext ) {
	time_t rawtime;
	char timeStr[32] = {0}; // should really only reach ~19 chars

	time( &rawtime );
	strftime( timeStr, sizeof( timeStr ), "%Y-%m-%d_%H-%M-%S", localtime( &rawtime ) ); // or gmtime

	Com_sprintf( buf, bufSize, "screenshots/shot%s%s", timeStr, ext );
}

/*
====================
R_LevelShot

levelshots are specialized 256*256 thumbnails for
the menu system, sampled down from full screen distorted images
====================
*/
#define LEVELSHOTSIZE 256
static void R_LevelShot( void ) {
	char		checkname[MAX_OSPATH];
	byte		*buffer;
	byte		*source, *allsource;
	byte		*src, *dst;
	size_t		offset = 0;
	int			padlen;
	int			x, y;
	int			r, g, b;
	float		xScale, yScale;
	int			xx, yy;

	Com_sprintf( checkname, sizeof(checkname), "levelshots/%s.tga", tr.world->baseName );

	allsource = RB_ReadPixels(0, 0, glConfig.vidWidth, glConfig.vidHeight, &offset, &padlen);
	source = allsource + offset;

	buffer = (byte *)Hunk_AllocateTempMemory(LEVELSHOTSIZE * LEVELSHOTSIZE*3 + 18);
	Com_Memset (buffer, 0, 18);
	buffer[2] = 2;		// uncompressed type
	buffer[12] = LEVELSHOTSIZE & 255;
	buffer[13] = LEVELSHOTSIZE >> 8;
	buffer[14] = LEVELSHOTSIZE & 255;
	buffer[15] = LEVELSHOTSIZE >> 8;
	buffer[16] = 24;	// pixel size

	// resample from source
	xScale = glConfig.vidWidth / (4.0*LEVELSHOTSIZE);
	yScale = glConfig.vidHeight / (3.0*LEVELSHOTSIZE);
	for ( y = 0 ; y < LEVELSHOTSIZE ; y++ ) {
		for ( x = 0 ; x < LEVELSHOTSIZE ; x++ ) {
			r = g = b = 0;
			for ( yy = 0 ; yy < 3 ; yy++ ) {
				for ( xx = 0 ; xx < 4 ; xx++ ) {
					src = source + 3 * ( glConfig.vidWidth * (int)( (y*3+yy)*yScale ) + (int)( (x*4+xx)*xScale ) );
					r += src[0];
					g += src[1];
					b += src[2];
				}
			}
			dst = buffer + 18 + 3 * ( y * LEVELSHOTSIZE + x );
			dst[0] = b / 12;
			dst[1] = g / 12;
			dst[2] = r / 12;
		}
	}

	// gamma correct
	if ( ( tr.overbrightBits > 0 ) && glConfig.deviceSupportsGamma ) {
		R_GammaCorrect( buffer + 18, LEVELSHOTSIZE * LEVELSHOTSIZE * 3 );
	}

	FS_WriteFile( checkname, buffer, LEVELSHOTSIZE * LEVELSHOTSIZE*3 + 18 );

	Hunk_FreeTempMemory( buffer );
	Hunk_FreeTempMemory( allsource );

	R_Printf( PRINT_ALL, "Wrote %s\n", checkname );
}

/* 
================== 
R_ScreenShotTGA_f

screenshot
screenshot [silent]
screenshot [levelshot]
screenshot [filename]

Doesn't print the pacifier message if there is a second arg
================== 
*/  
void R_ScreenShotTGA_f (void) {
	char checkname[MAX_OSPATH] = {0};
	qboolean silent = qfalse;

	if ( !strcmp( Cmd_Argv(1), "levelshot" ) ) {
		R_LevelShot();
		return;
	}

	if ( !strcmp( Cmd_Argv(1), "silent" ) )
		silent = qtrue;

	if ( Cmd_Argc() == 2 && !silent ) {
		// explicit filename
		Com_sprintf( checkname, sizeof( checkname ), "screenshots/%s.tga", Cmd_Argv( 1 ) );
	}
	else {
		// timestamp the file
		R_ScreenshotFilename( checkname, sizeof( checkname ), ".tga" );

		if ( FS_FileExists( checkname ) ) {
			Com_Printf( "ScreenShot: Couldn't create a file\n"); 
			return;
 		}
	}

	R_TakeScreenshot( 0, 0, glConfig.vidWidth, glConfig.vidHeight, checkname, SSF_TGA );

	if ( !silent )
		R_Printf (PRINT_ALL, "Wrote %s\n", checkname);
}

void R_ScreenShotPNG_f (void) {
	char checkname[MAX_OSPATH] = {0};
	qboolean silent = qfalse;

	if ( !strcmp( Cmd_Argv(1), "levelshot" ) ) {
		R_LevelShot();
		return;
	}

	if ( !strcmp( Cmd_Argv(1), "silent" ) )
		silent = qtrue;

	if ( Cmd_Argc() == 2 && !silent ) {
		// explicit filename
		Com_sprintf( checkname, sizeof( checkname ), "screenshots/%s.png", Cmd_Argv( 1 ) );
	}
	else {
		// timestamp the file
		R_ScreenshotFilename( checkname, sizeof( checkname ), ".png" );

		if ( FS_FileExists( checkname ) ) {
			Com_Printf( "ScreenShot: Couldn't create a file\n"); 
			return;
 		}
	}

	R_TakeScreenshot( 0, 0, glConfig.vidWidth, glConfig.vidHeight, checkname, SSF_PNG );

	if ( !silent )
		R_Printf (PRINT_ALL, "Wrote %s\n", checkname);
}

void R_ScreenShotJPEG_f (void) {
	char checkname[MAX_OSPATH] = {0};
	qboolean silent = qfalse;

	if ( !strcmp( Cmd_Argv(1), "levelshot" ) ) {
		R_LevelShot();
		return;
	}

	if ( !strcmp( Cmd_Argv(1), "silent" ) )
		silent = qtrue;

	if ( Cmd_Argc() == 2 && !silent ) {
		// explicit filename
		Com_sprintf( checkname, sizeof( checkname ), "screenshots/%s.jpg", Cmd_Argv( 1 ) );
	}
	else {
		// timestamp the file
		R_ScreenshotFilename( checkname, sizeof( checkname ), ".jpg" );

		if ( FS_FileExists( checkname ) ) {
			Com_Printf( "ScreenShot: Couldn't create a file\n"); 
			return;
 		}
	}

	R_TakeScreenshot( 0, 0, glConfig.vidWidth, glConfig.vidHeight, checkname, SSF_JPEG );

	if ( !silent )
		R_Printf (PRINT_ALL, "Wrote %s\n", checkname);
}

//============================================================================

/*
==================
RB_TakeVideoFrameCmd
==================
*/
const void *RB_TakeVideoFrameCmd( const void *data )
{
	const videoFrameCommand_t	*cmd;
	byte				*cBuf;
	size_t				memcount, linelen;
	int				padwidth, avipadwidth, padlen, avipadlen;
	GLint packAlign;

	// finish any 2D drawing if needed
	if(tess.numIndexes)
		RB_EndSurface();

	cmd = (const videoFrameCommand_t *)data;
	
	qglGetIntegerv(GL_PACK_ALIGNMENT, &packAlign);

	linelen = cmd->width * 3;

	// Alignment stuff for glReadPixels
	padwidth = PAD(linelen, packAlign);
	padlen = padwidth - linelen;
	// AVI line padding
	avipadwidth = PAD(linelen, AVI_LINE_PADDING);
	avipadlen = avipadwidth - linelen;

	cBuf = (byte*)(PADP(cmd->captureBuffer, packAlign));
		
	qglReadPixels(0, 0, cmd->width, cmd->height, GL_RGB,
		GL_UNSIGNED_BYTE, cBuf);

	memcount = padwidth * cmd->height;

	// gamma correct
	if(glConfig.deviceSupportsGamma)
		R_GammaCorrect(cBuf, memcount);

	if(cmd->motionJpeg)
	{
		memcount = R_SaveJPGToBuffer(cmd->encodeBuffer, linelen * cmd->height,
			r_aviMotionJpegQuality->integer,
			cmd->width, cmd->height, cBuf, padlen);
		CL_WriteAVIVideoFrame(cmd->encodeBuffer, memcount);
	}
	else
	{
		byte *lineend, *memend;
		byte *srcptr, *destptr;
	
		srcptr = cBuf;
		destptr = cmd->encodeBuffer;
		memend = srcptr + memcount;
		
		// swap R and B and remove line paddings
		while(srcptr < memend)
		{
			lineend = srcptr + linelen;
			while(srcptr < lineend)
			{
				*destptr++ = srcptr[2];
				*destptr++ = srcptr[1];
				*destptr++ = srcptr[0];
				srcptr += 3;
			}
			
			Com_Memset(destptr, '\0', avipadlen);
			destptr += avipadlen;
			
			srcptr += padlen;
		}
		
		CL_WriteAVIVideoFrame(cmd->encodeBuffer, avipadwidth * cmd->height);
	}

	return (const void *)(cmd + 1);	
}

//============================================================================

/*
** GL_SetDefaultState
*/
void GL_SetDefaultState( void )
{
	qglClearDepth( 1.0f );

	qglCullFace(GL_FRONT);

	// initialize downstream texture unit if we're running
	// in a multitexture environment
	GL_SelectTexture( 1 );
	GL_TextureMode( r_textureMode->string );
	GL_SelectTexture( 0 );

	GL_TextureMode( r_textureMode->string );

	//qglShadeModel( GL_SMOOTH );
	qglDepthFunc( GL_LEQUAL );

	Com_Memset(&glState, 0, sizeof(glState));

	//
	// make sure our GL state vector is set correctly
	//
	glState.glStateBits = GLS_DEPTHTEST_DISABLE | GLS_DEPTHMASK_TRUE;
	glState.maxDepth = 1.0f;
	qglDepthRange(0.0f, 1.0f);

	qglUseProgram(0);

	qglBindBuffer(GL_ARRAY_BUFFER, 0);
	qglBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);

	qglPolygonMode (GL_FRONT_AND_BACK, GL_FILL);
	qglDepthMask( GL_TRUE );
	qglDisable( GL_DEPTH_TEST );
	qglEnable( GL_SCISSOR_TEST );
	qglEnable(GL_PROGRAM_POINT_SIZE);
	qglDisable( GL_CULL_FACE );
	qglDisable( GL_BLEND );

	qglEnable(GL_TEXTURE_CUBE_MAP_SEAMLESS);
}

/*
================
R_PrintLongString

Workaround for R_Printf's 1024 characters buffer limit.
================
*/
void R_PrintLongString(const char *string) {
	char buffer[1024];
	const char *p;
	int size = strlen(string);

	p = string;
	while(size > 0)
	{
		Q_strncpyz(buffer, p, sizeof (buffer) );
		R_Printf( PRINT_ALL, "%s", buffer );
		p += 1023;
		size -= 1023;
	}
}

/*
================
GfxInfo_f
================
*/
static void GfxInfo_f( void ) 
{
	const char *enablestrings[] =
	{
		"disabled",
		"enabled"
	};
	const char *fsstrings[] =
	{
		"windowed",
		"fullscreen"
	};
	const char *noborderstrings[] =
	{
		"",
		"noborder "
	};

	int fullscreen = Cvar_VariableIntegerValue("r_fullscreen");
	int noborder = Cvar_VariableIntegerValue("r_noborder");

	R_Printf( PRINT_ALL, "\nGL_VENDOR: %s\n", glConfig.vendor_string );
	R_Printf( PRINT_ALL, "GL_RENDERER: %s\n", glConfig.renderer_string );
	R_Printf( PRINT_ALL, "GL_VERSION: %s\n", glConfig.version_string );
	R_Printf( PRINT_ALL, "GL_EXTENSIONS: " );
	R_PrintLongString( glConfigExt.originalExtensionString );
	R_Printf( PRINT_ALL, "\n" );
	R_Printf( PRINT_ALL, "GL_MAX_TEXTURE_SIZE: %d\n", glConfig.maxTextureSize );
	R_Printf( PRINT_ALL, "\nPIXELFORMAT: color(%d-bits) Z(%d-bit) stencil(%d-bits)\n", glConfig.colorBits, glConfig.depthBits, glConfig.stencilBits );
	R_Printf( PRINT_ALL, "MODE: %d, %d x %d %s%s hz:",
				Cvar_VariableIntegerValue("r_mode"),
				glConfig.vidWidth, glConfig.vidHeight,
				fullscreen == 0 ? noborderstrings[noborder == 1] : noborderstrings[0],
				fsstrings[fullscreen == 1] );
	if ( glConfig.displayFrequency )
	{
		R_Printf( PRINT_ALL, "%d\n", glConfig.displayFrequency );
	}
	else
	{
		R_Printf( PRINT_ALL, "N/A\n" );
	}
	if ( glConfig.deviceSupportsGamma )
	{
		R_Printf( PRINT_ALL, "GAMMA: hardware w/ %d overbright bits\n", tr.overbrightBits );
	}
	else
	{
		R_Printf( PRINT_ALL, "GAMMA: software w/ %d overbright bits\n", tr.overbrightBits );
	}

	R_Printf( PRINT_ALL, "texturemode: %s\n", r_textureMode->string );
	R_Printf( PRINT_ALL, "picmip: %d\n", r_picmip->integer );
	R_Printf( PRINT_ALL, "texture bits: %d\n", r_texturebits->integer );

	if ( r_vertexLight->integer )
	{
		R_Printf( PRINT_ALL, "HACK: using vertex lightmap approximation\n" );
	}
	int displayRefresh = Cvar_VariableIntegerValue("r_displayRefresh");
	if ( displayRefresh ) {
		R_Printf( PRINT_ALL, "Display refresh set to %d\n", displayRefresh );
	}

	if ( r_finish->integer ) {
		R_Printf( PRINT_ALL, "Forcing glFinish\n" );
	}

	R_Printf( PRINT_ALL, "Dynamic Glow: %s\n", enablestrings[r_dynamicGlow->integer != 0] );
}

/*
================
GfxMemInfo_f
================
*/
void GfxMemInfo_f( void ) 
{
	switch (glRefConfig.memInfo)
	{
		case MI_NONE:
		{
			R_Printf(PRINT_ALL, "No extension found for GPU memory info.\n");
		}
		break;
		case MI_NVX:
		{
			int value;

			qglGetIntegerv(GL_GPU_MEMORY_INFO_DEDICATED_VIDMEM_NVX, &value);
			R_Printf(PRINT_ALL, "GPU_MEMORY_INFO_DEDICATED_VIDMEM_NVX: %ikb\n", value);

			qglGetIntegerv(GL_GPU_MEMORY_INFO_TOTAL_AVAILABLE_MEMORY_NVX, &value);
			R_Printf(PRINT_ALL, "GPU_MEMORY_INFO_TOTAL_AVAILABLE_MEMORY_NVX: %ikb\n", value);

			qglGetIntegerv(GL_GPU_MEMORY_INFO_CURRENT_AVAILABLE_VIDMEM_NVX, &value);
			R_Printf(PRINT_ALL, "GPU_MEMORY_INFO_CURRENT_AVAILABLE_VIDMEM_NVX: %ikb\n", value);

			qglGetIntegerv(GL_GPU_MEMORY_INFO_EVICTION_COUNT_NVX, &value);
			R_Printf(PRINT_ALL, "GPU_MEMORY_INFO_EVICTION_COUNT_NVX: %i\n", value);

			qglGetIntegerv(GL_GPU_MEMORY_INFO_EVICTED_MEMORY_NVX, &value);
			R_Printf(PRINT_ALL, "GPU_MEMORY_INFO_EVICTED_MEMORY_NVX: %ikb\n", value);
		}
		break;
		case MI_ATI:
		{
			// GL_ATI_meminfo
			int value[4];

			qglGetIntegerv(GL_VBO_FREE_MEMORY_ATI, &value[0]);
			R_Printf(PRINT_ALL, "VBO_FREE_MEMORY_ATI: %ikb total %ikb largest aux: %ikb total %ikb largest\n", value[0], value[1], value[2], value[3]);

			qglGetIntegerv(GL_TEXTURE_FREE_MEMORY_ATI, &value[0]);
			R_Printf(PRINT_ALL, "TEXTUR_FREE_MEMORY_ATI: %ikb total %ikb largest aux: %ikb total %ikb largest\n", value[0], value[1], value[2], value[3]);

			qglGetIntegerv(GL_RENDERBUFFER_FREE_MEMORY_ATI, &value[0]);
			R_Printf(PRINT_ALL, "RENDERBUFFER_FREE_MEMORY_ATI: %ikb total %ikb largest aux: %ikb total %ikb largest\n", value[0], value[1], value[2], value[3]);
		}
		break;
	}
}

static void R_CaptureFrameData_f()
{
	int argc = Cmd_Argc();
	if ( argc <= 1 )
	{
		R_Printf( PRINT_ALL, "Usage: %s <multi|single>\n", Cmd_Argv(0));
		return;
	}


	const char *cmd = Cmd_Argv(1);
	if ( Q_stricmp(cmd, "single") == 0 )
		tr.numFramesToCapture = 1;
	else if ( Q_stricmp(cmd, "multi") == 0 )
		tr.numFramesToCapture = atoi(Cmd_Argv(1));

	int len = FS_FOpenFileByMode("rend2.log", &tr.debugFile, FS_APPEND);
	if ( len == -1 || !tr.debugFile )
	{
		R_Printf( PRINT_ERROR, "Failed to open rend2 log file\n" );
		tr.numFramesToCapture = 0;
	}
}

typedef struct consoleCommand_s {
	const char	*cmd;
	xcommand_t	func;
} consoleCommand_t;

static consoleCommand_t	commands[] = {
	{ "imagelist",			R_ImageList_f },
	{ "shaderlist",			R_ShaderList_f },
	{ "skinlist",			R_SkinList_f },
	{ "fontlist",			R_FontList_f },
	{ "screenshot",			R_ScreenShotJPEG_f },
	{ "screenshot_png",		R_ScreenShotPNG_f },
	{ "screenshot_tga",		R_ScreenShotTGA_f },
	{ "gfxinfo",			GfxInfo_f },
	{ "gfxmeminfo",			GfxMemInfo_f },
	//{ "r_we",				R_WorldEffect_f },
	//{ "imagecacheinfo",		R_RegisterImages_Info_f },
	{ "modellist",			R_Modellist_f },
	//{ "modelcacheinfo",		R_RegisterModels_Info_f },
	{ "vbolist",			R_VBOList_f },
	{ "capframes",			R_CaptureFrameData_f },
};

static const size_t numCommands = ARRAY_LEN( commands );


/*
===============
R_Register
===============
*/
void R_Register( void ) 
{
	//
	// latched and archived variables
	//
	r_allowExtensions = Cvar_Get( "r_allowExtensions", "1", CVAR_ARCHIVE | CVAR_LATCH, "Allow GL extensions" );
	r_ext_compressed_textures = Cvar_Get( "r_ext_compress_textures", "0", CVAR_ARCHIVE | CVAR_LATCH, "Disable/enable texture compression" );
	r_ext_multitexture = Cvar_Get( "r_ext_multitexture", "1", CVAR_ARCHIVE | CVAR_LATCH, "Unused" );
	r_ext_compiled_vertex_array = Cvar_Get( "r_ext_compiled_vertex_array", "1", CVAR_ARCHIVE | CVAR_LATCH, "Unused" );
	r_ext_texture_env_add = Cvar_Get( "r_ext_texture_env_add", "1", CVAR_ARCHIVE | CVAR_LATCH, "Unused" );
	r_ext_preferred_tc_method = Cvar_Get( "r_ext_preferred_tc_method", "0", CVAR_ARCHIVE | CVAR_LATCH, "Preferred texture compression method" );

	r_ext_draw_range_elements = Cvar_Get( "r_ext_draw_range_elements", "1", CVAR_ARCHIVE | CVAR_LATCH, "Unused" );
	r_ext_multi_draw_arrays = Cvar_Get( "r_ext_multi_draw_arrays", "1", CVAR_ARCHIVE | CVAR_LATCH, "Unused" );
	r_ext_texture_float = Cvar_Get( "r_ext_texture_float", "1", CVAR_ARCHIVE | CVAR_LATCH, "Disable/enable floating-point textures" );
	r_arb_half_float_pixel = Cvar_Get( "r_arb_half_float_pixel", "1", CVAR_ARCHIVE | CVAR_LATCH, "Disable/enable ARB_half_float GL extension" );
	r_ext_framebuffer_multisample = Cvar_Get( "r_ext_framebuffer_multisample", "0", CVAR_ARCHIVE | CVAR_LATCH, "Disable/enable framebuffer MSAA" );
	r_arb_seamless_cube_map = Cvar_Get( "r_arb_seamless_cube_map", "0", CVAR_ARCHIVE | CVAR_LATCH, "Disable/enable seamless cube map filtering GL extension" );
	r_arb_vertex_type_2_10_10_10_rev = Cvar_Get( "r_arb_vertex_type_2_10_10_10_rev", "1", CVAR_ARCHIVE | CVAR_LATCH, "Disable/enable 1010102 UI data type" );
	r_arb_buffer_storage = Cvar_Get( "r_arb_buffer_storage", "0", CVAR_ARCHIVE | CVAR_LATCH, "Disable/enable buffer storage GL extension" );
	r_ext_texture_filter_anisotropic = Cvar_Get( "r_ext_texture_filter_anisotropic", "16", CVAR_ARCHIVE, "Disable/enable anisotropic texture filtering" );

	r_dynamicGlow						= Cvar_Get( "r_dynamicGlow",			"0",		CVAR_ARCHIVE, "" );
	r_dynamicGlowPasses					= Cvar_Get( "r_dynamicGlowPasses",		"5",		CVAR_ARCHIVE, "" );
	r_dynamicGlowDelta					= Cvar_Get( "r_dynamicGlowDelta",		"0.8f",		CVAR_ARCHIVE, "" );
	r_dynamicGlowIntensity				= Cvar_Get( "r_dynamicGlowIntensity",	"1.13f",	CVAR_ARCHIVE, "" );
	r_dynamicGlowSoft					= Cvar_Get( "r_dynamicGlowSoft",		"1",		CVAR_ARCHIVE, "" );
	r_dynamicGlowWidth					= Cvar_Get( "r_dynamicGlowWidth",		"320",		CVAR_ARCHIVE|CVAR_LATCH, "" );
	r_dynamicGlowHeight					= Cvar_Get( "r_dynamicGlowHeight",		"240",		CVAR_ARCHIVE|CVAR_LATCH, "" );

	r_debugContext						= Cvar_Get( "r_debugContext",			"0",		CVAR_LATCH, "" );

	r_picmip = Cvar_Get ("r_picmip", "0", CVAR_ARCHIVE | CVAR_LATCH, "" );
	Cvar_CheckRange( r_picmip, 0, 16, qtrue );
	r_roundImagesDown = Cvar_Get ("r_roundImagesDown", "1", CVAR_ARCHIVE | CVAR_LATCH, "" );
	r_colorMipLevels = Cvar_Get ("r_colorMipLevels", "0", CVAR_LATCH, "" );
	r_detailTextures = Cvar_Get( "r_detailtextures", "1", CVAR_ARCHIVE | CVAR_LATCH, "" );
	r_texturebits = Cvar_Get( "r_texturebits", "0", CVAR_ARCHIVE | CVAR_LATCH, "" );
	r_overBrightBits = Cvar_Get ("r_overBrightBits", "0", CVAR_ARCHIVE | CVAR_LATCH, "" );
	r_simpleMipMaps = Cvar_Get( "r_simpleMipMaps", "1", CVAR_ARCHIVE | CVAR_LATCH, "" );
	r_vertexLight = Cvar_Get( "r_vertexLight", "0", CVAR_ARCHIVE | CVAR_LATCH, "" );
	r_uiFullScreen = Cvar_Get( "r_uifullscreen", "0", 0, "");
	r_subdivisions = Cvar_Get ("r_subdivisions", "4", CVAR_ARCHIVE | CVAR_LATCH, "");
	Cvar_CheckRange( r_subdivisions, 4, 80, qfalse );
	r_stereo = Cvar_Get( "r_stereo", "0", CVAR_ARCHIVE | CVAR_LATCH, "");
	r_greyscale = Cvar_Get("r_greyscale", "0", CVAR_ARCHIVE | CVAR_LATCH, "");
	Cvar_CheckRange(r_greyscale, 0, 1, qfalse);

	r_externalGLSL = Cvar_Get( "r_externalGLSL", "0", CVAR_LATCH, "" );

	r_hdr = Cvar_Get( "r_hdr", "1", CVAR_ARCHIVE | CVAR_LATCH, "" );
	r_floatLightmap = Cvar_Get( "r_floatLightmap", "0", CVAR_ARCHIVE | CVAR_LATCH, "" );

	r_toneMap = Cvar_Get( "r_toneMap", "1", CVAR_ARCHIVE | CVAR_LATCH, "" );
	r_forceToneMap = Cvar_Get( "r_forceToneMap", "0", CVAR_CHEAT, "" );
	r_forceToneMapMin = Cvar_Get( "r_forceToneMapMin", "-8.0", CVAR_CHEAT, "" );
	r_forceToneMapAvg = Cvar_Get( "r_forceToneMapAvg", "-2.0", CVAR_CHEAT, "" );
	r_forceToneMapMax = Cvar_Get( "r_forceToneMapMax", "0.0", CVAR_CHEAT, "" );

	r_autoExposure = Cvar_Get( "r_autoExposure", "1", CVAR_ARCHIVE, "" );
	r_forceAutoExposure = Cvar_Get( "r_forceAutoExposure", "0", CVAR_CHEAT, "" );
	r_forceAutoExposureMin = Cvar_Get( "r_forceAutoExposureMin", "-2.0", CVAR_CHEAT, "" );
	r_forceAutoExposureMax = Cvar_Get( "r_forceAutoExposureMax", "2.0", CVAR_CHEAT, "" );

	r_cameraExposure = Cvar_Get( "r_cameraExposure", "0", CVAR_CHEAT, "" );

	r_srgb = Cvar_Get( "r_srgb", "0", CVAR_ARCHIVE | CVAR_LATCH, "" );

	r_depthPrepass = Cvar_Get( "r_depthPrepass", "1", CVAR_ARCHIVE, "" );
	r_ssao = Cvar_Get( "r_ssao", "0", CVAR_LATCH | CVAR_ARCHIVE, "" );

	r_normalMapping = Cvar_Get( "r_normalMapping", "1", CVAR_ARCHIVE | CVAR_LATCH, "" );
	r_specularMapping = Cvar_Get( "r_specularMapping", "1", CVAR_ARCHIVE | CVAR_LATCH, "" );
	r_deluxeMapping = Cvar_Get( "r_deluxeMapping", "1", CVAR_ARCHIVE | CVAR_LATCH, "" );
	r_parallaxMapping = Cvar_Get( "r_parallaxMapping", "0", CVAR_ARCHIVE | CVAR_LATCH, "" );
	r_cubeMapping = Cvar_Get( "r_cubeMapping", "0", CVAR_ARCHIVE | CVAR_LATCH, "" );
	r_baseNormalX = Cvar_Get( "r_baseNormalX", "1.0", CVAR_ARCHIVE | CVAR_LATCH, "" );
	r_baseNormalY = Cvar_Get( "r_baseNormalY", "1.0", CVAR_ARCHIVE | CVAR_LATCH, "" );
	r_baseParallax = Cvar_Get( "r_baseParallax", "0.05", CVAR_ARCHIVE | CVAR_LATCH, "" );
   	r_baseSpecular = Cvar_Get( "r_baseSpecular", "0.04", CVAR_ARCHIVE | CVAR_LATCH, "" ); 
	r_dlightMode = Cvar_Get( "r_dlightMode", "1", CVAR_ARCHIVE | CVAR_LATCH, "" );
	r_pshadowDist = Cvar_Get( "r_pshadowDist", "128", CVAR_ARCHIVE, "" );
	r_mergeLightmaps = Cvar_Get( "r_mergeLightmaps", "1", CVAR_ARCHIVE | CVAR_LATCH, "" );
	r_imageUpsample = Cvar_Get( "r_imageUpsample", "0", CVAR_ARCHIVE | CVAR_LATCH, "" );
	r_imageUpsampleMaxSize = Cvar_Get( "r_imageUpsampleMaxSize", "1024", CVAR_ARCHIVE | CVAR_LATCH, "" );
	r_imageUpsampleType = Cvar_Get( "r_imageUpsampleType", "1", CVAR_ARCHIVE | CVAR_LATCH, "" );
	r_genNormalMaps = Cvar_Get( "r_genNormalMaps", "0", CVAR_ARCHIVE | CVAR_LATCH, "" );

	r_forceSun = Cvar_Get( "r_forceSun", "0", CVAR_CHEAT, "" );
	r_forceSunMapLightScale = Cvar_Get( "r_forceSunMapLightScale", "1.0", CVAR_CHEAT, "" );
	r_forceSunLightScale = Cvar_Get( "r_forceSunLightScale", "1.0", CVAR_CHEAT, "" );
	r_forceSunAmbientScale = Cvar_Get( "r_forceSunAmbientScale", "0.5", CVAR_CHEAT, "" );
	r_drawSunRays = Cvar_Get( "r_drawSunRays", "0", CVAR_ARCHIVE | CVAR_LATCH, "" );
	r_sunlightMode = Cvar_Get( "r_sunlightMode", "1", CVAR_ARCHIVE | CVAR_LATCH, "" );

	r_sunShadows = Cvar_Get( "r_sunShadows", "1", CVAR_ARCHIVE | CVAR_LATCH, "" );
	r_shadowFilter = Cvar_Get( "r_shadowFilter", "1", CVAR_ARCHIVE | CVAR_LATCH, "" );
	r_shadowMapSize = Cvar_Get( "r_shadowMapSize", "1024", CVAR_ARCHIVE | CVAR_LATCH, "" );
	r_shadowCascadeZNear = Cvar_Get( "r_shadowCascadeZNear", "4", CVAR_ARCHIVE | CVAR_LATCH, "" );
	r_shadowCascadeZFar = Cvar_Get( "r_shadowCascadeZFar", "3072", CVAR_ARCHIVE | CVAR_LATCH, "" );
	r_shadowCascadeZBias = Cvar_Get( "r_shadowCascadeZBias", "-320", CVAR_ARCHIVE | CVAR_LATCH, "" );
	r_ignoreDstAlpha = Cvar_Get( "r_ignoreDstAlpha", "1", CVAR_ARCHIVE | CVAR_LATCH, "" );

	//
	// temporary latched variables that can only change over a restart
	//
	r_fullbright = Cvar_Get ("r_fullbright", "0", CVAR_LATCH|CVAR_CHEAT, "" );
	r_mapOverBrightBits = Cvar_Get ("r_mapOverBrightBits", "0", CVAR_LATCH, "" );
	r_intensity = Cvar_Get ("r_intensity", "1", CVAR_LATCH, "" );
	r_singleShader = Cvar_Get ("r_singleShader", "0", CVAR_CHEAT | CVAR_LATCH, "" );

	//
	// archived variables that can change at any time
	//
	r_lodCurveError = Cvar_Get( "r_lodCurveError", "250", CVAR_ARCHIVE|CVAR_CHEAT, "" );
	r_lodbias = Cvar_Get( "r_lodbias", "0", CVAR_ARCHIVE, "" );
	r_flares = Cvar_Get ("r_flares", "0", CVAR_ARCHIVE, "" );
	r_znear = Cvar_Get( "r_znear", "4", CVAR_CHEAT, "" );
	Cvar_CheckRange( r_znear, 0.001f, 200, qfalse );
	r_autolodscalevalue	= Cvar_Get( "r_autolodscalevalue", "0", CVAR_ROM, "" );
	r_zproj = Cvar_Get( "r_zproj", "64", CVAR_ARCHIVE, "" );
	r_stereoSeparation = Cvar_Get( "r_stereoSeparation", "64", CVAR_ARCHIVE, "" );
	r_ignoreGLErrors = Cvar_Get( "r_ignoreGLErrors", "1", CVAR_ARCHIVE, "" );
	r_fastsky = Cvar_Get( "r_fastsky", "0", CVAR_ARCHIVE, "" );
	r_inGameVideo = Cvar_Get( "r_inGameVideo", "1", CVAR_ARCHIVE, "" );
	r_drawSun = Cvar_Get( "r_drawSun", "0", CVAR_ARCHIVE, "" );
	r_dynamiclight = Cvar_Get( "r_dynamiclight", "1", CVAR_ARCHIVE, "" );
	r_finish = Cvar_Get ("r_finish", "0", CVAR_ARCHIVE, "");
	r_textureMode = Cvar_Get( "r_textureMode", "GL_LINEAR_MIPMAP_NEAREST", CVAR_ARCHIVE, "" );
	r_markcount = Cvar_Get( "r_markcount", "100", CVAR_ARCHIVE, "" );
	r_gamma = Cvar_Get( "r_gamma", "1", CVAR_ARCHIVE, "" );
	r_facePlaneCull = Cvar_Get ("r_facePlaneCull", "1", CVAR_ARCHIVE, "" );

	r_ambientScale = Cvar_Get( "r_ambientScale", "0.6", CVAR_CHEAT, "" );
	r_directedScale = Cvar_Get( "r_directedScale", "1", CVAR_CHEAT, "" );

	r_anaglyphMode = Cvar_Get("r_anaglyphMode", "0", CVAR_ARCHIVE, "");

	//
	// temporary variables that can change at any time
	//
	r_showImages = Cvar_Get( "r_showImages", "0", CVAR_TEMP, "" );

	r_debugLight = Cvar_Get( "r_debuglight", "0", CVAR_TEMP, "" );
	r_debugSort = Cvar_Get( "r_debugSort", "0", CVAR_CHEAT, "" );
	r_printShaders = Cvar_Get( "r_printShaders", "0", 0, "" );
	r_saveFontData = Cvar_Get( "r_saveFontData", "0", 0, "" );

	r_nocurves = Cvar_Get ("r_nocurves", "0", CVAR_CHEAT, "" );
	r_drawworld = Cvar_Get ("r_drawworld", "1", CVAR_CHEAT, "" );
	r_lightmap = Cvar_Get ("r_lightmap", "0", 0, "" );
	r_portalOnly = Cvar_Get ("r_portalOnly", "0", CVAR_CHEAT, "" );

	r_flareSize = Cvar_Get ("r_flareSize", "40", CVAR_CHEAT, "");
	r_flareFade = Cvar_Get ("r_flareFade", "7", CVAR_CHEAT, "");
	r_flareCoeff = Cvar_Get ("r_flareCoeff", FLARE_STDCOEFF, CVAR_CHEAT, "");

	r_skipBackEnd = Cvar_Get ("r_skipBackEnd", "0", CVAR_CHEAT, "");

	r_measureOverdraw = Cvar_Get( "r_measureOverdraw", "0", CVAR_CHEAT, "" );
	r_lodscale = Cvar_Get( "r_lodscale", "5", CVAR_CHEAT, "" );
	r_norefresh = Cvar_Get ("r_norefresh", "0", CVAR_CHEAT, "");
	r_drawentities = Cvar_Get ("r_drawentities", "1", CVAR_CHEAT, "" );
	r_ignore = Cvar_Get( "r_ignore", "1", CVAR_CHEAT, "" );
	r_nocull = Cvar_Get ("r_nocull", "0", CVAR_CHEAT, "");
	r_novis = Cvar_Get ("r_novis", "0", CVAR_CHEAT, "");
	r_showcluster = Cvar_Get ("r_showcluster", "0", CVAR_CHEAT, "");
	r_speeds = Cvar_Get ("r_speeds", "0", CVAR_CHEAT, "");
	r_verbose = Cvar_Get( "r_verbose", "0", CVAR_CHEAT, "" );
	r_logFile = Cvar_Get( "r_logFile", "0", CVAR_CHEAT, "" );
	r_debugSurface = Cvar_Get ("r_debugSurface", "0", CVAR_CHEAT, "");
	r_nobind = Cvar_Get ("r_nobind", "0", CVAR_CHEAT, "");
	r_showtris = Cvar_Get ("r_showtris", "0", CVAR_CHEAT, "");
	r_showsky = Cvar_Get ("r_showsky", "0", CVAR_CHEAT, "");
	r_shownormals = Cvar_Get ("r_shownormals", "0", CVAR_CHEAT, "");
	r_clear = Cvar_Get ("r_clear", "0", CVAR_CHEAT, "");
	r_offsetFactor = Cvar_Get( "r_offsetfactor", "-1", CVAR_CHEAT, "" );
	r_offsetUnits = Cvar_Get( "r_offsetunits", "-2", CVAR_CHEAT, "" );
	r_drawBuffer = Cvar_Get( "r_drawBuffer", "GL_BACK", CVAR_CHEAT, "" );
	r_lockpvs = Cvar_Get ("r_lockpvs", "0", CVAR_CHEAT, "");
	r_noportals = Cvar_Get ("r_noportals", "0", CVAR_CHEAT, "");
	r_shadows = Cvar_Get( "cg_shadows", "1", 0, "" );

	r_marksOnTriangleMeshes = Cvar_Get("r_marksOnTriangleMeshes", "0", CVAR_ARCHIVE, "");

	r_aviMotionJpegQuality = Cvar_Get("r_aviMotionJpegQuality", "90", CVAR_ARCHIVE, "");
	r_screenshotJpegQuality = Cvar_Get("r_screenshotJpegQuality", "90", CVAR_ARCHIVE, "");
	r_surfaceSprites = Cvar_Get("r_surfaceSprites", "1", CVAR_ARCHIVE, "");

	r_aspectCorrectFonts = Cvar_Get( "r_aspectCorrectFonts", "0", CVAR_ARCHIVE, "" );
	r_maxpolys = Cvar_Get( "r_maxpolys", XSTRING( DEFAULT_MAX_POLYS ), 0, "");
	r_maxpolyverts = Cvar_Get( "r_maxpolyverts", XSTRING( DEFAULT_MAX_POLYVERTS ), 0, "" );

/*
Ghoul2 Insert Start
*/
#ifdef _DEBUG
	r_noPrecacheGLA						= Cvar_Get( "r_noPrecacheGLA",					"0",						CVAR_CHEAT, "" );
#endif
	r_noServerGhoul2					= Cvar_Get( "r_noserverghoul2",					"0",						CVAR_CHEAT, "" );
	r_Ghoul2AnimSmooth					= Cvar_Get( "r_ghoul2animsmooth",				"0.3",						CVAR_NONE, "" );
	r_Ghoul2UnSqashAfterSmooth			= Cvar_Get( "r_ghoul2unsqashaftersmooth",		"1",						CVAR_NONE, "" );
	broadsword							= Cvar_Get( "broadsword",						"0",						CVAR_ARCHIVE, "" );
	broadsword_kickbones				= Cvar_Get( "broadsword_kickbones",				"1",						CVAR_NONE, "" );
	broadsword_kickorigin				= Cvar_Get( "broadsword_kickorigin",			"1",						CVAR_NONE, "" );
	broadsword_dontstopanim				= Cvar_Get( "broadsword_dontstopanim",			"0",						CVAR_NONE, "" );
	broadsword_waitforshot				= Cvar_Get( "broadsword_waitforshot",			"0",						CVAR_NONE, "" );
	broadsword_playflop					= Cvar_Get( "broadsword_playflop",				"1",						CVAR_NONE, "" );
	broadsword_smallbbox				= Cvar_Get( "broadsword_smallbbox",				"0",						CVAR_NONE, "" );
	broadsword_extra1					= Cvar_Get( "broadsword_extra1",				"0",						CVAR_NONE, "" );
	broadsword_extra2					= Cvar_Get( "broadsword_extra2",				"0",						CVAR_NONE, "" );
	broadsword_effcorr					= Cvar_Get( "broadsword_effcorr",				"1",						CVAR_NONE, "" );
	broadsword_ragtobase				= Cvar_Get( "broadsword_ragtobase",				"2",						CVAR_NONE, "" );
	broadsword_dircap					= Cvar_Get( "broadsword_dircap",				"64",						CVAR_NONE, "" );
/*
Ghoul2 Insert End
*/

	se_language = Cvar_Get ( "se_language", "english", CVAR_ARCHIVE | CVAR_NORESTART, "" );

	for ( size_t i = 0; i < numCommands; i++ )
		Cmd_AddCommand( commands[i].cmd, commands[i].func, "" );
}

void R_InitQueries(void)
{
	if (r_drawSunRays->integer)
		qglGenQueries(ARRAY_LEN(tr.sunFlareQuery), tr.sunFlareQuery);
}

void R_ShutDownQueries(void)
{
	if (r_drawSunRays->integer)
		qglDeleteQueries(ARRAY_LEN(tr.sunFlareQuery), tr.sunFlareQuery);
}

void R_SetLightStyle (int style, int color);

static void R_InitBackEndFrameData()
{
	GLuint timerQueries[MAX_GPU_TIMERS*MAX_FRAMES];
	qglGenQueries(MAX_GPU_TIMERS*MAX_FRAMES, timerQueries);

	GLuint ubos[MAX_FRAMES];
	qglGenBuffers(MAX_FRAMES, ubos);

	for ( int i = 0; i < MAX_FRAMES; i++ )
	{
		gpuFrame_t *frame = backEndData->frames + i;
		const GLbitfield mapBits = GL_MAP_WRITE_BIT | GL_MAP_COHERENT_BIT | GL_MAP_PERSISTENT_BIT;

		frame->ubo = ubos[i];
		frame->uboWriteOffset = 0;
		qglBindBuffer(GL_UNIFORM_BUFFER, frame->ubo);

		// TODO: persistently mapped UBOs
		qglBufferData(GL_UNIFORM_BUFFER, FRAME_UNIFORM_BUFFER_SIZE,
				nullptr, GL_DYNAMIC_DRAW);

		frame->dynamicVbo = R_CreateVBO(nullptr, FRAME_VERTEX_BUFFER_SIZE,
				VBO_USAGE_DYNAMIC);
		frame->dynamicVboCommitOffset = 0;
		frame->dynamicVboWriteOffset = 0;

		frame->dynamicIbo = R_CreateIBO(nullptr, FRAME_INDEX_BUFFER_SIZE,
				VBO_USAGE_DYNAMIC);
		frame->dynamicIboCommitOffset = 0;
		frame->dynamicIboWriteOffset = 0;

		if ( glRefConfig.immutableBuffers )
		{
			R_BindVBO(frame->dynamicVbo);
			frame->dynamicVboMemory = qglMapBufferRange(GL_ARRAY_BUFFER, 0,
				frame->dynamicVbo->vertexesSize, mapBits);

			R_BindIBO(frame->dynamicIbo);
			frame->dynamicIboMemory = qglMapBufferRange(GL_ELEMENT_ARRAY_BUFFER, 0,
				frame->dynamicIbo->indexesSize, mapBits);
		}
		else
		{
			frame->dynamicVboMemory = nullptr;
			frame->dynamicIboMemory = nullptr;
		}

		for ( int j = 0; j < MAX_GPU_TIMERS; j++ )
		{
			gpuTimer_t *timer = frame->timers + j;
			timer->queryName = timerQueries[i*MAX_GPU_TIMERS + j];
		}
	}

	backEndData->currentFrame = backEndData->frames;
}

static void R_ShutdownBackEndFrameData()
{
	if ( !backEndData )
		return;

	for ( int i = 0; i < MAX_FRAMES; i++ )
	{
		gpuFrame_t *frame = backEndData->frames + i;

		qglDeleteBuffers(1, &frame->ubo);

		if ( glRefConfig.immutableBuffers )
		{
			R_BindVBO(frame->dynamicVbo);
			R_BindIBO(frame->dynamicIbo);
			qglUnmapBuffer(GL_ARRAY_BUFFER);
			qglUnmapBuffer(GL_ELEMENT_ARRAY_BUFFER);
		}

		for ( int j = 0; j < MAX_GPU_TIMERS; j++ )
		{
			gpuTimer_t *timer = frame->timers + j;
			qglDeleteQueries(1, &timer->queryName);
		}
	}
}

/*
===============
R_Init
===============
*/
void R_Init( void ) {
	byte *ptr;
	int i;
	
	R_Printf( PRINT_ALL, "----- R_Init -----\n" );

	// clear all our internal state
	Com_Memset( &tr, 0, sizeof( tr ) );
	Com_Memset( &backEnd, 0, sizeof( backEnd ) );
	Com_Memset( &tess, 0, sizeof( tess ) );
	

	//
	// init function tables
	//
	for ( i = 0; i < FUNCTABLE_SIZE; i++ )
	{
		tr.sinTable[i]		= sin( DEG2RAD( i * 360.0f / ( ( float ) ( FUNCTABLE_SIZE - 1 ) ) ) );
		tr.squareTable[i]	= ( i < FUNCTABLE_SIZE/2 ) ? 1.0f : -1.0f;
		tr.sawToothTable[i] = (float)i / FUNCTABLE_SIZE;
		tr.inverseSawToothTable[i] = 1.0f - tr.sawToothTable[i];

		if ( i < FUNCTABLE_SIZE / 2 )
		{
			if ( i < FUNCTABLE_SIZE / 4 )
			{
				tr.triangleTable[i] = ( float ) i / ( FUNCTABLE_SIZE / 4 );
			}
			else
			{
				tr.triangleTable[i] = 1.0f - tr.triangleTable[i-FUNCTABLE_SIZE / 4];
			}
		}
		else
		{
			tr.triangleTable[i] = -tr.triangleTable[i-FUNCTABLE_SIZE/2];
		}
	}

	R_InitFogTable();

	R_ImageLoader_Init();
	R_NoiseInit();
	R_Register();

	max_polys = Q_min( r_maxpolys->integer, DEFAULT_MAX_POLYS );
	max_polyverts = Q_min( r_maxpolyverts->integer, DEFAULT_MAX_POLYVERTS );

	ptr = (byte*)Hunk_Alloc(
		sizeof( *backEndData ) +
		sizeof(srfPoly_t) * max_polys +
		sizeof(polyVert_t) * max_polyverts +
		sizeof(Allocator) +
		PER_FRAME_MEMORY_BYTES,
		h_low);

	backEndData = (backEndData_t *)ptr;
	ptr = (byte *)(backEndData + 1);

	backEndData->polys = (srfPoly_t *)ptr;
	ptr += sizeof(*backEndData->polys) * max_polys;

	backEndData->polyVerts = (polyVert_t *)ptr;
	ptr += sizeof(*backEndData->polyVerts) * max_polyverts;

	backEndData->perFrameMemory = new(ptr) Allocator(ptr + sizeof(*backEndData->perFrameMemory), PER_FRAME_MEMORY_BYTES);

	R_InitNextFrame();

	for ( int i = 0; i < MAX_LIGHT_STYLES; i++ )
	{
		R_SetLightStyle (i, -1);
	}

	R_InitImagesPool();

	InitOpenGL();

	R_InitVBOs();

	R_InitBackEndFrameData();
	R_InitImages();

	FBO_Init();

	GLSL_LoadGPUShaders();

	R_InitShaders (qfalse);

	R_InitSkins();

	R_InitFonts();

	R_ModelInit();

	R_InitDecals();

	R_InitQueries();

	R_InitWeatherSystem();

#if defined(_DEBUG)
	GLenum err = qglGetError();
	if ( err != GL_NO_ERROR )
		R_Printf( PRINT_ALL, "glGetError() = 0x%x\n", err );
#endif

	RestoreGhoul2InfoArray();

	// print info
	GfxInfo_f();
	R_Printf( PRINT_ALL, "----- finished R_Init -----\n" );
}

/*
===============
R_Shutdown
===============
*/
CCALL void R_Shutdown( qboolean destroyWindow, qboolean restarting ) {

	R_Printf( PRINT_ALL, "R_Shutdown( %i )\n", destroyWindow );

	for ( size_t i = 0; i < numCommands; i++ )
		Cmd_RemoveCommand( commands[i].cmd );

	R_ShutdownBackEndFrameData();

	R_ShutdownWeatherSystem();

	R_ShutdownFonts();
	if ( tr.registered ) {
		R_IssuePendingRenderCommands();
		R_ShutDownQueries();
		FBO_Shutdown();
		R_DeleteTextures();
		R_ShutdownVBOs();
		GLSL_ShutdownGPUShaders();

		if ( destroyWindow && restarting )
		{
			Z_Free((void *)glConfig.extensions_string);
			Z_Free((void *)glConfigExt.originalExtensionString);

			qglDeleteVertexArrays(1, &tr.globalVao);
			SaveGhoul2InfoArray();
		}
	}

	// shut down platform specific OpenGL stuff
	if ( destroyWindow ) {
		WIN_Shutdown();
	}

	tr.registered = qfalse;
	backEndData = NULL;
}

/*
=============
R_EndRegistration

Touch all images to make sure they are resident
=============
*/
CCALL void R_EndRegistration( void ) {
	R_IssuePendingRenderCommands();
	if (!Sys_LowPhysicalMemory()) {
		RB_ShowImages();
	}
}

CCALL void R_AutomapElevationAdjustment(float newHeight)
{
	// todo i guess
}

CCALL float R_GetDistanceCull( void ) { return tr.distanceCull; }

CCALL void R_SVModelInit( void ); //tr_model.cpp

CCALL void R_GetRealRes( int *w, int *h ) {
	*w = glConfig.vidWidth;
	*h = glConfig.vidHeight;
}

// STUBS, REPLACEME
CCALL qboolean stub_InitializeWireframeAutomap() { return qtrue; }

CCALL void R_GetLightStyle(int style, color4ub_t color)
{
	if (style >= MAX_LIGHT_STYLES)
	{
	    Com_Error( ERR_FATAL, "R_GetLightStyle: %d is out of range", style );
		return;
	}

	byteAlias_t *baDest = (byteAlias_t *)&color, *baSource = (byteAlias_t *)&styleColors[style];
	baDest->i = baSource->i;
}

CCALL void R_SetLightStyle(int style, int color)
{
	if (style >= MAX_LIGHT_STYLES)
	{
	    Com_Error( ERR_FATAL, "R_SetLightStyle: %d is out of range", style );
		return;
	}

	byteAlias_t *ba = (byteAlias_t *)&styleColors[style];
	if ( ba->i != color) {
		ba->i = color;
	}
}

CCALL void R_GetBModelVerts (int bModel, vec3_t *vec, float *normal) {}
CCALL void stub_R_WorldEffectCommand ( const char *cmd ){}
CCALL void stub_R_AddWeatherZone ( vec3_t mins, vec3_t maxs ) {}
CCALL void R_SetRefractionProperties ( float distortionAlpha, float distortionStretch, qboolean distortionPrePost, qboolean distortionNegate ) { }

CCALL void C_LevelLoadBegin(const char *psMapName, ForceReload_e eForceReload)
{
	static char sPrevMapName[MAX_QPATH]={0};
	bool bDeleteModels = eForceReload == eForceReload_MODELS || eForceReload == eForceReload_ALL;

	if( bDeleteModels )
		CModelCache->DeleteAll();
	else if( Cvar_VariableIntegerValue( "sv_pure" ) )
		CModelCache->DumpNonPure();

	tr.numBSPModels = 0;

	/* If we're switching to the same level, don't increment current level */
	if (Q_stricmp( psMapName,sPrevMapName ))
	{
		Q_strncpyz( sPrevMapName, psMapName, sizeof(sPrevMapName) );
		tr.currentLevel++;
	}
}

CCALL int C_GetLevel( void )
{
	return tr.currentLevel;
}



CCALL void C_LevelLoadEnd( void )
{
	CModelCache->LevelLoadEnd( qfalse );
	SND_RegisterAudio_LevelLoadEnd( qfalse );
	S_RestartMusic();
}