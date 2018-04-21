NPC_BSAdvanceFight() = ccall((:NPC_BSAdvanceFight, lib), Void, (),  );
Disappear( self_ ) = ccall((:Disappear, lib), Void, ( Ptr{gentity_t},  ), self_ );
BeamOut( self_ ) = ccall((:BeamOut, lib), Void, ( Ptr{gentity_t},  ), self_ );
NPC_BSCinematic() = ccall((:NPC_BSCinematic, lib), Void, (),  );
NPC_BSWait() = ccall((:NPC_BSWait, lib), Void, (),  );
NPC_BSInvestigate() = ccall((:NPC_BSInvestigate, lib), Void, (),  );
NPC_CheckInvestigate( alertEventNum_ ) = ccall((:NPC_CheckInvestigate, lib), qboolean, ( Int32,  ), alertEventNum_ );
NPC_BSSleep() = ccall((:NPC_BSSleep, lib), Void, (),  );
NPC_BSFollowLeader() = ccall((:NPC_BSFollowLeader, lib), Void, (),  );
NPC_BSJump() = ccall((:NPC_BSJump, lib), Void, (),  );
NPC_BSRemove() = ccall((:NPC_BSRemove, lib), Void, (),  );
NPC_BSSearch() = ccall((:NPC_BSSearch, lib), Void, (),  );
NPC_BSSearchStart( homeWp_, bState_ ) = ccall((:NPC_BSSearchStart, lib), Void, ( Int32, bState_t,  ), homeWp_, bState_ );
NPC_BSNoClip() = ccall((:NPC_BSNoClip, lib), Void, (),  );
NPC_BSWander() = ccall((:NPC_BSWander, lib), Void, (),  );
NPC_Surrender() = ccall((:NPC_Surrender, lib), Void, (),  );
NPC_CheckSurrender() = ccall((:NPC_CheckSurrender, lib), qboolean, (),  );
NPC_BSFlee() = ccall((:NPC_BSFlee, lib), Void, (),  );
NPC_StartFlee( enemy_, dangerPoint_, dangerLevel_, fleeTimeMin_, fleeTimeMax_ ) = ccall((:NPC_StartFlee, lib), Void, ( Ptr{gentity_t}, vec3_t, Int32, Int32, Int32,  ), enemy_, dangerPoint_, dangerLevel_, fleeTimeMin_, fleeTimeMax_ );
G_StartFlee( self_, enemy_, dangerPoint_, dangerLevel_, fleeTimeMin_, fleeTimeMax_ ) = ccall((:G_StartFlee, lib), Void, ( Ptr{gentity_t}, Ptr{gentity_t}, vec3_t, Int32, Int32, Int32,  ), self_, enemy_, dangerPoint_, dangerLevel_, fleeTimeMin_, fleeTimeMax_ );
NPC_BSEmplaced() = ccall((:NPC_BSEmplaced, lib), Void, (),  );
