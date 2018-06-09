CalcEntitySpot( ent_, spot_, point_ ) = ccall((:CalcEntitySpot, lib), Void, ( Ptr{gentity_t}, spot_t, vec3_t,  ), ent_, spot_, point_ );
NPC_UpdateAngles( doPitch_, doYaw_ ) = ccall((:NPC_UpdateAngles, lib), qboolean, ( qboolean, qboolean,  ), doPitch_, doYaw_ );
NPC_AimWiggle( enemy_org_ ) = ccall((:NPC_AimWiggle, lib), Void, ( vec3_t,  ), enemy_org_ );
NPC_UpdateFiringAngles( doPitch_, doYaw_ ) = ccall((:NPC_UpdateFiringAngles, lib), qboolean, ( qboolean, qboolean,  ), doPitch_, doYaw_ );
NPC_UpdateShootAngles( angles_, doPitch_, doYaw_ ) = ccall((:NPC_UpdateShootAngles, lib), Void, ( vec3_t, qboolean, qboolean,  ), angles_, doPitch_, doYaw_ );
SetTeamNumbers() = ccall((:SetTeamNumbers, lib), Void, (),  );
G_ActivateBehavior( self_, bset_ ) = ccall((:G_ActivateBehavior, lib), qboolean, ( Ptr{gentity_t}, Int32,  ), self_, bset_ );
NPC_SetBoneAngles( ent_, bone_, angles_ ) = ccall((:NPC_SetBoneAngles, lib), Void, ( Ptr{gentity_t}, Ptr{Char}, vec3_t,  ), ent_, bone_, angles_ );
NPC_SetSurfaceOnOff( ent_, surfaceName_, surfaceFlags_ ) = ccall((:NPC_SetSurfaceOnOff, lib), Void, ( Ptr{gentity_t}, Ptr{Char}, Int32,  ), ent_, surfaceName_, surfaceFlags_ );
NPC_SomeoneLookingAtMe( ent_ ) = ccall((:NPC_SomeoneLookingAtMe, lib), qboolean, ( Ptr{gentity_t},  ), ent_ );
NPC_ClearLOS( start_, end_ ) = ccall((:NPC_ClearLOS, lib), qboolean, ( vec3_t, vec3_t,  ), start_, end_ );
NPC_ClearLOS5( end_ ) = ccall((:NPC_ClearLOS5, lib), qboolean, ( vec3_t,  ), end_ );
NPC_ClearLOS4( ent_ ) = ccall((:NPC_ClearLOS4, lib), qboolean, ( Ptr{gentity_t},  ), ent_ );
NPC_ClearLOS3( start_, ent_ ) = ccall((:NPC_ClearLOS3, lib), qboolean, ( vec3_t, Ptr{gentity_t},  ), start_, ent_ );
NPC_ClearLOS2( ent_, end_ ) = ccall((:NPC_ClearLOS2, lib), qboolean, ( Ptr{gentity_t}, vec3_t,  ), ent_, end_ );
NPC_ValidEnemy( ent_ ) = ccall((:NPC_ValidEnemy, lib), qboolean, ( Ptr{gentity_t},  ), ent_ );
NPC_TargetVisible( ent_ ) = ccall((:NPC_TargetVisible, lib), qboolean, ( Ptr{gentity_t},  ), ent_ );
NPC_FindNearestEnemy( ent_ ) = ccall((:NPC_FindNearestEnemy, lib), Int32, ( Ptr{gentity_t},  ), ent_ );
NPC_PickEnemyExt( checkAlerts_ ) = ccall((:NPC_PickEnemyExt, lib), Ptr{gentity_t}, ( qboolean,  ), checkAlerts_ );
NPC_FindPlayer() = ccall((:NPC_FindPlayer, lib), qboolean, (),  );
NPC_CheckPlayerDistance() = ccall((:NPC_CheckPlayerDistance, lib), qboolean, (),  );
NPC_FindEnemy( checkAlerts_ ) = ccall((:NPC_FindEnemy, lib), qboolean, ( qboolean,  ), checkAlerts_ );
NPC_CheckEnemyExt( checkAlerts_ ) = ccall((:NPC_CheckEnemyExt, lib), qboolean, ( qboolean,  ), checkAlerts_ );
NPC_FacePosition( position_, doPitch_ ) = ccall((:NPC_FacePosition, lib), qboolean, ( vec3_t, qboolean,  ), position_, doPitch_ );
NPC_FaceEntity( ent_, doPitch_ ) = ccall((:NPC_FaceEntity, lib), qboolean, ( Ptr{gentity_t}, qboolean,  ), ent_, doPitch_ );
NPC_FaceEnemy( doPitch_ ) = ccall((:NPC_FaceEnemy, lib), qboolean, ( qboolean,  ), doPitch_ );
NPC_CheckCanAttackExt() = ccall((:NPC_CheckCanAttackExt, lib), qboolean, (),  );
NPC_ClearLookTarget( self_ ) = ccall((:NPC_ClearLookTarget, lib), Void, ( Ptr{gentity_t},  ), self_ );
NPC_SetLookTarget( self_, entNum_, clearTime_ ) = ccall((:NPC_SetLookTarget, lib), Void, ( Ptr{gentity_t}, Int32, Int32,  ), self_, entNum_, clearTime_ );
NPC_CheckLookTarget( self_ ) = ccall((:NPC_CheckLookTarget, lib), qboolean, ( Ptr{gentity_t},  ), self_ );
NPC_CheckCharmed() = ccall((:NPC_CheckCharmed, lib), Void, (),  );
G_GetBoltPosition( self_, boltIndex_, pos_, modelIndex_ ) = ccall((:G_GetBoltPosition, lib), Void, ( Ptr{gentity_t}, Int32, vec3_t, Int32,  ), self_, boltIndex_, pos_, modelIndex_ );
NPC_EntRangeFromBolt( targEnt_, boltIndex_ ) = ccall((:NPC_EntRangeFromBolt, lib), Float32, ( Ptr{gentity_t}, Int32,  ), targEnt_, boltIndex_ );
NPC_EnemyRangeFromBolt( boltIndex_ ) = ccall((:NPC_EnemyRangeFromBolt, lib), Float32, ( Int32,  ), boltIndex_ );
NPC_GetEntsNearBolt( radiusEnts_, radius_, boltIndex_, boltOrg_ ) = ccall((:NPC_GetEntsNearBolt, lib), Int32, ( Ptr{Int32}, Float32, Int32, vec3_t,  ), radiusEnts_, radius_, boltIndex_, boltOrg_ );