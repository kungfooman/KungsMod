#pragma once

#include "cg_local.h"

EXTERNC qboolean cg_vehPmoveSet;
EXTERNC pmove_t cg_vehPmove;
EXTERNC playerState_t *cgSendPS[MAX_GENTITIES];
EXTERNC playerState_t cgSendPSPool[MAX_GENTITIES];

#if defined(_PROFILE_ES_TO_PS)
extern int g_cgEStoPSTime;
#endif

CCALL void CG_PredictPlayerState(void);
CCALL void CG_Cube(vec3_t mins,vec3_t maxs,vec3_t color,float alpha);
CCALL qboolean CG_UsingEWeb(void);
CCALL void CG_PmoveClientPointerUpdate();
CCALL int CG_PointContents(const vec3_t point,int passEntityNum);
CCALL void CG_G2Trace(trace_t *result,const vec3_t start,const vec3_t mins,const vec3_t maxs,const vec3_t end,int skipNumber,int mask);
CCALL void CG_Trace(trace_t *result,const vec3_t start,const vec3_t mins,const vec3_t maxs,const vec3_t end,int skipNumber,int mask);
CCALL void BG_VehicleAdjustBBoxForOrientation(Vehicle_t *veh,vec3_t origin,vec3_t mins,vec3_t maxs,int clientNum,int tracemask,void(*localTrace)(trace_t *results,const vec3_t start,const vec3_t mins,const vec3_t maxs,const vec3_t end,int passEntityNum,int contentMask));
CCALL void CG_BuildSolidList(void);
