NPC_Mark1_Precache() = ccall((:NPC_Mark1_Precache, lib), Void, (),  );
NPC_Mark1_Part_Explode( self_, bolt_ ) = ccall((:NPC_Mark1_Part_Explode, lib), Void, ( Ptr{gentity_t}, Int32,  ), self_, bolt_ );
Mark1_Idle() = ccall((:Mark1_Idle, lib), Void, (),  );
Mark1Dead_FireRocket() = ccall((:Mark1Dead_FireRocket, lib), Void, (),  );
Mark1Dead_FireBlaster() = ccall((:Mark1Dead_FireBlaster, lib), Void, (),  );
Mark1_die( self_, inflictor_, attacker_, damage_, mod_, dFlags_, hitLoc_ ) = ccall((:Mark1_die, lib), Void, ( Ptr{gentity_t}, Ptr{gentity_t}, Ptr{gentity_t}, Int32, Int32, Int32, Int32,  ), self_, inflictor_, attacker_, damage_, mod_, dFlags_, hitLoc_ );
Mark1_dying( self_ ) = ccall((:Mark1_dying, lib), Void, ( Ptr{gentity_t},  ), self_ );
NPC_Mark1_Pain( self_, attacker_, damage_ ) = ccall((:NPC_Mark1_Pain, lib), Void, ( Ptr{gentity_t}, Ptr{gentity_t}, Int32,  ), self_, attacker_, damage_ );
Mark1_Hunt() = ccall((:Mark1_Hunt, lib), Void, (),  );
Mark1_FireBlaster() = ccall((:Mark1_FireBlaster, lib), Void, (),  );
Mark1_BlasterAttack( advance_ ) = ccall((:Mark1_BlasterAttack, lib), Void, ( qboolean,  ), advance_ );
Mark1_FireRocket() = ccall((:Mark1_FireRocket, lib), Void, (),  );
Mark1_RocketAttack( advance_ ) = ccall((:Mark1_RocketAttack, lib), Void, ( qboolean,  ), advance_ );
Mark1_AttackDecision() = ccall((:Mark1_AttackDecision, lib), Void, (),  );
Mark1_Patrol() = ccall((:Mark1_Patrol, lib), Void, (),  );
NPC_BSMark1_Default() = ccall((:NPC_BSMark1_Default, lib), Void, (),  );
