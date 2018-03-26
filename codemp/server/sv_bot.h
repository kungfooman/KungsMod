#ifndef SV_BOT
#define SV_BOT

#include "rd-rend2/include_ccall.h"

CCALL int SV_BotGetSnapshotEntity(int client,int sequence);
CCALL int SV_BotGetConsoleMessage(int client,char *buf,int size);
CCALL void SV_BotInitBotLib(void);
CCALL void SV_BotInitCvars(void);
CCALL int SV_BotLibShutdown(void);
CCALL int SV_BotLibSetup(void);
CCALL void SV_BotFrame(int time);
CCALL void BotClientCommand(int client,char *command);
CCALL void BotImport_DebugLineShow(int line,vec3_t start,vec3_t end,int color);
CCALL void BotImport_DebugLineDelete(int line);
CCALL int BotImport_DebugLineCreate(void);
CCALL void BotImport_DebugPolygonDelete(int id);
CCALL void BotImport_DebugPolygonShow(int id,int color,int numPoints,vec3_t *points);
CCALL int BotImport_DebugPolygonCreate(int color,int numPoints,vec3_t *points);
CCALL void *BotImport_HunkAlloc(int size);
CCALL void BotImport_FreeMemory(void *ptr);
CCALL void *BotImport_GetMemory(int size);
CCALL void Bot_FreeMemoryGame(void *ptr);
CCALL void *Bot_GetMemoryGame(int size);
CCALL void BotImport_BSPModelMinsMaxsOrigin(int modelnum,vec3_t angles,vec3_t outmins,vec3_t outmaxs,vec3_t origin);
CCALL char *BotImport_BSPEntityData(void);
CCALL int BotImport_inPVS(vec3_t p1,vec3_t p2);
CCALL int BotImport_PointContents(vec3_t point);
CCALL void BotImport_EntityTrace(bsp_trace_t *bsptrace,vec3_t start,vec3_t mins,vec3_t maxs,vec3_t end,int entnum,int contentmask);
CCALL void BotImport_Trace(bsp_trace_t *bsptrace,vec3_t start,vec3_t mins,vec3_t maxs,vec3_t end,int passent,int contentmask);
CCALL void BotDrawDebugPolygons(void(*drawPoly)(int color,int numPoints,float *points),int value);
CCALL void SV_BotFreeClient(int clientNum);
CCALL int SV_BotAllocateClient(void);
CCALL void SV_BotCalculatePaths(int);
CCALL void SV_BotWaypointReception(int wpnum,wpobject_t **wps);
CCALL void *BotVMShift(intptr_t ptr);
CCALL int SV_OrgVisibleBox(vec3_t org1,vec3_t mins,vec3_t maxs,vec3_t org2,int ignore);


