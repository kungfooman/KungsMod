Rancor_SetBolts( self_ ) = ccall((:Rancor_SetBolts, lib), Void, ( Ptr{gentity_t},  ), self_ );
NPC_Rancor_Precache() = ccall((:NPC_Rancor_Precache, lib), Void, (),  );
Rancor_Idle() = ccall((:Rancor_Idle, lib), Void, (),  );
Rancor_CheckRoar( self_ ) = ccall((:Rancor_CheckRoar, lib), qboolean, ( Ptr{gentity_t},  ), self_ );
Rancor_Patrol() = ccall((:Rancor_Patrol, lib), Void, (),  );
Rancor_Move( visible_ ) = ccall((:Rancor_Move, lib), Void, ( qboolean,  ), visible_ );
Rancor_DropVictim( self_ ) = ccall((:Rancor_DropVictim, lib), Void, ( Ptr{gentity_t},  ), self_ );
Rancor_Swing( tryGrab_ ) = ccall((:Rancor_Swing, lib), Void, ( qboolean,  ), tryGrab_ );
Rancor_Smash() = ccall((:Rancor_Smash, lib), Void, (),  );
Rancor_Bite() = ccall((:Rancor_Bite, lib), Void, (),  );
Rancor_Attack( distance_, doCharge_ ) = ccall((:Rancor_Attack, lib), Void, ( Float32, qboolean,  ), distance_, doCharge_ );
Rancor_Combat() = ccall((:Rancor_Combat, lib), Void, (),  );
NPC_Rancor_Pain( self_, attacker_, damage_ ) = ccall((:NPC_Rancor_Pain, lib), Void, ( Ptr{gentity_t}, Ptr{gentity_t}, Int32,  ), self_, attacker_, damage_ );
Rancor_CheckDropVictim() = ccall((:Rancor_CheckDropVictim, lib), Void, (),  );
Rancor_Crush() = ccall((:Rancor_Crush, lib), Void, (),  );
NPC_BSRancor_Default() = ccall((:NPC_BSRancor_Default, lib), Void, (),  );