CG_ParseScores() = ccall((:CG_ParseScores, lib), Void, (),  );
CG_ParseTeamInfo() = ccall((:CG_ParseTeamInfo, lib), Void, (),  );
CG_ParseServerinfo() = ccall((:CG_ParseServerinfo, lib), Void, (),  );
CG_ParseWarmup() = ccall((:CG_ParseWarmup, lib), Void, (),  );
CG_SetConfigValues() = ccall((:CG_SetConfigValues, lib), Void, (),  );
CG_ShaderStateChanged() = ccall((:CG_ShaderStateChanged, lib), Void, (),  );
GetCustomSoundForType( setType_, index_ ) = ccall((:GetCustomSoundForType, lib), Char, ( Int32, Int32,  ), setType_, index_ );
SetCustomSoundForType( ci_, setType_, index_, sfx_ ) = ccall((:SetCustomSoundForType, lib), Void, ( Ptr{clientInfo_t}, Int32, Int32, sfxHandle_t,  ), ci_, setType_, index_, sfx_ );
CG_RegisterCustomSounds( ci_, setType_, psDir_ ) = ccall((:CG_RegisterCustomSounds, lib), Void, ( Ptr{clientInfo_t}, Int32, Ptr{Char},  ), ci_, setType_, psDir_ );
CG_PrecacheNPCSounds( str_ ) = ccall((:CG_PrecacheNPCSounds, lib), Void, ( Ptr{Char},  ), str_ );
CG_HandleNPCSounds( cent_ ) = ccall((:CG_HandleNPCSounds, lib), Void, ( Ptr{centity_t},  ), cent_ );
SetDuelistHealthsFromConfigString( str_ ) = ccall((:SetDuelistHealthsFromConfigString, lib), Void, ( Ptr{Char},  ), str_ );
CG_ConfigStringModified() = ccall((:CG_ConfigStringModified, lib), Void, (),  );
CG_KillCEntityG2( entNum_ ) = ccall((:CG_KillCEntityG2, lib), Void, ( Int32,  ), entNum_ );
CG_KillCEntityInstances() = ccall((:CG_KillCEntityInstances, lib), Void, (),  );
CG_MapRestart() = ccall((:CG_MapRestart, lib), Void, (),  );
CG_RemoveChatEscapeChar( text_ ) = ccall((:CG_RemoveChatEscapeChar, lib), Void, ( Ptr{Char},  ), text_ );
CG_CheckSVStringEdRef( buf_, str_ ) = ccall((:CG_CheckSVStringEdRef, lib), Void, ( Ptr{Char}, Ptr{Char},  ), buf_, str_ );
CG_BodyQueueCopy( cent_, clientNum_, knownWeapon_ ) = ccall((:CG_BodyQueueCopy, lib), Void, ( Ptr{centity_t}, Int32, Int32,  ), cent_, clientNum_, knownWeapon_ );
CG_SiegeBriefingDisplay_f() = ccall((:CG_SiegeBriefingDisplay_f, lib), Void, (),  );
CG_SiegeClassSelect_f() = ccall((:CG_SiegeClassSelect_f, lib), Void, (),  );
CG_SiegeProfileMenu_f() = ccall((:CG_SiegeProfileMenu_f, lib), Void, (),  );
CG_NewForceRank_f() = ccall((:CG_NewForceRank_f, lib), Void, (),  );
CG_KillGhoul2_f() = ccall((:CG_KillGhoul2_f, lib), Void, (),  );
CG_KillLoopSounds_f() = ccall((:CG_KillLoopSounds_f, lib), Void, (),  );
CG_RestoreClientGhoul_f() = ccall((:CG_RestoreClientGhoul_f, lib), Void, (),  );
CG_CenterPrint_f() = ccall((:CG_CenterPrint_f, lib), Void, (),  );
CG_CenterPrintSE_f() = ccall((:CG_CenterPrintSE_f, lib), Void, (),  );
CG_Print_f() = ccall((:CG_Print_f, lib), Void, (),  );
CG_Chat_f() = ccall((:CG_Chat_f, lib), Void, (),  );
CG_RemapShader_f() = ccall((:CG_RemapShader_f, lib), Void, (),  );
CG_ClientLevelShot_f() = ccall((:CG_ClientLevelShot_f, lib), Void, (),  );
svcmdcmp_cg( a_, b_ ) = ccall((:svcmdcmp_cg, lib), Int32, ( Ptr{Void}, Ptr{Void},  ), a_, b_ );
CG_ServerCommand() = ccall((:CG_ServerCommand, lib), Void, (),  );
CG_ExecuteNewServerCommands( latestSequence_ ) = ccall((:CG_ExecuteNewServerCommands, lib), Void, ( Int32,  ), latestSequence_ );