CCALL void SV_BotUserCommand(int clientNum,usercmd_t *ucmd);
CCALL int SV_BotGetServerCommand(int clientNum,char *message,int size);
CCALL int SV_BotLibTest(int parm0,char *parm1,vec3_t parm2,vec3_t parm3);
CCALL int SV_BotLibUpdateEntity(int ent,void *bue);
CCALL int SV_BotLibLoadMap(const char *mapname);
CCALL int SV_BotLibStartFrame(float time);
CCALL int SV_BotLibDefine(char *string);
CCALL int SV_BotLibVarGet(char *var_name,char *value,int size);
CCALL int SV_BotLibVarSet(char *var_name,char *value);
CCALL int SV_BotLibShutdown(void);
CCALL int SV_BotLibSetup(void);
CCALL void SV_BotAddAvoidSpot(int movestate,vec3_t origin,float radius,int type);
CCALL void SV_BotSetAvoidGoalTime(int goalstate,int number,float avoidtime);
CCALL int SV_BotPredictVisiblePosition(vec3_t origin,int areanum,void *goal,int travelflags,vec3_t target);
CCALL void SV_BotRemoveFromAvoidGoals(int goalstate,int number);
CCALL void SV_BotGetChatMessage(int chatstate,char *buf,int size);
CCALL int SV_BotNumInitialChats(int chatstate,char *type);
CCALL int SV_BotGetMapLocationGoal(char *name,void *goal);
CCALL int SV_BotGetNextCampSpotGoal(int num,void *goal);
CCALL void SV_BotMutateGoalFuzzyLogic(int goalstate,float range);
CCALL void SV_BotInterbreedGoalFuzzyLogic(int parent1,int parent2,int child);
CCALL int SV_GeneticParentsAndChildSelection(int numranks,float *ranks,int *parent1,int *parent2,int *child);
CCALL void SV_BotResetWeaponState(int weaponstate);
CCALL void SV_BotFreeWeaponState(int weaponstate);
CCALL int SV_BotAllocWeaponState(void);
CCALL int SV_BotLoadWeaponWeights(int weaponstate,char *filename);
CCALL void SV_BotGetWeaponInfo(int weaponstate,int weapon,void *weaponinfo);
CCALL int SV_BotChooseBestFightWeapon(int weaponstate,int *inventory);
CCALL void SV_BotInitMoveState(int handle,void *initmove);
CCALL void SV_BotFreeMoveState(int handle);
CCALL int SV_BotAllocMoveState(void);
CCALL int SV_BotMovementViewTarget(int movestate,void *goal,int travelflags,float lookahead,vec3_t target);
CCALL int SV_BotReachabilityArea(vec3_t origin,int testground);
CCALL void SV_BotResetLastAvoidReach(int movestate);
CCALL void SV_BotResetAvoidReach(int movestate);
CCALL int SV_BotMoveInDirection(int movestate,vec3_t dir,float speed,int type);
CCALL void SV_BotMoveToGoal(void *result,int movestate,void *goal,int travelflags);
CCALL void SV_BotResetMoveState(int movestate);
CCALL void SV_BotFreeGoalState(int handle);
CCALL int SV_BotAllocGoalState(int state);
CCALL void SV_BotSaveGoalFuzzyLogic(int goalstate,char *filename);
CCALL void SV_BotFreeItemWeights(int goalstate);
CCALL int SV_BotLoadItemWeights(int goalstate,char *filename);
CCALL void SV_BotUpdateEntityItems(void);
CCALL void SV_BotInitLevelItems(void);
CCALL float SV_BotAvoidGoalTime(int goalstate,int number);
CCALL int SV_BotGetLevelItemGoal(int index,char *classname,void *goal);
CCALL int SV_BotItemGoalInVisButNotVisible(int viewer,vec3_t eye,vec3_t viewangles,void *goal);
CCALL int SV_BotTouchingGoal(vec3_t origin,void *goal);
CCALL int SV_BotChooseNBGItem(int goalstate,vec3_t origin,int *inventory,int travelflags,void *ltg,float maxtime);
CCALL int SV_BotChooseLTGItem(int goalstate,vec3_t origin,int *inventory,int travelflags);
CCALL int SV_BotGetSecondGoal(int goalstate,void *goal);
CCALL int SV_BotGetTopGoal(int goalstate,void *goal);
CCALL void SV_BotGoalName(int number,char *name,int size);
CCALL void SV_BotDumpGoalStack(int goalstate);
CCALL void SV_BotDumpAvoidGoals(int goalstate);
CCALL void SV_BotEmptyGoalStack(int goalstate);
CCALL void SV_BotPopGoal(int goalstate);
CCALL void SV_BotPushGoal(int goalstate,void *goal);
CCALL void SV_BotResetAvoidGoals(int goalstate);
CCALL void SV_BotResetGoalState(int goalstate);
CCALL void SV_BotSetChatName(int chatstate,char *name,int client);
CCALL void SV_BotSetChatGender(int chatstate,int gender);
CCALL int SV_BotLoadChatFile(int chatstate,char *chatfile,char *chatname);
CCALL void SV_BotReplaceSynonyms(char *string,unsigned long int context);

#endif