void CG_SetGhoul2InfoRef( refEntity_t *ent, refEntity_t *s1 );
void CG_RegisterItemVisuals( int itemNum );
static int CG_MapTorsoToWeaponFrame( clientInfo_t *ci, int frame, int animNum );
static void CG_CalculateWeaponPosition( vec3_t origin, vec3_t angles );
static void CG_LightningBolt( centity_t *cent, vec3_t origin );
static void CG_AddWeaponWithPowerups( refEntity_t *gun, int powerups );
void CG_AddPlayerWeapon( refEntity_t *parent, playerState_t *ps, centity_t *cent, int team, vec3_t newAngles, qboolean thirdPerson );
void CG_AddViewWeapon( playerState_t *ps );
void CG_DrawIconBackground();
qboolean CG_WeaponCheck( int weap );
static qboolean CG_WeaponSelectable( int i );
void CG_DrawWeaponSelect();
void CG_NextWeapon_f();
void CG_PrevWeapon_f();
void CG_Weapon_f();
void CG_WeaponClean_f();
void CG_OutOfAmmoChange( int oldWeapon );
void CG_GetClientWeaponMuzzleBoltPoint( int clIndex, vec3_t to );
void CG_FireWeapon( centity_t *cent, qboolean altFire );
qboolean CG_VehicleWeaponImpact( centity_t *cent );
void CG_MissileHitWall( int weapon, int clientNum, vec3_t origin, vec3_t dir, impactSound_t soundType, qboolean altFire, int charge );
void CG_MissileHitPlayer( int weapon, vec3_t origin, vec3_t dir, int entityNum, qboolean altFire );
qboolean CG_CalcMuzzlePoint( int entityNum, vec3_t muzzle );
void CG_InitG2Weapons();
void CG_ShutDownG2Weapons();
void *CG_G2WeaponInstance( centity_t *cent, int weapon );
void CG_CopyG2WeaponInstance( centity_t *cent, int weaponNum, void *toGhoul2 );
void CG_CheckPlayerG2Weapons( playerState_t *ps, centity_t *cent );