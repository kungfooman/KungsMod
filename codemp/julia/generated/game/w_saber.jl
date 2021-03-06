RandFloat( min_, max_ ) = ccall((:RandFloat, lib), Float32, ( Float32, Float32,  ), min_, max_ );
G_DebugBoxLines( mins_, maxs_, duration_ ) = ccall((:G_DebugBoxLines, lib), Void, ( vec3_t, vec3_t, Int32,  ), mins_, maxs_, duration_ );
G_CanBeEnemy( self_, enemy_ ) = ccall((:G_CanBeEnemy, lib), qboolean, ( Ptr{gentity_t}, Ptr{gentity_t},  ), self_, enemy_ );
G_SaberAttackPower( ent_, attacking_ ) = ccall((:G_SaberAttackPower, lib), Int32, ( Ptr{gentity_t}, qboolean,  ), ent_, attacking_ );
WP_DeactivateSaber( self_, clearLength_ ) = ccall((:WP_DeactivateSaber, lib), Void, ( Ptr{gentity_t}, qboolean,  ), self_, clearLength_ );
WP_ActivateSaber( self_ ) = ccall((:WP_ActivateSaber, lib), Void, ( Ptr{gentity_t},  ), self_ );
SaberUpdateSelf( ent_ ) = ccall((:SaberUpdateSelf, lib), Void, ( Ptr{gentity_t},  ), ent_ );
SaberGotHit( self_, other_, trace_ ) = ccall((:SaberGotHit, lib), Void, ( Ptr{gentity_t}, Ptr{gentity_t}, Ptr{trace_t},  ), self_, other_, trace_ );
SetSaberBoxSize( saberent_ ) = ccall((:SetSaberBoxSize, lib), Void, ( Ptr{gentity_t},  ), saberent_ );
WP_SaberInitBladeData( ent_ ) = ccall((:WP_SaberInitBladeData, lib), Void, ( Ptr{gentity_t},  ), ent_ );
G_CheckLookTarget( ent_, lookAngles_, lookingSpeed_ ) = ccall((:G_CheckLookTarget, lib), qboolean, ( Ptr{gentity_t}, vec3_t, Ptr{Float32},  ), ent_, lookAngles_, lookingSpeed_ );
G_G2NPCAngles( ent_, legs_, angles_ ) = ccall((:G_G2NPCAngles, lib), Void, ( Ptr{gentity_t}, matrix3_t, vec3_t,  ), ent_, legs_, angles_ );
G_G2PlayerAngles( ent_, legs_, legsAngles_ ) = ccall((:G_G2PlayerAngles, lib), Void, ( Ptr{gentity_t}, matrix3_t, vec3_t,  ), ent_, legs_, legsAngles_ );
SaberAttacking( self_ ) = ccall((:SaberAttacking, lib), qboolean, ( Ptr{gentity_t},  ), self_ );
G_SaberLockAnim( attackerSaberStyle_, defenderSaberStyle_, topOrSide_, lockOrBreakOrSuperBreak_, winOrLose_ ) = ccall((:G_SaberLockAnim, lib), Int32, ( Int32, Int32, Int32, Int32, Int32,  ), attackerSaberStyle_, defenderSaberStyle_, topOrSide_, lockOrBreakOrSuperBreak_, winOrLose_ );
WP_SabersCheckLock2( attacker_, defender_, lockMode_ ) = ccall((:WP_SabersCheckLock2, lib), qboolean, ( Ptr{gentity_t}, Ptr{gentity_t}, sabersLockMode_t,  ), attacker_, defender_, lockMode_ );
WP_SabersCheckLock( ent1_, ent2_ ) = ccall((:WP_SabersCheckLock, lib), qboolean, ( Ptr{gentity_t}, Ptr{gentity_t},  ), ent1_, ent2_ );
G_GetParryForBlock( block_ ) = ccall((:G_GetParryForBlock, lib), Int32, ( Int32,  ), block_ );
WP_GetSaberDeflectionAngle( attacker_, defender_, saberHitFraction_ ) = ccall((:WP_GetSaberDeflectionAngle, lib), qboolean, ( Ptr{gentity_t}, Ptr{gentity_t}, Float32,  ), attacker_, defender_, saberHitFraction_ );
G_KnockawayForParry( move_ ) = ccall((:G_KnockawayForParry, lib), Int32, ( Int32,  ), move_ );
G_GetAttackDamage( self_, minDmg_, maxDmg_, multPoint_ ) = ccall((:G_GetAttackDamage, lib), Int32, ( Ptr{gentity_t}, Int32, Int32, Float32,  ), self_, minDmg_, maxDmg_, multPoint_ );
G_GetAnimPoint( self_ ) = ccall((:G_GetAnimPoint, lib), Float32, ( Ptr{gentity_t},  ), self_ );
G_ClientIdleInWorld( ent_ ) = ccall((:G_ClientIdleInWorld, lib), qboolean, ( Ptr{gentity_t},  ), ent_ );
G_G2TraceCollide( tr_, lastValidStart_, lastValidEnd_, traceMins_, traceMaxs_ ) = ccall((:G_G2TraceCollide, lib), qboolean, ( Ptr{trace_t}, vec3_t, vec3_t, vec3_t, vec3_t,  ), tr_, lastValidStart_, lastValidEnd_, traceMins_, traceMaxs_ );
G_SaberInBackAttack( move_ ) = ccall((:G_SaberInBackAttack, lib), qboolean, ( Int32,  ), move_ );
G_BuildSaberFaces( base_, tip_, radius_, fwd_, right_, fNum_, fList_ ) = ccall((:G_BuildSaberFaces, lib), Void, ( vec3_t, vec3_t, Float32, vec3_t, vec3_t, Ptr{Int32}, Ptr{Ptr{saberFace_t}},  ), base_, tip_, radius_, fwd_, right_, fNum_, fList_ );
G_SabCol_CalcPlaneEq( x_, y_, z_, planeEq_ ) = ccall((:G_SabCol_CalcPlaneEq, lib), Void, ( vec3_t, vec3_t, vec3_t, Ptr{Float32},  ), x_, y_, z_, planeEq_ );
G_SabCol_PointRelativeToPlane( pos_, side_, planeEq_ ) = ccall((:G_SabCol_PointRelativeToPlane, lib), Int32, ( vec3_t, Ptr{Float32}, Ptr{Float32},  ), pos_, side_, planeEq_ );
G_SaberFaceCollisionCheck( fNum_, fList_, atkStart_, atkEnd_, atkMins_, atkMaxs_, impactPoint_ ) = ccall((:G_SaberFaceCollisionCheck, lib), qboolean, ( Int32, Ptr{saberFace_t}, vec3_t, vec3_t, vec3_t, vec3_t, vec3_t,  ), fNum_, fList_, atkStart_, atkEnd_, atkMins_, atkMaxs_, impactPoint_ );
G_SaberCollide( atk_, def_, atkStart_, atkEnd_, atkMins_, atkMaxs_, impactPoint_ ) = ccall((:G_SaberCollide, lib), qboolean, ( Ptr{gentity_t}, Ptr{gentity_t}, vec3_t, vec3_t, vec3_t, vec3_t, vec3_t,  ), atk_, def_, atkStart_, atkEnd_, atkMins_, atkMaxs_, impactPoint_ );
WP_SaberBladeLength( saber_ ) = ccall((:WP_SaberBladeLength, lib), Float32, ( Ptr{saberInfo_t},  ), saber_ );
WP_SaberLength( ent_ ) = ccall((:WP_SaberLength, lib), Float32, ( Ptr{gentity_t},  ), ent_ );
WPDEBUG_SaberColor( saberColor_ ) = ccall((:WPDEBUG_SaberColor, lib), Int32, ( saber_colors_t,  ), saberColor_ );
WP_SabersIntersect( ent1_, ent1SaberNum_, ent1BladeNum_, ent2_, checkDir_ ) = ccall((:WP_SabersIntersect, lib), qboolean, ( Ptr{gentity_t}, Int32, Int32, Ptr{gentity_t}, qboolean,  ), ent1_, ent1SaberNum_, ent1BladeNum_, ent2_, checkDir_ );
G_PowerLevelForSaberAnim( ent_, saberNum_, mySaberHit_ ) = ccall((:G_PowerLevelForSaberAnim, lib), Int32, ( Ptr{gentity_t}, Int32, qboolean,  ), ent_, saberNum_, mySaberHit_ );
WP_SaberClearDamage() = ccall((:WP_SaberClearDamage, lib), Void, (),  );
WP_SaberDamageAdd( trVictimEntityNum_, trDmgDir_, trDmgSpot_, trDmg_, doDismemberment_, knockBackFlags_ ) = ccall((:WP_SaberDamageAdd, lib), Void, ( Int32, vec3_t, vec3_t, Int32, qboolean, Int32,  ), trVictimEntityNum_, trDmgDir_, trDmgSpot_, trDmg_, doDismemberment_, knockBackFlags_ );
WP_SaberApplyDamage( self_ ) = ccall((:WP_SaberApplyDamage, lib), Void, ( Ptr{gentity_t},  ), self_ );
WP_SaberDoHit( self_, saberNum_, bladeNum_ ) = ccall((:WP_SaberDoHit, lib), Void, ( Ptr{gentity_t}, Int32, Int32,  ), self_, saberNum_, bladeNum_ );
WP_SaberRadiusDamage( ent_, point_, radius_, damage_, knockBack_ ) = ccall((:WP_SaberRadiusDamage, lib), Void, ( Ptr{gentity_t}, vec3_t, Float32, Int32, Float32,  ), ent_, point_, radius_, damage_, knockBack_ );
WP_SaberDoClash( self_, saberNum_, bladeNum_ ) = ccall((:WP_SaberDoClash, lib), Void, ( Ptr{gentity_t}, Int32, Int32,  ), self_, saberNum_, bladeNum_ );
WP_SaberBounceSound( ent_, saberNum_, bladeNum_ ) = ccall((:WP_SaberBounceSound, lib), Void, ( Ptr{gentity_t}, Int32, Int32,  ), ent_, saberNum_, bladeNum_ );
CheckSaberDamage( self_, rSaberNum_, rBladeNum_, saberStart_, saberEnd_, doInterpolate_, trMask_, extrapolate_ ) = ccall((:CheckSaberDamage, lib), qboolean, ( Ptr{gentity_t}, Int32, Int32, vec3_t, vec3_t, qboolean, Int32, qboolean,  ), self_, rSaberNum_, rBladeNum_, saberStart_, saberEnd_, doInterpolate_, trMask_, extrapolate_ );
G_SPSaberDamageTraceLerped( self_, saberNum_, bladeNum_, baseNew_, endNew_, clipmask_ ) = ccall((:G_SPSaberDamageTraceLerped, lib), Void, ( Ptr{gentity_t}, Int32, Int32, vec3_t, vec3_t, Int32,  ), self_, saberNum_, bladeNum_, baseNew_, endNew_, clipmask_ );
WP_SaberStartMissileBlockCheck( self_, ucmd_ ) = ccall((:WP_SaberStartMissileBlockCheck, lib), Void, ( Ptr{gentity_t}, Ptr{usercmd_t},  ), self_, ucmd_ );
CheckThrownSaberDamaged( saberent_, saberOwner_, ent_, dist_, returning_, noDCheck_ ) = ccall((:CheckThrownSaberDamaged, lib), qboolean, ( Ptr{gentity_t}, Ptr{gentity_t}, Ptr{gentity_t}, Int32, Int32, qboolean,  ), saberent_, saberOwner_, ent_, dist_, returning_, noDCheck_ );
saberCheckRadiusDamage( saberent_, returning_ ) = ccall((:saberCheckRadiusDamage, lib), Void, ( Ptr{gentity_t}, Int32,  ), saberent_, returning_ );
saberMoveBack( ent_, goingBack_ ) = ccall((:saberMoveBack, lib), Void, ( Ptr{gentity_t}, qboolean,  ), ent_, goingBack_ );
SaberBounceSound( self_, other_, trace_ ) = ccall((:SaberBounceSound, lib), Void, ( Ptr{gentity_t}, Ptr{gentity_t}, Ptr{trace_t},  ), self_, other_, trace_ );
DeadSaberThink( saberent_ ) = ccall((:DeadSaberThink, lib), Void, ( Ptr{gentity_t},  ), saberent_ );
MakeDeadSaber( ent_ ) = ccall((:MakeDeadSaber, lib), Void, ( Ptr{gentity_t},  ), ent_ );
DownedSaberThink( saberent_ ) = ccall((:DownedSaberThink, lib), Void, ( Ptr{gentity_t},  ), saberent_ );
saberReactivate( saberent_, saberOwner_ ) = ccall((:saberReactivate, lib), Void, ( Ptr{gentity_t}, Ptr{gentity_t},  ), saberent_, saberOwner_ );
saberKnockDown( saberent_, saberOwner_, other_ ) = ccall((:saberKnockDown, lib), Void, ( Ptr{gentity_t}, Ptr{gentity_t}, Ptr{gentity_t},  ), saberent_, saberOwner_, other_ );
WP_SaberRemoveG2Model( saberent_ ) = ccall((:WP_SaberRemoveG2Model, lib), Void, ( Ptr{gentity_t},  ), saberent_ );
WP_SaberAddG2Model( saberent_, saberModel_, saberSkin_ ) = ccall((:WP_SaberAddG2Model, lib), Void, ( Ptr{gentity_t}, Ptr{Char}, qhandle_t,  ), saberent_, saberModel_, saberSkin_ );
saberKnockOutOfHand( saberent_, saberOwner_, velocity_ ) = ccall((:saberKnockOutOfHand, lib), qboolean, ( Ptr{gentity_t}, Ptr{gentity_t}, vec3_t,  ), saberent_, saberOwner_, velocity_ );
saberCheckKnockdown_DuelLoss( saberent_, saberOwner_, other_ ) = ccall((:saberCheckKnockdown_DuelLoss, lib), qboolean, ( Ptr{gentity_t}, Ptr{gentity_t}, Ptr{gentity_t},  ), saberent_, saberOwner_, other_ );
saberCheckKnockdown_BrokenParry( saberent_, saberOwner_, other_ ) = ccall((:saberCheckKnockdown_BrokenParry, lib), qboolean, ( Ptr{gentity_t}, Ptr{gentity_t}, Ptr{gentity_t},  ), saberent_, saberOwner_, other_ );
saberCheckKnockdown_Smashed( saberent_, saberOwner_, other_, damage_ ) = ccall((:saberCheckKnockdown_Smashed, lib), qboolean, ( Ptr{gentity_t}, Ptr{gentity_t}, Ptr{gentity_t}, Int32,  ), saberent_, saberOwner_, other_, damage_ );
saberCheckKnockdown_Thrown( saberent_, saberOwner_, other_ ) = ccall((:saberCheckKnockdown_Thrown, lib), qboolean, ( Ptr{gentity_t}, Ptr{gentity_t}, Ptr{gentity_t},  ), saberent_, saberOwner_, other_ );
saberBackToOwner( saberent_ ) = ccall((:saberBackToOwner, lib), Void, ( Ptr{gentity_t},  ), saberent_ );
thrownSaberTouch( saberent_, other_, trace_ ) = ccall((:thrownSaberTouch, lib), Void, ( Ptr{gentity_t}, Ptr{gentity_t}, Ptr{trace_t},  ), saberent_, other_, trace_ );
saberFirstThrown( saberent_ ) = ccall((:saberFirstThrown, lib), Void, ( Ptr{gentity_t},  ), saberent_ );
UpdateClientRenderBolts( self_, renderOrigin_, renderAngles_ ) = ccall((:UpdateClientRenderBolts, lib), Void, ( Ptr{gentity_t}, vec3_t, vec3_t,  ), self_, renderOrigin_, renderAngles_ );
UpdateClientRenderinfo( self_, renderOrigin_, renderAngles_ ) = ccall((:UpdateClientRenderinfo, lib), Void, ( Ptr{gentity_t}, vec3_t, vec3_t,  ), self_, renderOrigin_, renderAngles_ );
G_KickDownable( ent_ ) = ccall((:G_KickDownable, lib), qboolean, ( Ptr{gentity_t},  ), ent_ );
G_TossTheMofo( ent_, tossDir_, tossStr_ ) = ccall((:G_TossTheMofo, lib), Void, ( Ptr{gentity_t}, vec3_t, Float32,  ), ent_, tossDir_, tossStr_ );
G_KickTrace( ent_, kickDir_, kickDist_, kickEnd_, kickDamage_, kickPush_ ) = ccall((:G_KickTrace, lib), Ptr{gentity_t}, ( Ptr{gentity_t}, vec3_t, Float32, vec3_t, Int32, Float32,  ), ent_, kickDir_, kickDist_, kickEnd_, kickDamage_, kickPush_ );
G_KickSomeMofos( ent_ ) = ccall((:G_KickSomeMofos, lib), Void, ( Ptr{gentity_t},  ), ent_ );
G_PrettyCloseIGuess( a_, b_, tolerance_ ) = ccall((:G_PrettyCloseIGuess, lib), qboolean, ( Float32, Float32, Float32,  ), a_, b_, tolerance_ );
G_GrabSomeMofos( self_ ) = ccall((:G_GrabSomeMofos, lib), Void, ( Ptr{gentity_t},  ), self_ );
WP_SaberPositionUpdate( self_, ucmd_ ) = ccall((:WP_SaberPositionUpdate, lib), Void, ( Ptr{gentity_t}, Ptr{usercmd_t},  ), self_, ucmd_ );
WP_MissileBlockForBlock( saberBlock_ ) = ccall((:WP_MissileBlockForBlock, lib), Int32, ( Int32,  ), saberBlock_ );
WP_SaberBlockNonRandom( self_, hitloc_, missileBlock_ ) = ccall((:WP_SaberBlockNonRandom, lib), Void, ( Ptr{gentity_t}, vec3_t, qboolean,  ), self_, hitloc_, missileBlock_ );
WP_SaberBlock( playerent_, hitloc_, missileBlock_ ) = ccall((:WP_SaberBlock, lib), Void, ( Ptr{gentity_t}, vec3_t, qboolean,  ), playerent_, hitloc_, missileBlock_ );
WP_SaberCanBlock( self_, point_, dflags_, mod_, projectile_, attackStr_ ) = ccall((:WP_SaberCanBlock, lib), Int32, ( Ptr{gentity_t}, vec3_t, Int32, Int32, qboolean, Int32,  ), self_, point_, dflags_, mod_, projectile_, attackStr_ );
HasSetSaberOnly() = ccall((:HasSetSaberOnly, lib), qboolean, (),  );
