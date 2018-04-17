static void CG_ParseScores();
static void CG_ParseTeamInfo();
void CG_ParseServerinfo();
static void CG_ParseWarmup();
void CG_SetConfigValues();
void CG_ShaderStateChanged();
const static char *GetCustomSoundForType( int setType, int index );
void SetCustomSoundForType( clientInfo_t *ci, int setType, int index, sfxHandle_t sfx );
static void CG_RegisterCustomSounds( clientInfo_t *ci, int setType, const char *psDir );
void CG_PrecacheNPCSounds( const char *str );
void CG_HandleNPCSounds( centity_t *cent );
void SetDuelistHealthsFromConfigString( const char *str );
static void CG_ConfigStringModified();
void CG_KillCEntityG2( int entNum );
void CG_KillCEntityInstances();
static void CG_MapRestart();
static void CG_RemoveChatEscapeChar( char *text );
void CG_CheckSVStringEdRef( char *buf, const char *str );
static void CG_BodyQueueCopy( centity_t *cent, int clientNum, int knownWeapon );
static void CG_SiegeBriefingDisplay_f();
static void CG_SiegeClassSelect_f();
static void CG_SiegeProfileMenu_f();
static void CG_NewForceRank_f();
static void CG_KillGhoul2_f();
static void CG_KillLoopSounds_f();
static void CG_RestoreClientGhoul_f();
static void CG_CenterPrint_f();
static void CG_CenterPrintSE_f();
static void CG_Print_f();
static void CG_Chat_f();
static void CG_RemapShader_f();
static void CG_ClientLevelShot_f();
int svcmdcmp_cg( const void *a, const void *b );
static void CG_ServerCommand();
void CG_ExecuteNewServerCommands( int latestSequence );
