void CG_PositionEntityOnTagunnamed( refEntity_t *entity, const refEntity_t *parent, qhandle_t parentModel, char *tagName );
void CG_PositionRotatedEntityOnTagunnamed( refEntity_t *entity, const refEntity_t *parent, qhandle_t parentModel, char *tagName );
void CG_SetEntitySoundPositionunnamed( centity_t *cent );
void CG_S_AddLoopingSoundunnamed( int entityNum, const vec3_t origin, const vec3_t velocity, sfxHandle_t sfx );
void CG_S_AddRealLoopingSoundunnamed( int entityNum, const vec3_t origin, const vec3_t velocity, sfxHandle_t sfx );
void CG_S_StopLoopingSoundunnamed( int entityNum, sfxHandle_t sfx );
void CG_S_UpdateLoopingSoundsunnamed();
static void CG_EntityEffectsunnamed( centity_t *cent );
localEntity_t *FX_AddOrientedLineunnamed( vec3_t start, vec3_t end, vec3_t normal, float stScale, float scale, float dscale, float startalpha, float endalpha, float killTime, qhandle_t shader );
void FX_DrawPortableShieldunnamed( centity_t *cent );
void CG_Specialunnamed( centity_t *cent );
void CG_SetGhoul2Infounnamed( refEntity_t *ent, centity_t *cent );
void CG_CreateBBRefEntsunnamed( entityState_t *s1, vec3_t origin );
void G2_BoltToGhoul2Modelunnamed( centity_t *cent, refEntity_t *ent );
void ScaleModelAxisunnamed( refEntity_t *ent );
void CG_Disintegrationunnamed( centity_t *cent, refEntity_t *ent );
static qboolean CG_RenderTimeEntBoltunnamed( centity_t *cent );
void CG_AddRadarEntunnamed( centity_t *cent );
void CG_AddBracketedEntunnamed( centity_t *cent );
static void CG_Generalunnamed( centity_t *cent );
static void CG_Speakerunnamed( centity_t *cent );
qboolean CG_GreyItemunnamed( int type, int tag, int plSide );
static void CG_Itemunnamed( centity_t *cent );
void CG_CreateDistortionTrailPartunnamed( centity_t *cent, float scale, vec3_t pos );
static void CG_Missileunnamed( centity_t *cent );
void CG_PlayDoorLoopSoundunnamed( centity_t *cent );
void CG_PlayDoorSoundunnamed( centity_t *cent, int type );
static void CG_Moverunnamed( centity_t *cent );
void CG_Beamunnamed( centity_t *cent );
static void CG_Portalunnamed( centity_t *cent );
void CG_AdjustPositionForMoverunnamed( const vec3_t in, int moverNum, int fromTime, int toTime, vec3_t out );
static void CG_InterpolateEntityPositionunnamed( centity_t *cent );
void CG_CalcEntityLerpPositionsunnamed( centity_t *cent );
static void CG_FXunnamed( centity_t *cent );
static void CG_AddCEntityunnamed( centity_t *cent );
void CG_ManualEntityRenderunnamed( centity_t *cent );
void CG_AddPacketEntitiesunnamed();
void CG_ROFF_NotetrackCallbackunnamed( centity_t *cent, const char *notetrack );
void CG_Cubeunnamed( vec3_t mins, vec3_t maxs, vec3_t color, float alpha );
