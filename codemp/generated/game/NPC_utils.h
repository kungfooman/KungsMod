void CalcEntitySpot( const gentity_t *ent, const spot_t spot, vec3_t point );
qboolean NPC_UpdateAngles( qboolean doPitch, qboolean doYaw );
void NPC_AimWiggle( vec3_t enemy_org );
qboolean NPC_UpdateFiringAngles( qboolean doPitch, qboolean doYaw );
void NPC_UpdateShootAngles( vec3_t angles, qboolean doPitch, qboolean doYaw );
void SetTeamNumbers();
qboolean G_ActivateBehavior( gentity_t *self, int bset );
void NPC_SetBoneAngles( gentity_t *ent, char *bone, vec3_t angles );
void NPC_SetSurfaceOnOff( gentity_t *ent, const char *surfaceName, int surfaceFlags );
qboolean NPC_SomeoneLookingAtMe( gentity_t *ent );
qboolean NPC_ClearLOS( const vec3_t start, const vec3_t end );
qboolean NPC_ClearLOS5( const vec3_t end );
qboolean NPC_ClearLOS4( gentity_t *ent );
qboolean NPC_ClearLOS3( const vec3_t start, gentity_t *ent );
qboolean NPC_ClearLOS2( gentity_t *ent, const vec3_t end );
qboolean NPC_ValidEnemy( gentity_t *ent );
qboolean NPC_TargetVisible( gentity_t *ent );
int NPC_FindNearestEnemy( gentity_t *ent );
gentity_t *NPC_PickEnemyExt( qboolean checkAlerts );
qboolean NPC_FindPlayer();
static qboolean NPC_CheckPlayerDistance();
qboolean NPC_FindEnemy( qboolean checkAlerts );
qboolean NPC_CheckEnemyExt( qboolean checkAlerts );
qboolean NPC_FacePosition( vec3_t position, qboolean doPitch );
qboolean NPC_FaceEntity( gentity_t *ent, qboolean doPitch );
qboolean NPC_FaceEnemy( qboolean doPitch );
qboolean NPC_CheckCanAttackExt();
void NPC_ClearLookTarget( gentity_t *self );
void NPC_SetLookTarget( gentity_t *self, int entNum, int clearTime );
qboolean NPC_CheckLookTarget( gentity_t *self );
void NPC_CheckCharmed();
void G_GetBoltPosition( gentity_t *self, int boltIndex, vec3_t pos, int modelIndex );
float NPC_EntRangeFromBolt( gentity_t *targEnt, int boltIndex );
float NPC_EnemyRangeFromBolt( int boltIndex );
int NPC_GetEntsNearBolt( int *radiusEnts, float radius, int boltIndex, vec3_t boltOrg );
