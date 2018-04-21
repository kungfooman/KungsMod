TurretPain( self_, attacker_, damage_ ) = ccall((:TurretPain, lib), Void, ( Ptr{gentity_t}, Ptr{gentity_t}, Int32,  ), self_, attacker_, damage_ );
TurretBasePain( self_, attacker_, damage_ ) = ccall((:TurretBasePain, lib), Void, ( Ptr{gentity_t}, Ptr{gentity_t}, Int32,  ), self_, attacker_, damage_ );
auto_turret_die( self_, inflictor_, attacker_, damage_, meansOfDeath_ ) = ccall((:auto_turret_die, lib), Void, ( Ptr{gentity_t}, Ptr{gentity_t}, Ptr{gentity_t}, Int32, Int32,  ), self_, inflictor_, attacker_, damage_, meansOfDeath_ );
bottom_die( self_, inflictor_, attacker_, damage_, meansOfDeath_ ) = ccall((:bottom_die, lib), Void, ( Ptr{gentity_t}, Ptr{gentity_t}, Ptr{gentity_t}, Int32, Int32,  ), self_, inflictor_, attacker_, damage_, meansOfDeath_ );
turret_fire( ent_, start_, dir_ ) = ccall((:turret_fire, lib), Void, ( Ptr{gentity_t}, vec3_t, vec3_t,  ), ent_, start_, dir_ );
turret_head_think( self_ ) = ccall((:turret_head_think, lib), Void, ( Ptr{gentity_t},  ), self_ );
turret_aim( self_ ) = ccall((:turret_aim, lib), Void, ( Ptr{gentity_t},  ), self_ );
turret_turnoff( self_ ) = ccall((:turret_turnoff, lib), Void, ( Ptr{gentity_t},  ), self_ );
turret_sleep( self_ ) = ccall((:turret_sleep, lib), Void, ( Ptr{gentity_t},  ), self_ );
turret_find_enemies( self_ ) = ccall((:turret_find_enemies, lib), qboolean, ( Ptr{gentity_t},  ), self_ );
turret_base_think( self_ ) = ccall((:turret_base_think, lib), Void, ( Ptr{gentity_t},  ), self_ );
turret_base_use( self_, other_, activator_ ) = ccall((:turret_base_use, lib), Void, ( Ptr{gentity_t}, Ptr{gentity_t}, Ptr{gentity_t},  ), self_, other_, activator_ );
SP_misc_turret( base_ ) = ccall((:SP_misc_turret, lib), Void, ( Ptr{gentity_t},  ), base_ );
turret_base_spawn_top( base_ ) = ccall((:turret_base_spawn_top, lib), qboolean, ( Ptr{gentity_t},  ), base_ );
