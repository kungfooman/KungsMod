qboolean NAV_CheckNodeFailedForEnt( gentity_t *ent, int nodeNum );
void NPC_ClearBlocked( gentity_t *self );
void NPC_SetBlocked( gentity_t *self, gentity_t *blocker );
int NAVNEW_ClearPathBetweenPoints( vec3_t start, vec3_t end, vec3_t mins, vec3_t maxs, int ignore, int clipmask );
void NAVNEW_PushBlocker( gentity_t *self, gentity_t *blocker, vec3_t right, qboolean setBlockedInfo );
qboolean NAVNEW_DanceWithBlocker( gentity_t *self, gentity_t *blocker, vec3_t movedir, vec3_t right );
qboolean NAVNEW_SidestepBlocker( gentity_t *self, gentity_t *blocker, vec3_t blocked_dir, float blocked_dist, vec3_t movedir, vec3_t right );
qboolean NAVNEW_Bypass( gentity_t *self, gentity_t *blocker, vec3_t blocked_dir, float blocked_dist, vec3_t movedir, qboolean setBlockedInfo );
qboolean NAVNEW_CheckDoubleBlock( gentity_t *self, gentity_t *blocker, vec3_t blocked_dir );
qboolean NAVNEW_ResolveEntityCollision( gentity_t *self, gentity_t *blocker, vec3_t movedir, vec3_t pathDir, qboolean setBlockedInfo );
qboolean NAVNEW_AvoidCollision( gentity_t *self, gentity_t *goal, navInfo_t *info, qboolean setBlockedInfo, int blockedMovesLimit );
qboolean NAVNEW_TestNodeConnectionBlocked( int wp1, int wp2, gentity_t *ignoreEnt, int goalEntNum, qboolean checkWorld, qboolean checkEnts );
int NAVNEW_MoveToGoal( gentity_t *self, navInfo_t *info );
