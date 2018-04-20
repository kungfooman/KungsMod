void Rancor_SetBolts( gentity_t *self );
void NPC_Rancor_Precache();
void Rancor_Idle();
qboolean Rancor_CheckRoar( gentity_t *self );
void Rancor_Patrol();
void Rancor_Move( qboolean visible );
void Rancor_DropVictim( gentity_t *self );
void Rancor_Swing( qboolean tryGrab );
void Rancor_Smash();
void Rancor_Bite();
void Rancor_Attack( float distance, qboolean doCharge );
void Rancor_Combat();
void NPC_Rancor_Pain( gentity_t *self, gentity_t *attacker, int damage );
void Rancor_CheckDropVictim();
void Rancor_Crush();
void NPC_BSRancor_Default();