R2D2_PartsMove() = ccall((:R2D2_PartsMove, lib), Void, (),  );
Droid_Idle() = ccall((:Droid_Idle, lib), Void, (),  );
R2D2_TurnAnims() = ccall((:R2D2_TurnAnims, lib), Void, (),  );
Droid_Patrol() = ccall((:Droid_Patrol, lib), Void, (),  );
Droid_Run() = ccall((:Droid_Run, lib), Void, (),  );
Droid_Spin() = ccall((:Droid_Spin, lib), Void, (),  );
NPC_Droid_Pain( self_, attacker_, damage_ ) = ccall((:NPC_Droid_Pain, lib), Void, ( Ptr{gentity_t}, Ptr{gentity_t}, Int32,  ), self_, attacker_, damage_ );
Droid_Pain() = ccall((:Droid_Pain, lib), Void, (),  );
NPC_Mouse_Precache() = ccall((:NPC_Mouse_Precache, lib), Void, (),  );
NPC_R5D2_Precache() = ccall((:NPC_R5D2_Precache, lib), Void, (),  );
NPC_R2D2_Precache() = ccall((:NPC_R2D2_Precache, lib), Void, (),  );
NPC_Gonk_Precache() = ccall((:NPC_Gonk_Precache, lib), Void, (),  );
NPC_Protocol_Precache() = ccall((:NPC_Protocol_Precache, lib), Void, (),  );
NPC_BSDroid_Default() = ccall((:NPC_BSDroid_Default, lib), Void, (),  );