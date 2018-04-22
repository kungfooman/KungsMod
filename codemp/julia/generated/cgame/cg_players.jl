CG_CustomSound( clientNum_, soundName_ ) = ccall((:CG_CustomSound, lib), sfxHandle_t, ( Int32, Ptr{Char},  ), clientNum_, soundName_ );
CG_ParseSurfsFile( modelName_, skinName_, surfOff_, surfOn_ ) = ccall((:CG_ParseSurfsFile, lib), qboolean, ( Ptr{Char}, Ptr{Char}, Ptr{Char}, Ptr{Char},  ), modelName_, skinName_, surfOff_, surfOn_ );
CG_RegisterClientModelname( ci_, modelName_, skinName_, teamName_, clientNum_ ) = ccall((:CG_RegisterClientModelname, lib), qboolean, ( Ptr{clientInfo_t}, Ptr{Char}, Ptr{Char}, Ptr{Char}, Int32,  ), ci_, modelName_, skinName_, teamName_, clientNum_ );
CG_ColorFromString( v_, color_ ) = ccall((:CG_ColorFromString, lib), Void, ( Ptr{Char}, vec3_t,  ), v_, color_ );
CG_ColorFromInt( val_, color_ ) = ccall((:CG_ColorFromInt, lib), Void, ( Int32, vec3_t,  ), val_, color_ );
CG_G2SkelForModel( g2_ ) = ccall((:CG_G2SkelForModel, lib), Int32, ( Ptr{Void},  ), g2_ );
CG_G2EvIndexForModel( g2_, animIndex_ ) = ccall((:CG_G2EvIndexForModel, lib), Int32, ( Ptr{Void}, Int32,  ), g2_, animIndex_ );
CG_LoadCISounds( ci_, modelloaded_ ) = ccall((:CG_LoadCISounds, lib), Void, ( Ptr{clientInfo_t}, qboolean,  ), ci_, modelloaded_ );
CG_LoadClientInfo( ci_ ) = ccall((:CG_LoadClientInfo, lib), Void, ( Ptr{clientInfo_t},  ), ci_ );
CG_InitG2SaberData( saberNum_, ci_ ) = ccall((:CG_InitG2SaberData, lib), Void, ( Int32, Ptr{clientInfo_t},  ), saberNum_, ci_ );
CG_CopyClientInfoModel( from_, to_ ) = ccall((:CG_CopyClientInfoModel, lib), Void, ( Ptr{clientInfo_t}, Ptr{clientInfo_t},  ), from_, to_ );
CG_ScanForExistingClientInfo( ci_, clientNum_ ) = ccall((:CG_ScanForExistingClientInfo, lib), qboolean, ( Ptr{clientInfo_t}, Int32,  ), ci_, clientNum_ );
CG_SetDeferredClientInfo( ci_ ) = ccall((:CG_SetDeferredClientInfo, lib), Void, ( Ptr{clientInfo_t},  ), ci_ );
CG_NewClientInfo( clientNum_, entitiesInitialized_ ) = ccall((:CG_NewClientInfo, lib), Void, ( Int32, qboolean,  ), clientNum_, entitiesInitialized_ );
CG_ActualLoadDeferredPlayers() = ccall((:CG_ActualLoadDeferredPlayers, lib), Void, (),  );
CG_LoadDeferredPlayers() = ccall((:CG_LoadDeferredPlayers, lib), Void, (),  );
_PlayerFootStep( origin_, orientation_, radius_, cent_, footStepType_ ) = ccall((:_PlayerFootStep, lib), Void, ( vec3_t, Float32, Float32, Ptr{centity_t}, footstepType_t,  ), origin_, orientation_, radius_, cent_, footStepType_ );
CG_PlayerFootsteps( cent_, footStepType_ ) = ccall((:CG_PlayerFootsteps, lib), Void, ( Ptr{centity_t}, footstepType_t,  ), cent_, footStepType_ );
CG_PlayerAnimEventDo( cent_, animEvent_ ) = ccall((:CG_PlayerAnimEventDo, lib), Void, ( Ptr{centity_t}, Ptr{animevent_t},  ), cent_, animEvent_ );
CG_PlayerAnimEvents( animFileIndex_, eventFileIndex_, torso_, oldFrame_, frame_, entNum_ ) = ccall((:CG_PlayerAnimEvents, lib), Void, ( Int32, Int32, qboolean, Int32, Int32, Int32,  ), animFileIndex_, eventFileIndex_, torso_, oldFrame_, frame_, entNum_ );
CG_TriggerAnimSounds( cent_ ) = ccall((:CG_TriggerAnimSounds, lib), Void, ( Ptr{centity_t},  ), cent_ );
CG_InRoll( cent_ ) = ccall((:CG_InRoll, lib), qboolean, ( Ptr{centity_t},  ), cent_ );
CG_InRollAnim( cent_ ) = ccall((:CG_InRollAnim, lib), qboolean, ( Ptr{centity_t},  ), cent_ );
CG_SetLerpFrameAnimation( cent_, ci_, lf_, newAnimation_, animSpeedMult_, torsoOnly_, flipState_ ) = ccall((:CG_SetLerpFrameAnimation, lib), Void, ( Ptr{centity_t}, Ptr{clientInfo_t}, Ptr{lerpFrame_t}, Int32, Float32, qboolean, qboolean,  ), cent_, ci_, lf_, newAnimation_, animSpeedMult_, torsoOnly_, flipState_ );
CG_FirstAnimFrame( lf_, torsoOnly_, speedScale_ ) = ccall((:CG_FirstAnimFrame, lib), qboolean, ( Ptr{lerpFrame_t}, qboolean, Float32,  ), lf_, torsoOnly_, speedScale_ );
CG_RunLerpFrame( cent_, ci_, lf_, flipState_, newAnimation_, speedScale_, torsoOnly_ ) = ccall((:CG_RunLerpFrame, lib), Void, ( Ptr{centity_t}, Ptr{clientInfo_t}, Ptr{lerpFrame_t}, qboolean, Int32, Float32, qboolean,  ), cent_, ci_, lf_, flipState_, newAnimation_, speedScale_, torsoOnly_ );
CG_ClearLerpFrame( cent_, ci_, lf_, animationNumber_, torsoOnly_ ) = ccall((:CG_ClearLerpFrame, lib), Void, ( Ptr{centity_t}, Ptr{clientInfo_t}, Ptr{lerpFrame_t}, Int32, qboolean,  ), cent_, ci_, lf_, animationNumber_, torsoOnly_ );
CG_PlayerAnimation( cent_, legsOld_, legs_, legsBackLerp_, torsoOld_, torso_, torsoBackLerp_ ) = ccall((:CG_PlayerAnimation, lib), Void, ( Ptr{centity_t}, Ptr{Int32}, Ptr{Int32}, Ptr{Float32}, Ptr{Int32}, Ptr{Int32}, Ptr{Float32},  ), cent_, legsOld_, legs_, legsBackLerp_, torsoOld_, torso_, torsoBackLerp_ );
CG_G2SetBoneAngles( ghoul2_, modelIndex_, boneName_, angles_, flags_, up_, right_, forward_, modelList_, blendTime_, currentTime_ ) = ccall((:CG_G2SetBoneAngles, lib), Void, ( Ptr{Void}, Int32, Ptr{Char}, vec3_t, Int32, Int32, Int32, Int32, Ptr{qhandle_t}, Int32, Int32,  ), ghoul2_, modelIndex_, boneName_, angles_, flags_, up_, right_, forward_, modelList_, blendTime_, currentTime_ );
CG_Rag_Trace( result_, start_, mins_, maxs_, end_, skipNumber_, mask_ ) = ccall((:CG_Rag_Trace, lib), Void, ( Ptr{trace_t}, vec3_t, vec3_t, vec3_t, vec3_t, Int32, Int32,  ), result_, start_, mins_, maxs_, end_, skipNumber_, mask_ );
CG_TempTestFunction( cent_, forcedAngles_ ) = ccall((:CG_TempTestFunction, lib), Void, ( Ptr{centity_t}, vec3_t,  ), cent_, forcedAngles_ );
CG_RagAnimForPositioning( cent_ ) = ccall((:CG_RagAnimForPositioning, lib), Int32, ( Ptr{centity_t},  ), cent_ );
CG_RagDoll( cent_, forcedAngles_ ) = ccall((:CG_RagDoll, lib), qboolean, ( Ptr{centity_t}, vec3_t,  ), cent_, forcedAngles_ );
CG_G2ServerBoneAngles( cent_ ) = ccall((:CG_G2ServerBoneAngles, lib), Void, ( Ptr{centity_t},  ), cent_ );
CG_G2SetHeadBlink( cent_, bStart_ ) = ccall((:CG_G2SetHeadBlink, lib), Void, ( Ptr{centity_t}, qboolean,  ), cent_, bStart_ );
CG_G2SetHeadAnim( cent_, anim_ ) = ccall((:CG_G2SetHeadAnim, lib), Void, ( Ptr{centity_t}, Int32,  ), cent_, anim_ );
CG_G2PlayerHeadAnims( cent_ ) = ccall((:CG_G2PlayerHeadAnims, lib), qboolean, ( Ptr{centity_t},  ), cent_ );
CG_G2PlayerAngles( cent_, legs_, legsAngles_ ) = ccall((:CG_G2PlayerAngles, lib), Void, ( Ptr{centity_t}, matrix3_t, vec3_t,  ), cent_, legs_, legsAngles_ );
CG_TrailItem( cent_, hModel_ ) = ccall((:CG_TrailItem, lib), Void, ( Ptr{centity_t}, qhandle_t,  ), cent_, hModel_ );
CG_PlayerFlag( cent_, hModel_ ) = ccall((:CG_PlayerFlag, lib), Void, ( Ptr{centity_t}, qhandle_t,  ), cent_, hModel_ );
CG_PlayerPowerups( cent_, torso_ ) = ccall((:CG_PlayerPowerups, lib), Void, ( Ptr{centity_t}, Ptr{refEntity_t},  ), cent_, torso_ );
CG_PlayerFloatSprite( cent_, shader_ ) = ccall((:CG_PlayerFloatSprite, lib), Void, ( Ptr{centity_t}, qhandle_t,  ), cent_, shader_ );
CG_PlayerFloatSpriteRGBA( cent_, shader_, rgba_ ) = ccall((:CG_PlayerFloatSpriteRGBA, lib), Void, ( Ptr{centity_t}, qhandle_t, vec4_t,  ), cent_, shader_, rgba_ );
CG_PlayerSprites( cent_ ) = ccall((:CG_PlayerSprites, lib), Void, ( Ptr{centity_t},  ), cent_ );
CG_PlayerShadow( cent_, shadowPlane_ ) = ccall((:CG_PlayerShadow, lib), qboolean, ( Ptr{centity_t}, Ptr{Float32},  ), cent_, shadowPlane_ );
CG_PlayerSplash( cent_ ) = ccall((:CG_PlayerSplash, lib), Void, ( Ptr{centity_t},  ), cent_ );
CG_ForcePushBlur( org_, cent_ ) = ccall((:CG_ForcePushBlur, lib), Void, ( vec3_t, Ptr{centity_t},  ), org_, cent_ );
CG_ForcePushBodyBlur( cent_ ) = ccall((:CG_ForcePushBodyBlur, lib), Void, ( Ptr{centity_t},  ), cent_ );
CG_ForceGripEffect( org_ ) = ccall((:CG_ForceGripEffect, lib), Void, ( vec3_t,  ), org_ );
CG_AddRefEntityWithPowerups( ent_, state_, team_ ) = ccall((:CG_AddRefEntityWithPowerups, lib), Void, ( Ptr{refEntity_t}, Ptr{entityState_t}, Int32,  ), ent_, state_, team_ );
CG_PlayerShieldHit( entitynum_, dir_, amount_ ) = ccall((:CG_PlayerShieldHit, lib), Void, ( Int32, vec3_t, Int32,  ), entitynum_, dir_, amount_ );
CG_DrawPlayerShield( cent_, origin_ ) = ccall((:CG_DrawPlayerShield, lib), Void, ( Ptr{centity_t}, vec3_t,  ), cent_, origin_ );
CG_PlayerHitFX( cent_ ) = ccall((:CG_PlayerHitFX, lib), Void, ( Ptr{centity_t},  ), cent_ );
CG_LightVerts( normal_, numVerts_, verts_ ) = ccall((:CG_LightVerts, lib), Int32, ( vec3_t, Int32, Ptr{polyVert_t},  ), normal_, numVerts_, verts_ );
CG_RGBForSaberColor( color_, rgb_ ) = ccall((:CG_RGBForSaberColor, lib), Void, ( saber_colors_t, vec3_t,  ), color_, rgb_ );
CG_DoSaberLight( saber_ ) = ccall((:CG_DoSaberLight, lib), Void, ( Ptr{saberInfo_t},  ), saber_ );
CG_DoSaber( origin_, dir_, length_, lengthMax_, radius_, color_, rfx_, doLight_ ) = ccall((:CG_DoSaber, lib), Void, ( vec3_t, vec3_t, Float32, Float32, Float32, saber_colors_t, Int32, qboolean,  ), origin_, dir_, length_, lengthMax_, radius_, color_, rfx_, doLight_ );
CG_GetTagWorldPosition( model_, tag_, pos_, axis_ ) = ccall((:CG_GetTagWorldPosition, lib), Void, ( Ptr{refEntity_t}, Ptr{Char}, vec3_t, matrix3_t,  ), model_, tag_, pos_, axis_ );
CG_CreateSaberMarks( start_, end_, normal_ ) = ccall((:CG_CreateSaberMarks, lib), Void, ( vec3_t, vec3_t, vec3_t,  ), start_, end_, normal_ );
CG_G2TraceCollide( tr_, mins_, maxs_, lastValidStart_, lastValidEnd_ ) = ccall((:CG_G2TraceCollide, lib), qboolean, ( Ptr{trace_t}, vec3_t, vec3_t, vec3_t, vec3_t,  ), tr_, mins_, maxs_, lastValidStart_, lastValidEnd_ );
CG_G2SaberEffects( start_, end_, owner_ ) = ccall((:CG_G2SaberEffects, lib), Void, ( vec3_t, vec3_t, Ptr{centity_t},  ), start_, end_, owner_ );
CG_AddGhoul2Mark( shader_, size_, start_, end_, entnum_, entposition_, entangle_, ghoul2_, scale_, lifeTime_ ) = ccall((:CG_AddGhoul2Mark, lib), Void, ( Int32, Float32, vec3_t, vec3_t, Int32, vec3_t, Float32, Ptr{Void}, vec3_t, Int32,  ), shader_, size_, start_, end_, entnum_, entposition_, entangle_, ghoul2_, scale_, lifeTime_ );
CG_SaberCompWork( start_, end_, owner_, saberNum_, bladeNum_ ) = ccall((:CG_SaberCompWork, lib), Void, ( vec3_t, vec3_t, Ptr{centity_t}, Int32, Int32,  ), start_, end_, owner_, saberNum_, bladeNum_ );
CG_AddSaberBlade( cent_, scent_, saber_, renderfx_, modelIndex_, saberNum_, bladeNum_, origin_, angles_, fromSaber_, dontDraw_ ) = ccall((:CG_AddSaberBlade, lib), Void, ( Ptr{centity_t}, Ptr{centity_t}, Ptr{refEntity_t}, Int32, Int32, Int32, Int32, vec3_t, vec3_t, qboolean, qboolean,  ), cent_, scent_, saber_, renderfx_, modelIndex_, saberNum_, bladeNum_, origin_, angles_, fromSaber_, dontDraw_ );
CG_IsMindTricked( trickIndex1_, trickIndex2_, trickIndex3_, trickIndex4_, client_ ) = ccall((:CG_IsMindTricked, lib), Int32, ( Int32, Int32, Int32, Int32, Int32,  ), trickIndex1_, trickIndex2_, trickIndex3_, trickIndex4_, client_ );
CG_DrawPlayerSphere( cent_, origin_, scale_, shader_ ) = ccall((:CG_DrawPlayerSphere, lib), Void, ( Ptr{centity_t}, vec3_t, Float32, Int32,  ), cent_, origin_, scale_, shader_ );
CG_AddLightningBeam( start_, end_ ) = ccall((:CG_AddLightningBeam, lib), Void, ( vec3_t, vec3_t,  ), start_, end_ );
CG_AddRandomLightning( start_, end_ ) = ccall((:CG_AddRandomLightning, lib), Void, ( vec3_t, vec3_t,  ), start_, end_ );
CG_ThereIsAMaster() = ccall((:CG_ThereIsAMaster, lib), qboolean, (),  );
CG_DrawNoForceSphere( cent_, origin_, scale_, shader_ ) = ccall((:CG_DrawNoForceSphere, lib), Void, ( Ptr{centity_t}, vec3_t, Float32, Int32,  ), cent_, origin_, scale_, shader_ );
CG_HandleAppendedSkin( modelName_ ) = ccall((:CG_HandleAppendedSkin, lib), Int32, ( Ptr{Char},  ), modelName_ );
CG_CacheG2AnimInfo( modelName_ ) = ccall((:CG_CacheG2AnimInfo, lib), Void, ( Ptr{Char},  ), modelName_ );
CG_RegisterVehicleAssets( pVeh_ ) = ccall((:CG_RegisterVehicleAssets, lib), Void, ( Ptr{Vehicle_t},  ), pVeh_ );
CG_G2AnimEntModelLoad( cent_ ) = ccall((:CG_G2AnimEntModelLoad, lib), Void, ( Ptr{centity_t},  ), cent_ );
CG_CreateSurfaceDebris( cent_, surfNum_, fxID_, throwPart_ ) = ccall((:CG_CreateSurfaceDebris, lib), Void, ( Ptr{centity_t}, Int32, Int32, qboolean,  ), cent_, surfNum_, fxID_, throwPart_ );
CG_CreateSurfaceSmoke( cent_, shipSurf_, fxID_ ) = ccall((:CG_CreateSurfaceSmoke, lib), Void, ( Ptr{centity_t}, Int32, Int32,  ), cent_, shipSurf_, fxID_ );
CG_VehicleShouldDrawShields( vehCent_ ) = ccall((:CG_VehicleShouldDrawShields, lib), qboolean, ( Ptr{centity_t},  ), vehCent_ );
CG_VehicleAttachDroidUnit( droidCent_, legs_ ) = ccall((:CG_VehicleAttachDroidUnit, lib), qboolean, ( Ptr{centity_t}, Ptr{refEntity_t},  ), droidCent_, legs_ );
CG_G2Animated( cent_ ) = ccall((:CG_G2Animated, lib), Void, ( Ptr{centity_t},  ), cent_ );
CG_ForceFPLSPlayerModel( cent_, ci_ ) = ccall((:CG_ForceFPLSPlayerModel, lib), Void, ( Ptr{centity_t}, Ptr{clientInfo_t},  ), cent_, ci_ );
CG_CreateNPCClient( ci_ ) = ccall((:CG_CreateNPCClient, lib), Void, ( Ptr{Ptr{clientInfo_t}},  ), ci_ );
CG_DestroyNPCClient( ci_ ) = ccall((:CG_DestroyNPCClient, lib), Void, ( Ptr{Ptr{clientInfo_t}},  ), ci_ );
CG_ForceElectrocution( cent_, origin_, tempAngles_, shader_, alwaysDo_ ) = ccall((:CG_ForceElectrocution, lib), Void, ( Ptr{centity_t}, vec3_t, vec3_t, qhandle_t, qboolean,  ), cent_, origin_, tempAngles_, shader_, alwaysDo_ );
CG_InitJetpackGhoul2() = ccall((:CG_InitJetpackGhoul2, lib), Void, (),  );
CG_CleanJetpackGhoul2() = ccall((:CG_CleanJetpackGhoul2, lib), Void, (),  );
CG_VehicleHeatEffect( org_, cent_ ) = ccall((:CG_VehicleHeatEffect, lib), Void, ( vec3_t, Ptr{centity_t},  ), org_, cent_ );
CG_VehicleEffects( cent_ ) = ccall((:CG_VehicleEffects, lib), Void, ( Ptr{centity_t},  ), cent_ );
CG_RadiusForCent( cent_ ) = ccall((:CG_RadiusForCent, lib), Float32, ( Ptr{centity_t},  ), cent_ );
CG_CheckThirdPersonAlpha( cent_, legs_ ) = ccall((:CG_CheckThirdPersonAlpha, lib), Void, ( Ptr{centity_t}, Ptr{refEntity_t},  ), cent_, legs_ );
CG_Player( cent_ ) = ccall((:CG_Player, lib), Void, ( Ptr{centity_t},  ), cent_ );
CG_ResetPlayerEntity( cent_ ) = ccall((:CG_ResetPlayerEntity, lib), Void, ( Ptr{centity_t},  ), cent_ );
