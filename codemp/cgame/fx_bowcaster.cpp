#include "fx_bowcaster.h"

void FX_BowcasterProjectileThink( centity_t *cent, const struct weaponInfo_s *weapon ) {
	vec3_t forward;
	if ( VectorNormalize2( cent->currentState.pos.trDelta, forward ) == 0.0f ) {
		forward[2] = 1.0f;
	}
	FX_PlayEffectID( cgs.effects.bowcasterShotEffect, cent->lerpOrigin, forward, -1, -1, qfalse );
}

void FX_BowcasterHitWall( vec3_t origin, vec3_t normal ) {
	FX_PlayEffectID( cgs.effects.bowcasterImpactEffect, origin, normal, -1, -1, qfalse );
}

void FX_BowcasterHitPlayer( vec3_t origin, vec3_t normal, qboolean humanoid ) {
	FX_PlayEffectID( cgs.effects.bowcasterImpactEffect, origin, normal, -1, -1, qfalse );
}

void FX_BowcasterAltProjectileThink( centity_t *cent, const struct weaponInfo_s *weapon ) {
	vec3_t forward;
	if ( VectorNormalize2( cent->currentState.pos.trDelta, forward ) == 0.0f ) {
		forward[2] = 1.0f;
	}
	FX_PlayEffectID( cgs.effects.bowcasterShotEffect, cent->lerpOrigin, forward, -1, -1, qfalse );
}