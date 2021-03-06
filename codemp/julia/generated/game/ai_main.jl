BotStraightTPOrderCheck( ent_, ordernum_, bs_ ) = ccall((:BotStraightTPOrderCheck, lib), Void, ( Ptr{gentity_t}, Int32, Ptr{bot_state_t},  ), ent_, ordernum_, bs_ );
BotSelectWeapon( client_, weapon_ ) = ccall((:BotSelectWeapon, lib), Void, ( Int32, Int32,  ), client_, weapon_ );
BotReportStatus( bs_ ) = ccall((:BotReportStatus, lib), Void, ( Ptr{bot_state_t},  ), bs_ );
BotOrder( ent_, clientnum_, ordernum_ ) = ccall((:BotOrder, lib), Void, ( Ptr{gentity_t}, Int32, Int32,  ), ent_, clientnum_, ordernum_ );
BotMindTricked( botClient_, enemyClient_ ) = ccall((:BotMindTricked, lib), Int32, ( Int32, Int32,  ), botClient_, enemyClient_ );
#BotAI_Print( type_, fmt_, _ ) = ccall((:BotAI_Print, lib), Void, ( Int32, Ptr{Char}, ,  ), type_, fmt_, _ );
IsTeamplay() = ccall((:IsTeamplay, lib), Int32, (),  );
BotAI_GetClientState( clientNum_, state_ ) = ccall((:BotAI_GetClientState, lib), Int32, ( Int32, Ptr{playerState_t},  ), clientNum_, state_ );
BotAI_GetEntityState( entityNum_, state_ ) = ccall((:BotAI_GetEntityState, lib), Int32, ( Int32, Ptr{entityState_t},  ), entityNum_, state_ );
BotAI_GetSnapshotEntity( clientNum_, sequence_, state_ ) = ccall((:BotAI_GetSnapshotEntity, lib), Int32, ( Int32, Int32, Ptr{entityState_t},  ), clientNum_, sequence_, state_ );
BotEntityInfo( entnum_, info_ ) = ccall((:BotEntityInfo, lib), Void, ( Int32, Ptr{aas_entityinfo_t},  ), entnum_, info_ );
NumBots() = ccall((:NumBots, lib), Int32, (),  );
AngleDifference( ang1_, ang2_ ) = ccall((:AngleDifference, lib), Float32, ( Float32, Float32,  ), ang1_, ang2_ );
BotChangeViewAngle( angle_, ideal_angle_, speed_ ) = ccall((:BotChangeViewAngle, lib), Float32, ( Float32, Float32, Float32,  ), angle_, ideal_angle_, speed_ );
BotChangeViewAngles( bs_, thinktime_ ) = ccall((:BotChangeViewAngles, lib), Void, ( Ptr{bot_state_t}, Float32,  ), bs_, thinktime_ );
BotInputToUserCommand( bi_, ucmd_, delta_angles_, time_, useTime_ ) = ccall((:BotInputToUserCommand, lib), Void, ( Ptr{bot_input_t}, Ptr{usercmd_t}, Int32, Int32, Int32,  ), bi_, ucmd_, delta_angles_, time_, useTime_ );
BotUpdateInput( bs_, time_, elapsed_time_ ) = ccall((:BotUpdateInput, lib), Void, ( Ptr{bot_state_t}, Int32, Int32,  ), bs_, time_, elapsed_time_ );
BotAIRegularUpdate() = ccall((:BotAIRegularUpdate, lib), Void, (),  );
RemoveColorEscapeSequences( text_ ) = ccall((:RemoveColorEscapeSequences, lib), Void, ( Ptr{Char},  ), text_ );
BotAI( client_, thinktime_ ) = ccall((:BotAI, lib), Int32, ( Int32, Float32,  ), client_, thinktime_ );
BotScheduleBotThink() = ccall((:BotScheduleBotThink, lib), Void, (),  );
PlayersInGame() = ccall((:PlayersInGame, lib), Int32, (),  );
BotAISetupClient( client_, settings_, restart_ ) = ccall((:BotAISetupClient, lib), Int32, ( Int32, Ptr{bot_settings_s}, qboolean,  ), client_, settings_, restart_ );
BotAIShutdownClient( client_, restart_ ) = ccall((:BotAIShutdownClient, lib), Int32, ( Int32, qboolean,  ), client_, restart_ );
BotResetState( bs_ ) = ccall((:BotResetState, lib), Void, ( Ptr{bot_state_t},  ), bs_ );
BotAILoadMap( restart_ ) = ccall((:BotAILoadMap, lib), Int32, ( Int32,  ), restart_ );
OrgVisible( org1_, org2_, ignore_ ) = ccall((:OrgVisible, lib), Int32, ( vec3_t, vec3_t, Int32,  ), org1_, org2_, ignore_ );
WPOrgVisible( bot_, org1_, org2_, ignore_ ) = ccall((:WPOrgVisible, lib), Int32, ( Ptr{gentity_t}, vec3_t, vec3_t, Int32,  ), bot_, org1_, org2_, ignore_ );
OrgVisibleBox( org1_, mins_, maxs_, org2_, ignore_ ) = ccall((:OrgVisibleBox, lib), Int32, ( vec3_t, vec3_t, vec3_t, vec3_t, Int32,  ), org1_, mins_, maxs_, org2_, ignore_ );
CheckForFunc( org_, ignore_ ) = ccall((:CheckForFunc, lib), Int32, ( vec3_t, Int32,  ), org_, ignore_ );
BotPVSCheck( p1_, p2_ ) = ccall((:BotPVSCheck, lib), qboolean, ( vec3_t, vec3_t,  ), p1_, p2_ );
GetNearestVisibleWP( org_, ignore_ ) = ccall((:GetNearestVisibleWP, lib), Int32, ( vec3_t, Int32,  ), org_, ignore_ );
PassWayCheck( bs_, windex_ ) = ccall((:PassWayCheck, lib), Int32, ( Ptr{bot_state_t}, Int32,  ), bs_, windex_ );
TotalTrailDistance( start_, end_, bs_ ) = ccall((:TotalTrailDistance, lib), Float32, ( Int32, Int32, Ptr{bot_state_t},  ), start_, end_, bs_ );
CheckForShorterRoutes( bs_, newwpindex_ ) = ccall((:CheckForShorterRoutes, lib), Void, ( Ptr{bot_state_t}, Int32,  ), bs_, newwpindex_ );
WPConstantRoutine( bs_ ) = ccall((:WPConstantRoutine, lib), Void, ( Ptr{bot_state_t},  ), bs_ );
BotCTFGuardDuty( bs_ ) = ccall((:BotCTFGuardDuty, lib), qboolean, ( Ptr{bot_state_t},  ), bs_ );
WPTouchRoutine( bs_ ) = ccall((:WPTouchRoutine, lib), Void, ( Ptr{bot_state_t},  ), bs_ );
MoveTowardIdealAngles( bs_ ) = ccall((:MoveTowardIdealAngles, lib), Void, ( Ptr{bot_state_t},  ), bs_ );
BotTrace_Strafe( bs_, traceto_ ) = ccall((:BotTrace_Strafe, lib), Int32, ( Ptr{bot_state_t}, vec3_t,  ), bs_, traceto_ );
BotTrace_Jump( bs_, traceto_ ) = ccall((:BotTrace_Jump, lib), Int32, ( Ptr{bot_state_t}, vec3_t,  ), bs_, traceto_ );
BotTrace_Duck( bs_, traceto_ ) = ccall((:BotTrace_Duck, lib), Int32, ( Ptr{bot_state_t}, vec3_t,  ), bs_, traceto_ );
PassStandardEnemyChecks( bs_, en_ ) = ccall((:PassStandardEnemyChecks, lib), Int32, ( Ptr{bot_state_t}, Ptr{gentity_t},  ), bs_, en_ );
BotDamageNotification( bot_, attacker_ ) = ccall((:BotDamageNotification, lib), Void, ( Ptr{gclient_t}, Ptr{gentity_t},  ), bot_, attacker_ );
BotCanHear( bs_, en_, endist_ ) = ccall((:BotCanHear, lib), Int32, ( Ptr{bot_state_t}, Ptr{gentity_t}, Float32,  ), bs_, en_, endist_ );
UpdateEventTracker() = ccall((:UpdateEventTracker, lib), Void, (),  );
InFieldOfVision( viewangles_, fov_, angles_ ) = ccall((:InFieldOfVision, lib), Int32, ( vec3_t, Float32, vec3_t,  ), viewangles_, fov_, angles_ );
PassLovedOneCheck( bs_, ent_ ) = ccall((:PassLovedOneCheck, lib), Int32, ( Ptr{bot_state_t}, Ptr{gentity_t},  ), bs_, ent_ );
ScanForEnemies( bs_ ) = ccall((:ScanForEnemies, lib), Int32, ( Ptr{bot_state_t},  ), bs_ );
WaitingForNow( bs_, goalpos_ ) = ccall((:WaitingForNow, lib), Int32, ( Ptr{bot_state_t}, vec3_t,  ), bs_, goalpos_ );
BotGetWeaponRange( bs_ ) = ccall((:BotGetWeaponRange, lib), Int32, ( Ptr{bot_state_t},  ), bs_ );
BotIsAChickenWuss( bs_ ) = ccall((:BotIsAChickenWuss, lib), Int32, ( Ptr{bot_state_t},  ), bs_ );
GetNearestBadThing( bs_ ) = ccall((:GetNearestBadThing, lib), Ptr{gentity_t}, ( Ptr{bot_state_t},  ), bs_ );
BotDefendFlag( bs_ ) = ccall((:BotDefendFlag, lib), Int32, ( Ptr{bot_state_t},  ), bs_ );
BotGetEnemyFlag( bs_ ) = ccall((:BotGetEnemyFlag, lib), Int32, ( Ptr{bot_state_t},  ), bs_ );
BotGetFlagBack( bs_ ) = ccall((:BotGetFlagBack, lib), Int32, ( Ptr{bot_state_t},  ), bs_ );
BotGuardFlagCarrier( bs_ ) = ccall((:BotGuardFlagCarrier, lib), Int32, ( Ptr{bot_state_t},  ), bs_ );
BotGetFlagHome( bs_ ) = ccall((:BotGetFlagHome, lib), Int32, ( Ptr{bot_state_t},  ), bs_ );
GetNewFlagPoint( wp_, flagEnt_, team_ ) = ccall((:GetNewFlagPoint, lib), Void, ( Ptr{wpobject_t}, Ptr{gentity_t}, Int32,  ), wp_, flagEnt_, team_ );
CTFTakesPriority( bs_ ) = ccall((:CTFTakesPriority, lib), Int32, ( Ptr{bot_state_t},  ), bs_ );
EntityVisibleBox( org1_, mins_, maxs_, org2_, ignore_, ignore2_ ) = ccall((:EntityVisibleBox, lib), Int32, ( vec3_t, vec3_t, vec3_t, vec3_t, Int32, Int32,  ), org1_, mins_, maxs_, org2_, ignore_, ignore2_ );
Siege_TargetClosestObjective( bs_, flag_ ) = ccall((:Siege_TargetClosestObjective, lib), Int32, ( Ptr{bot_state_t}, Int32,  ), bs_, flag_ );
Siege_DefendFromAttackers( bs_ ) = ccall((:Siege_DefendFromAttackers, lib), Void, ( Ptr{bot_state_t},  ), bs_ );
Siege_CountDefenders( bs_ ) = ccall((:Siege_CountDefenders, lib), Int32, ( Ptr{bot_state_t},  ), bs_ );
Siege_CountTeammates( bs_ ) = ccall((:Siege_CountTeammates, lib), Int32, ( Ptr{bot_state_t},  ), bs_ );
SiegeTakesPriority( bs_ ) = ccall((:SiegeTakesPriority, lib), Int32, ( Ptr{bot_state_t},  ), bs_ );
JMTakesPriority( bs_ ) = ccall((:JMTakesPriority, lib), Int32, ( Ptr{bot_state_t},  ), bs_ );
BotHasAssociated( bs_, wp_ ) = ccall((:BotHasAssociated, lib), Int32, ( Ptr{bot_state_t}, Ptr{wpobject_t},  ), bs_, wp_ );
GetBestIdleGoal( bs_ ) = ccall((:GetBestIdleGoal, lib), Int32, ( Ptr{bot_state_t},  ), bs_ );
GetIdealDestination( bs_ ) = ccall((:GetIdealDestination, lib), Void, ( Ptr{bot_state_t},  ), bs_ );
CommanderBotCTFAI( bs_ ) = ccall((:CommanderBotCTFAI, lib), Void, ( Ptr{bot_state_t},  ), bs_ );
CommanderBotSiegeAI( bs_ ) = ccall((:CommanderBotSiegeAI, lib), Void, ( Ptr{bot_state_t},  ), bs_ );
BotDoTeamplayAI( bs_ ) = ccall((:BotDoTeamplayAI, lib), Void, ( Ptr{bot_state_t},  ), bs_ );
CommanderBotTeamplayAI( bs_ ) = ccall((:CommanderBotTeamplayAI, lib), Void, ( Ptr{bot_state_t},  ), bs_ );
CommanderBotAI( bs_ ) = ccall((:CommanderBotAI, lib), Void, ( Ptr{bot_state_t},  ), bs_ );
MeleeCombatHandling( bs_ ) = ccall((:MeleeCombatHandling, lib), Void, ( Ptr{bot_state_t},  ), bs_ );
SaberCombatHandling( bs_ ) = ccall((:SaberCombatHandling, lib), Void, ( Ptr{bot_state_t},  ), bs_ );
BotWeaponCanLead( bs_ ) = ccall((:BotWeaponCanLead, lib), Float32, ( Ptr{bot_state_t},  ), bs_ );
BotAimLeading( bs_, headlevel_, leadAmount_ ) = ccall((:BotAimLeading, lib), Void, ( Ptr{bot_state_t}, vec3_t, Float32,  ), bs_, headlevel_, leadAmount_ );
BotAimOffsetGoalAngles( bs_ ) = ccall((:BotAimOffsetGoalAngles, lib), Void, ( Ptr{bot_state_t},  ), bs_ );
ShouldSecondaryFire( bs_ ) = ccall((:ShouldSecondaryFire, lib), Int32, ( Ptr{bot_state_t},  ), bs_ );
CombatBotAI( bs_, thinktime_ ) = ccall((:CombatBotAI, lib), Int32, ( Ptr{bot_state_t}, Float32,  ), bs_, thinktime_ );
BotFallbackNavigation( bs_ ) = ccall((:BotFallbackNavigation, lib), Int32, ( Ptr{bot_state_t},  ), bs_ );
BotTryAnotherWeapon( bs_ ) = ccall((:BotTryAnotherWeapon, lib), Int32, ( Ptr{bot_state_t},  ), bs_ );
BotWeaponSelectable( bs_, weapon_ ) = ccall((:BotWeaponSelectable, lib), qboolean, ( Ptr{bot_state_t}, Int32,  ), bs_, weapon_ );
BotSelectIdealWeapon( bs_ ) = ccall((:BotSelectIdealWeapon, lib), Int32, ( Ptr{bot_state_t},  ), bs_ );
BotSelectChoiceWeapon( bs_, weapon_, doselection_ ) = ccall((:BotSelectChoiceWeapon, lib), Int32, ( Ptr{bot_state_t}, Int32, Int32,  ), bs_, weapon_, doselection_ );
BotSelectMelee( bs_ ) = ccall((:BotSelectMelee, lib), Int32, ( Ptr{bot_state_t},  ), bs_ );
GetLoveLevel( bs_, love_ ) = ccall((:GetLoveLevel, lib), Int32, ( Ptr{bot_state_t}, Ptr{bot_state_t},  ), bs_, love_ );
BotLovedOneDied( bs_, loved_, lovelevel_ ) = ccall((:BotLovedOneDied, lib), Void, ( Ptr{bot_state_t}, Ptr{bot_state_t}, Int32,  ), bs_, loved_, lovelevel_ );
BotDeathNotify( bs_ ) = ccall((:BotDeathNotify, lib), Void, ( Ptr{bot_state_t},  ), bs_ );
StrafeTracing( bs_ ) = ccall((:StrafeTracing, lib), Void, ( Ptr{bot_state_t},  ), bs_ );
PrimFiring( bs_ ) = ccall((:PrimFiring, lib), Int32, ( Ptr{bot_state_t},  ), bs_ );
KeepPrimFromFiring( bs_ ) = ccall((:KeepPrimFromFiring, lib), Int32, ( Ptr{bot_state_t},  ), bs_ );
AltFiring( bs_ ) = ccall((:AltFiring, lib), Int32, ( Ptr{bot_state_t},  ), bs_ );
KeepAltFromFiring( bs_ ) = ccall((:KeepAltFromFiring, lib), Int32, ( Ptr{bot_state_t},  ), bs_ );
CheckForFriendInLOF( bs_ ) = ccall((:CheckForFriendInLOF, lib), Ptr{gentity_t}, ( Ptr{bot_state_t},  ), bs_ );
BotScanForLeader( bs_ ) = ccall((:BotScanForLeader, lib), Void, ( Ptr{bot_state_t},  ), bs_ );
BotReplyGreetings( bs_ ) = ccall((:BotReplyGreetings, lib), Void, ( Ptr{bot_state_t},  ), bs_ );
CTFFlagMovement( bs_ ) = ccall((:CTFFlagMovement, lib), Void, ( Ptr{bot_state_t},  ), bs_ );
BotCheckDetPacks( bs_ ) = ccall((:BotCheckDetPacks, lib), Void, ( Ptr{bot_state_t},  ), bs_ );
BotUseInventoryItem( bs_ ) = ccall((:BotUseInventoryItem, lib), Int32, ( Ptr{bot_state_t},  ), bs_ );
BotSurfaceNear( bs_ ) = ccall((:BotSurfaceNear, lib), Int32, ( Ptr{bot_state_t},  ), bs_ );
BotWeaponBlockable( weapon_ ) = ccall((:BotWeaponBlockable, lib), Int32, ( Int32,  ), weapon_ );
Bot_SetForcedMovement( bot_, forward_, right_, up_ ) = ccall((:Bot_SetForcedMovement, lib), Void, ( Int32, Int32, Int32, Int32,  ), bot_, forward_, right_, up_ );
StandardBotAI( bs_, thinktime_ ) = ccall((:StandardBotAI, lib), Void, ( Ptr{bot_state_t}, Float32,  ), bs_, thinktime_ );
BotAIStartFrame( time_ ) = ccall((:BotAIStartFrame, lib), Int32, ( Int32,  ), time_ );
BotAISetup( restart_ ) = ccall((:BotAISetup, lib), Int32, ( Int32,  ), restart_ );
BotAIShutdown( restart_ ) = ccall((:BotAIShutdown, lib), Int32, ( Int32,  ), restart_ );
