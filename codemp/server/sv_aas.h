#ifndef SV_AAS
#define SV_AAS

CCALL int SV_AAS_PointReachabilityAreaIndex(vec3_t point);
CCALL int SV_AAS_PredictRoute(void *route,int areanum,vec3_t origin,int goalareanum,int travelflags,int maxareas,int maxtime,int stopevent,int stopcontents,int stoptfl,int stopareanum);
CCALL int SV_AAS_AlternativeRouteGoals(vec3_t start,int startareanum,vec3_t goal,int goalareanum,int travelflags,void *altroutegoals,int maxaltroutegoals,int type);
CCALL int SV_AAS_PredictClientMovement(void *move,int entnum,vec3_t origin,int presencetype,int onground,vec3_t velocity,vec3_t cmdmove,int cmdframes,int maxframes,float frametime,int stopevent,int stopareanum,int visualize);
CCALL int SV_AAS_Swimming(vec3_t origin);
CCALL int SV_AAS_AreaTravelTimeToGoalArea(int areanum,vec3_t origin,int goalareanum,int travelflags);
CCALL int SV_AAS_AreaReachability(int areanum);
CCALL int SV_AAS_IntForBSPEpairKey(int ent,char *key,int *value);
CCALL int SV_AAS_FloatForBSPEpairKey(int ent,char *key,float *value);
CCALL int SV_AAS_VectorForBSPEpairKey(int ent,char *key,vec3_t v);
CCALL int SV_AAS_ValueForBSPEpairKey(int ent,char *key,char *value,int size);
CCALL int SV_AAS_NextBSPEntity(int ent);
CCALL int SV_AAS_PointContents(vec3_t point);
CCALL int SV_AAS_TraceAreas(vec3_t start,vec3_t end,int *areas,vec3_t *points,int maxareas);
CCALL int SV_AAS_PointAreaNum(vec3_t point);
CCALL float SV_AAS_Time(void);
CCALL void SV_AAS_PresenceTypeBoundingBox(int presencetype,vec3_t mins,vec3_t maxs);
CCALL int SV_AAS_Initialized(void);
CCALL void SV_AAS_EntityInfo(int entnum,void *info);
CCALL int SV_AAS_AreaInfo(int areanum,void *info);
CCALL int SV_AAS_BBoxAreas(vec3_t absmins,vec3_t absmaxs,int *areas,int maxareas);
CCALL int SV_AAS_EnableRoutingArea(int areanum,int enable);

#endif