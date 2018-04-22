CG_TestModel_f() = ccall((:CG_TestModel_f, lib), Void, (),  );
CG_TestGun_f() = ccall((:CG_TestGun_f, lib), Void, (),  );
CG_TestModelNextFrame_f() = ccall((:CG_TestModelNextFrame_f, lib), Void, (),  );
CG_TestModelPrevFrame_f() = ccall((:CG_TestModelPrevFrame_f, lib), Void, (),  );
CG_TestModelNextSkin_f() = ccall((:CG_TestModelNextSkin_f, lib), Void, (),  );
CG_TestModelPrevSkin_f() = ccall((:CG_TestModelPrevSkin_f, lib), Void, (),  );
CG_AddTestModel() = ccall((:CG_AddTestModel, lib), Void, (),  );
CG_CalcVrect() = ccall((:CG_CalcVrect, lib), Void, (),  );
CG_StepOffset() = ccall((:CG_StepOffset, lib), Void, (),  );
CG_CalcIdealThirdPersonViewTarget() = ccall((:CG_CalcIdealThirdPersonViewTarget, lib), Void, (),  );
CG_CalcIdealThirdPersonViewLocation() = ccall((:CG_CalcIdealThirdPersonViewLocation, lib), Void, (),  );
CG_ResetThirdPersonViewDamp() = ccall((:CG_ResetThirdPersonViewDamp, lib), Void, (),  );
CG_UpdateThirdPersonTargetDamp() = ccall((:CG_UpdateThirdPersonTargetDamp, lib), Void, (),  );
CG_UpdateThirdPersonCameraDamp() = ccall((:CG_UpdateThirdPersonCameraDamp, lib), Void, (),  );
CG_OffsetThirdPersonView() = ccall((:CG_OffsetThirdPersonView, lib), Void, (),  );
CG_GetVehicleCamPos( camPos_ ) = ccall((:CG_GetVehicleCamPos, lib), Void, ( vec3_t,  ), camPos_ );
CG_OffsetFirstPersonView() = ccall((:CG_OffsetFirstPersonView, lib), Void, (),  );
CG_OffsetFighterView() = ccall((:CG_OffsetFighterView, lib), Void, (),  );
CG_CalcFov() = ccall((:CG_CalcFov, lib), Int32, (),  );
CG_DamageBlendBlob() = ccall((:CG_DamageBlendBlob, lib), Void, (),  );
CG_ThirdPersonActionCam() = ccall((:CG_ThirdPersonActionCam, lib), qboolean, (),  );
CG_CheckPassengerTurretView() = ccall((:CG_CheckPassengerTurretView, lib), qboolean, (),  );
CG_CalcViewValues() = ccall((:CG_CalcViewValues, lib), Int32, (),  );
CG_PowerupTimerSounds() = ccall((:CG_PowerupTimerSounds, lib), Void, (),  );
CG_DrawSkyBoxPortal( cstr_ ) = ccall((:CG_DrawSkyBoxPortal, lib), Void, ( Ptr{Char},  ), cstr_ );
CG_AddBufferedSound( sfx_ ) = ccall((:CG_AddBufferedSound, lib), Void, ( sfxHandle_t,  ), sfx_ );
CG_PlayBufferedSounds() = ccall((:CG_PlayBufferedSounds, lib), Void, (),  );
CG_UpdateSoundTrackers() = ccall((:CG_UpdateSoundTrackers, lib), Void, (),  );
CG_SE_UpdateShake( origin_, angles_ ) = ccall((:CG_SE_UpdateShake, lib), Void, ( vec3_t, vec3_t,  ), origin_, angles_ );
CG_SE_UpdateMusic() = ccall((:CG_SE_UpdateMusic, lib), Void, (),  );
CG_CalcScreenEffects() = ccall((:CG_CalcScreenEffects, lib), Void, (),  );
CGCam_Shake( intensity_, duration_ ) = ccall((:CGCam_Shake, lib), Void, ( Float32, Int32,  ), intensity_, duration_ );
CG_DoCameraShake( origin_, intensity_, radius_, time_ ) = ccall((:CG_DoCameraShake, lib), Void, ( vec3_t, Float32, Int32, Int32,  ), origin_, intensity_, radius_, time_ );
CGCam_SetMusicMult( multiplier_, duration_ ) = ccall((:CGCam_SetMusicMult, lib), Void, ( Float32, Int32,  ), multiplier_, duration_ );
CG_EmplacedView( angles_ ) = ccall((:CG_EmplacedView, lib), Void, ( vec3_t,  ), angles_ );
CG_AddRefentForAutoMap( cent_ ) = ccall((:CG_AddRefentForAutoMap, lib), Void, ( Ptr{centity_t},  ), cent_ );
CG_AddRadarAutomapEnts() = ccall((:CG_AddRadarAutomapEnts, lib), Void, (),  );
CG_DrawAutoMap() = ccall((:CG_DrawAutoMap, lib), Void, (),  );
CG_SetupFrustum() = ccall((:CG_SetupFrustum, lib), Void, (),  );
CG_CullPoint( pt_ ) = ccall((:CG_CullPoint, lib), qboolean, ( vec3_t,  ), pt_ );
CG_CullPointAndRadius( pt_, radius_ ) = ccall((:CG_CullPointAndRadius, lib), qboolean, ( vec3_t, Float32,  ), pt_, radius_ );
CG_DrawActiveFrame( serverTime_, stereoView_, demoPlayback_ ) = ccall((:CG_DrawActiveFrame, lib), Void, ( Int32, stereoFrame_t, qboolean,  ), serverTime_, stereoView_, demoPlayback_ );
