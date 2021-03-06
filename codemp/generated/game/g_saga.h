void G_SiegeRegisterWeaponsAndHoldables( int team );
void SiegeSetCompleteData( int team );
void InitSiegeMode();
void G_SiegeSetObjectiveComplete( int team, int objective, qboolean failIt );
qboolean G_SiegeGetCompletionStatus( int team, int objective );
void UseSiegeTarget( gentity_t *other, gentity_t *en, char *target );
void SiegeBroadcast_OBJECTIVECOMPLETE( int team, int client, int objective );
void SiegeBroadcast_ROUNDOVER( int winningteam, int winningclient );
void BroadcastObjectiveCompletion( int team, int objective, int final, int client );
void AddSiegeWinningTeamPoints( int team, int winner );
void SiegeClearSwitchData();
void SiegeDoTeamAssign();
void SiegeTeamSwitch( int winTeam, int winTime );
void SiegeRoundComplete( int winningteam, int winningclient );
void G_ValidateSiegeClassForTeam( gentity_t *ent, int team );
void SetTeamQuick( gentity_t *ent, int team, qboolean doBegin );
void SiegeRespawn( gentity_t *ent );
void SiegeBeginRound( int entNum );
CCALL void SiegeCheckTimers();
void SiegeObjectiveCompleted( int team, int objective, int final, int client );
void siegeTriggerUse( gentity_t *ent, gentity_t *other, gentity_t *activator );
void SP_info_siege_objective( gentity_t *ent );
void SiegeIconUse( gentity_t *ent, gentity_t *other, gentity_t *activator );
void SP_info_siege_radaricon( gentity_t *ent );
void decompTriggerUse( gentity_t *ent, gentity_t *other, gentity_t *activator );
void SP_info_siege_decomplete( gentity_t *ent );
void siegeEndUse( gentity_t *ent, gentity_t *other, gentity_t *activator );
void SP_target_siege_end( gentity_t *ent );
void SiegeItemRemoveOwner( gentity_t *ent, gentity_t *carrier );
static void SiegeItemRespawnEffect( gentity_t *ent, vec3_t newOrg );
static void SiegeItemRespawnOnOriginalSpot( gentity_t *ent, gentity_t *carrier );
void SiegeItemThink( gentity_t *ent );
void SiegeItemTouch( gentity_t *self, gentity_t *other, trace_t *trace );
void SiegeItemPain( gentity_t *self, gentity_t *attacker, int damage );
void SiegeItemDie( gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int meansOfDeath );
void SiegeItemUse( gentity_t *ent, gentity_t *other, gentity_t *activator );
void SP_misc_siege_item( gentity_t *ent );
void G_SiegeClientExData( gentity_t *msgTarg );
