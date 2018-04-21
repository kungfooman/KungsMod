BG_FighterUpdate( pVeh_, pUcmd_, trMins_, trMaxs_, gravity_, trace_t_, start_, lmins_, lmaxs_, end_, passEntityNum_, contentMask_ ) = ccall((:BG_FighterUpdate, lib), qboolean, ( Ptr{Vehicle_t}, Ptr{usercmd_t}, vec3_t, vec3_t, Float32, Ptr{Void}, vec3_t, vec3_t, vec3_t, vec3_t, Int32, Int32,  ), pVeh_, pUcmd_, trMins_, trMaxs_, gravity_, trace_t_, start_, lmins_, lmaxs_, end_, passEntityNum_, contentMask_ );
Update( pVeh_, pUcmd_ ) = ccall((:Update, lib), qboolean, ( Ptr{Vehicle_t}, Ptr{usercmd_t},  ), pVeh_, pUcmd_ );
Board( pVeh_, pEnt_ ) = ccall((:Board, lib), qboolean, ( Ptr{Vehicle_t}, Ptr{bgEntity_t},  ), pVeh_, pEnt_ );
Eject( pVeh_, pEnt_, forceEject_ ) = ccall((:Eject, lib), qboolean, ( Ptr{Vehicle_t}, Ptr{bgEntity_t}, qboolean,  ), pVeh_, pEnt_, forceEject_ );
PredictedAngularDecrement( scale_, timeMod_, originalAngle_ ) = ccall((:PredictedAngularDecrement, lib), Float32, ( Float32, Float32, Float32,  ), scale_, timeMod_, originalAngle_ );
FighterIsInSpace( gParent_ ) = ccall((:FighterIsInSpace, lib), qboolean, ( Ptr{gentity_t},  ), gParent_ );
FighterOverValidLandingSurface( pVeh_ ) = ccall((:FighterOverValidLandingSurface, lib), qboolean, ( Ptr{Vehicle_t},  ), pVeh_ );
FighterIsLanded( pVeh_, parentPS_ ) = ccall((:FighterIsLanded, lib), qboolean, ( Ptr{Vehicle_t}, Ptr{playerState_t},  ), pVeh_, parentPS_ );
FighterIsLanding( pVeh_, parentPS_ ) = ccall((:FighterIsLanding, lib), qboolean, ( Ptr{Vehicle_t}, Ptr{playerState_t},  ), pVeh_, parentPS_ );
FighterIsLaunching( pVeh_, parentPS_ ) = ccall((:FighterIsLaunching, lib), qboolean, ( Ptr{Vehicle_t}, Ptr{playerState_t},  ), pVeh_, parentPS_ );
FighterSuspended( pVeh_, parentPS_ ) = ccall((:FighterSuspended, lib), qboolean, ( Ptr{Vehicle_t}, Ptr{playerState_t},  ), pVeh_, parentPS_ );
ProcessMoveCommands( pVeh_ ) = ccall((:ProcessMoveCommands, lib), Void, ( Ptr{Vehicle_t},  ), pVeh_ );
FighterWingMalfunctionCheck( pVeh_, parentPS_ ) = ccall((:FighterWingMalfunctionCheck, lib), Void, ( Ptr{Vehicle_t}, Ptr{playerState_t},  ), pVeh_, parentPS_ );
FighterNoseMalfunctionCheck( pVeh_, parentPS_ ) = ccall((:FighterNoseMalfunctionCheck, lib), Void, ( Ptr{Vehicle_t}, Ptr{playerState_t},  ), pVeh_, parentPS_ );
FighterDamageRoutine( pVeh_, parent_, parentPS_, riderPS_, isDead_ ) = ccall((:FighterDamageRoutine, lib), Void, ( Ptr{Vehicle_t}, Ptr{bgEntity_t}, Ptr{playerState_t}, Ptr{playerState_t}, qboolean,  ), pVeh_, parent_, parentPS_, riderPS_, isDead_ );
FighterRollAdjust( pVeh_, riderPS_, parentPS_ ) = ccall((:FighterRollAdjust, lib), Void, ( Ptr{Vehicle_t}, Ptr{playerState_t}, Ptr{playerState_t},  ), pVeh_, riderPS_, parentPS_ );
FighterYawAdjust( pVeh_, riderPS_, parentPS_ ) = ccall((:FighterYawAdjust, lib), Void, ( Ptr{Vehicle_t}, Ptr{playerState_t}, Ptr{playerState_t},  ), pVeh_, riderPS_, parentPS_ );
FighterPitchAdjust( pVeh_, riderPS_, parentPS_ ) = ccall((:FighterPitchAdjust, lib), Void, ( Ptr{Vehicle_t}, Ptr{playerState_t}, Ptr{playerState_t},  ), pVeh_, riderPS_, parentPS_ );
FighterYawAdjust( pVeh_, riderPS_, parentPS_ ) = ccall((:FighterYawAdjust, lib), Void, ( Ptr{Vehicle_t}, Ptr{playerState_t}, Ptr{playerState_t},  ), pVeh_, riderPS_, parentPS_ );
FighterPitchAdjust( pVeh_, riderPS_, parentPS_ ) = ccall((:FighterPitchAdjust, lib), Void, ( Ptr{Vehicle_t}, Ptr{playerState_t}, Ptr{playerState_t},  ), pVeh_, riderPS_, parentPS_ );
FighterPitchClamp( pVeh_, riderPS_, parentPS_, curTime_ ) = ccall((:FighterPitchClamp, lib), Void, ( Ptr{Vehicle_t}, Ptr{playerState_t}, Ptr{playerState_t}, Int32,  ), pVeh_, riderPS_, parentPS_, curTime_ );
ProcessOrientCommands( pVeh_ ) = ccall((:ProcessOrientCommands, lib), Void, ( Ptr{Vehicle_t},  ), pVeh_ );
AnimateVehicle( pVeh_ ) = ccall((:AnimateVehicle, lib), Void, ( Ptr{Vehicle_t},  ), pVeh_ );
AnimateRiders( pVeh_ ) = ccall((:AnimateRiders, lib), Void, ( Ptr{Vehicle_t},  ), pVeh_ );
G_SetFighterVehicleFunctions( pVehInfo_ ) = ccall((:G_SetFighterVehicleFunctions, lib), Void, ( Ptr{vehicleInfo_t},  ), pVehInfo_ );
G_CreateFighterNPC( pVeh_, strType_ ) = ccall((:G_CreateFighterNPC, lib), Void, ( Ptr{Ptr{Vehicle_t}}, Ptr{Char},  ), pVeh_, strType_ );
