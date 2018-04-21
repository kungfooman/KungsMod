NPC_ShadowTrooper_Precache() = ccall((:NPC_ShadowTrooper_Precache, lib), Void, (),  );
Jedi_ClearTimers( ent_ ) = ccall((:Jedi_ClearTimers, lib), Void, ( Ptr{gentity_t},  ), ent_ );
Jedi_PlayBlockedPushSound( self_ ) = ccall((:Jedi_PlayBlockedPushSound, lib), Void, ( Ptr{gentity_t},  ), self_ );
Jedi_PlayDeflectSound( self_ ) = ccall((:Jedi_PlayDeflectSound, lib), Void, ( Ptr{gentity_t},  ), self_ );
NPC_Jedi_PlayConfusionSound( self_ ) = ccall((:NPC_Jedi_PlayConfusionSound, lib), Void, ( Ptr{gentity_t},  ), self_ );
Jedi_CultistDestroyer( self_ ) = ccall((:Jedi_CultistDestroyer, lib), qboolean, ( Ptr{gentity_t},  ), self_ );
Boba_Precache() = ccall((:Boba_Precache, lib), Void, (),  );
Boba_ChangeWeapon( wp_ ) = ccall((:Boba_ChangeWeapon, lib), Void, ( Int32,  ), wp_ );
WP_ResistForcePush( self_, pusher_, noPenalty_ ) = ccall((:WP_ResistForcePush, lib), Void, ( Ptr{gentity_t}, Ptr{gentity_t}, qboolean,  ), self_, pusher_, noPenalty_ );
Boba_StopKnockdown( self_, pusher_, pushDir_, forceKnockdown_ ) = ccall((:Boba_StopKnockdown, lib), qboolean, ( Ptr{gentity_t}, Ptr{gentity_t}, vec3_t, qboolean,  ), self_, pusher_, pushDir_, forceKnockdown_ );
Boba_FlyStart( self_ ) = ccall((:Boba_FlyStart, lib), Void, ( Ptr{gentity_t},  ), self_ );
Boba_FlyStop( self_ ) = ccall((:Boba_FlyStop, lib), Void, ( Ptr{gentity_t},  ), self_ );
Boba_Flying( self_ ) = ccall((:Boba_Flying, lib), qboolean, ( Ptr{gentity_t},  ), self_ );
Boba_FireFlameThrower( self_ ) = ccall((:Boba_FireFlameThrower, lib), Void, ( Ptr{gentity_t},  ), self_ );
Boba_StartFlameThrower( self_ ) = ccall((:Boba_StartFlameThrower, lib), Void, ( Ptr{gentity_t},  ), self_ );
Boba_DoFlameThrower( self_ ) = ccall((:Boba_DoFlameThrower, lib), Void, ( Ptr{gentity_t},  ), self_ );
Boba_FireDecide() = ccall((:Boba_FireDecide, lib), Void, (),  );
Jedi_Cloak( self_ ) = ccall((:Jedi_Cloak, lib), Void, ( Ptr{gentity_t},  ), self_ );
Jedi_Decloak( self_ ) = ccall((:Jedi_Decloak, lib), Void, ( Ptr{gentity_t},  ), self_ );
Jedi_CheckCloak() = ccall((:Jedi_CheckCloak, lib), Void, (),  );
Jedi_Aggression( self_, change_ ) = ccall((:Jedi_Aggression, lib), Void, ( Ptr{gentity_t}, Int32,  ), self_, change_ );
Jedi_AggressionErosion( amt_ ) = ccall((:Jedi_AggressionErosion, lib), Void, ( Int32,  ), amt_ );
NPC_Jedi_RateNewEnemy( self_, enemy_ ) = ccall((:NPC_Jedi_RateNewEnemy, lib), Void, ( Ptr{gentity_t}, Ptr{gentity_t},  ), self_, enemy_ );
Jedi_Rage() = ccall((:Jedi_Rage, lib), Void, (),  );
Jedi_RageStop( self_ ) = ccall((:Jedi_RageStop, lib), Void, ( Ptr{gentity_t},  ), self_ );
Jedi_BattleTaunt() = ccall((:Jedi_BattleTaunt, lib), qboolean, (),  );
Jedi_ClearPathToSpot( dest_, impactEntNum_ ) = ccall((:Jedi_ClearPathToSpot, lib), qboolean, ( vec3_t, Int32,  ), dest_, impactEntNum_ );
NPC_MoveDirClear( forwardmove_, rightmove_, reset_ ) = ccall((:NPC_MoveDirClear, lib), qboolean, ( Int32, Int32, qboolean,  ), forwardmove_, rightmove_, reset_ );
Jedi_HoldPosition() = ccall((:Jedi_HoldPosition, lib), Void, (),  );
Jedi_Move( goal_, retreat_ ) = ccall((:Jedi_Move, lib), Void, ( Ptr{gentity_t}, qboolean,  ), goal_, retreat_ );
Jedi_Hunt() = ccall((:Jedi_Hunt, lib), qboolean, (),  );
Jedi_Retreat() = ccall((:Jedi_Retreat, lib), Void, (),  );
Jedi_Advance() = ccall((:Jedi_Advance, lib), Void, (),  );
Jedi_AdjustSaberAnimLevel( self_, newLevel_ ) = ccall((:Jedi_AdjustSaberAnimLevel, lib), Void, ( Ptr{gentity_t}, Int32,  ), self_, newLevel_ );
Jedi_CheckDecreaseSaberAnimLevel() = ccall((:Jedi_CheckDecreaseSaberAnimLevel, lib), Void, (),  );
Jedi_CombatDistance( enemy_dist_ ) = ccall((:Jedi_CombatDistance, lib), Void, ( Int32,  ), enemy_dist_ );
Jedi_Strafe( strafeTimeMin_, strafeTimeMax_, nextStrafeTimeMin_, nextStrafeTimeMax_, walking_ ) = ccall((:Jedi_Strafe, lib), qboolean, ( Int32, Int32, Int32, Int32, qboolean,  ), strafeTimeMin_, strafeTimeMax_, nextStrafeTimeMin_, nextStrafeTimeMax_, walking_ );
Jedi_CheckFlipEvasions( self_, rightdot_, zdiff_ ) = ccall((:Jedi_CheckFlipEvasions, lib), evasionType_t, ( Ptr{gentity_t}, Float32, Float32,  ), self_, rightdot_, zdiff_ );
Jedi_ReCalcParryTime( self_, evasionType_ ) = ccall((:Jedi_ReCalcParryTime, lib), Int32, ( Ptr{gentity_t}, evasionType_t,  ), self_, evasionType_ );
Jedi_QuickReactions( self_ ) = ccall((:Jedi_QuickReactions, lib), qboolean, ( Ptr{gentity_t},  ), self_ );
Jedi_SaberBusy( self_ ) = ccall((:Jedi_SaberBusy, lib), qboolean, ( Ptr{gentity_t},  ), self_ );
Jedi_SaberBlockGo( self_, cmd_, pHitloc_, phitDir_, incoming_, dist_ ) = ccall((:Jedi_SaberBlockGo, lib), evasionType_t, ( Ptr{gentity_t}, Ptr{usercmd_t}, vec3_t, vec3_t, Ptr{gentity_t}, Float32,  ), self_, cmd_, pHitloc_, phitDir_, incoming_, dist_ );
Jedi_SaberBlock( saberNum_, bladeNum_ ) = ccall((:Jedi_SaberBlock, lib), qboolean, ( Int32, Int32,  ), saberNum_, bladeNum_ );
Jedi_EvasionSaber( enemy_movedir_, enemy_dist_, enemy_dir_ ) = ccall((:Jedi_EvasionSaber, lib), Void, ( vec3_t, Float32, vec3_t,  ), enemy_movedir_, enemy_dist_, enemy_dir_ );
Jedi_FindEnemyInCone( self_, fallback_, minDot_ ) = ccall((:Jedi_FindEnemyInCone, lib), gentity_t, ( Ptr{gentity_t}, Ptr{gentity_t}, Float32,  ), self_, fallback_, minDot_ );
Jedi_SetEnemyInfo( enemy_dest_, enemy_dir_, enemy_dist_, enemy_movedir_, enemy_movespeed_, prediction_ ) = ccall((:Jedi_SetEnemyInfo, lib), Void, ( vec3_t, vec3_t, Ptr{Float32}, vec3_t, Ptr{Float32}, Int32,  ), enemy_dest_, enemy_dir_, enemy_dist_, enemy_movedir_, enemy_movespeed_, prediction_ );
Jedi_FaceEnemy( doPitch_ ) = ccall((:Jedi_FaceEnemy, lib), Void, ( qboolean,  ), doPitch_ );
Jedi_DebounceDirectionChanges() = ccall((:Jedi_DebounceDirectionChanges, lib), Void, (),  );
Jedi_TimersApply() = ccall((:Jedi_TimersApply, lib), Void, (),  );
Jedi_CombatTimersUpdate( enemy_dist_ ) = ccall((:Jedi_CombatTimersUpdate, lib), Void, ( Int32,  ), enemy_dist_ );
Jedi_CombatIdle( enemy_dist_ ) = ccall((:Jedi_CombatIdle, lib), Void, ( Int32,  ), enemy_dist_ );
Jedi_AttackDecide( enemy_dist_ ) = ccall((:Jedi_AttackDecide, lib), qboolean, ( Int32,  ), enemy_dist_ );
Jedi_Jump( dest_, goalEntNum_ ) = ccall((:Jedi_Jump, lib), qboolean, ( vec3_t, Int32,  ), dest_, goalEntNum_ );
Jedi_TryJump( goal_ ) = ccall((:Jedi_TryJump, lib), qboolean, ( Ptr{gentity_t},  ), goal_ );
Jedi_Jumping( goal_ ) = ccall((:Jedi_Jumping, lib), qboolean, ( Ptr{gentity_t},  ), goal_ );
Jedi_CheckEnemyMovement( enemy_dist_ ) = ccall((:Jedi_CheckEnemyMovement, lib), Void, ( Float32,  ), enemy_dist_ );
Jedi_CheckJumps() = ccall((:Jedi_CheckJumps, lib), Void, (),  );
Jedi_Combat() = ccall((:Jedi_Combat, lib), Void, (),  );
NPC_Jedi_Pain( self_, attacker_, damage_ ) = ccall((:NPC_Jedi_Pain, lib), Void, ( Ptr{gentity_t}, Ptr{gentity_t}, Int32,  ), self_, attacker_, damage_ );
Jedi_CheckDanger() = ccall((:Jedi_CheckDanger, lib), qboolean, (),  );
Jedi_CheckAmbushPlayer() = ccall((:Jedi_CheckAmbushPlayer, lib), qboolean, (),  );
Jedi_Ambush( self_ ) = ccall((:Jedi_Ambush, lib), Void, ( Ptr{gentity_t},  ), self_ );
Jedi_WaitingAmbush( self_ ) = ccall((:Jedi_WaitingAmbush, lib), qboolean, ( Ptr{gentity_t},  ), self_ );
Jedi_Patrol() = ccall((:Jedi_Patrol, lib), Void, (),  );
Jedi_CanPullBackSaber( self_ ) = ccall((:Jedi_CanPullBackSaber, lib), qboolean, ( Ptr{gentity_t},  ), self_ );
NPC_BSJedi_FollowLeader() = ccall((:NPC_BSJedi_FollowLeader, lib), Void, (),  );
Jedi_Attack() = ccall((:Jedi_Attack, lib), Void, (),  );
Jedi_InSpecialMove() = ccall((:Jedi_InSpecialMove, lib), qboolean, (),  );
NPC_BSJedi_Default() = ccall((:NPC_BSJedi_Default, lib), Void, (),  );
