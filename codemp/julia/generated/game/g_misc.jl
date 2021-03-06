SP_info_camp( self_ ) = ccall((:SP_info_camp, lib), Void, ( Ptr{gentity_t},  ), self_ );
SP_info_null( self_ ) = ccall((:SP_info_null, lib), Void, ( Ptr{gentity_t},  ), self_ );
SP_info_notnull( self_ ) = ccall((:SP_info_notnull, lib), Void, ( Ptr{gentity_t},  ), self_ );
misc_lightstyle_set( ent_ ) = ccall((:misc_lightstyle_set, lib), Void, ( Ptr{gentity_t},  ), ent_ );
misc_dlight_use( ent_, other_, activator_ ) = ccall((:misc_dlight_use, lib), Void, ( Ptr{gentity_t}, Ptr{gentity_t}, Ptr{gentity_t},  ), ent_, other_, activator_ );
SP_light( self_ ) = ccall((:SP_light, lib), Void, ( Ptr{gentity_t},  ), self_ );
TeleportPlayer( player_, origin_, angles_ ) = ccall((:TeleportPlayer, lib), Void, ( Ptr{gentity_t}, vec3_t, vec3_t,  ), player_, origin_, angles_ );
SP_misc_teleporter_dest( ent_ ) = ccall((:SP_misc_teleporter_dest, lib), Void, ( Ptr{gentity_t},  ), ent_ );
SP_misc_model( ent_ ) = ccall((:SP_misc_model, lib), Void, ( Ptr{gentity_t},  ), ent_ );
SP_misc_model_static( ent_ ) = ccall((:SP_misc_model_static, lib), Void, ( Ptr{gentity_t},  ), ent_ );
SP_misc_model_breakable( ent_ ) = ccall((:SP_misc_model_breakable, lib), Void, ( Ptr{gentity_t},  ), ent_ );
misc_model_breakable_gravity_init( ent_, dropToFloor_ ) = ccall((:misc_model_breakable_gravity_init, lib), Void, ( Ptr{gentity_t}, qboolean,  ), ent_, dropToFloor_ );
misc_model_breakable_init( ent_ ) = ccall((:misc_model_breakable_init, lib), Void, ( Ptr{gentity_t},  ), ent_ );
SP_misc_G2model( ent_ ) = ccall((:SP_misc_G2model, lib), Void, ( Ptr{gentity_t},  ), ent_ );
locateCamera( ent_ ) = ccall((:locateCamera, lib), Void, ( Ptr{gentity_t},  ), ent_ );
SP_misc_portal_surface( ent_ ) = ccall((:SP_misc_portal_surface, lib), Void, ( Ptr{gentity_t},  ), ent_ );
SP_misc_portal_camera( ent_ ) = ccall((:SP_misc_portal_camera, lib), Void, ( Ptr{gentity_t},  ), ent_ );
SP_misc_bsp( ent_ ) = ccall((:SP_misc_bsp, lib), Void, ( Ptr{gentity_t},  ), ent_ );
SP_terrain( ent_ ) = ccall((:SP_terrain, lib), Void, ( Ptr{gentity_t},  ), ent_ );
G_PortalifyEntities( ent_ ) = ccall((:G_PortalifyEntities, lib), Void, ( Ptr{gentity_t},  ), ent_ );
SP_misc_skyportal_orient( ent_ ) = ccall((:SP_misc_skyportal_orient, lib), Void, ( Ptr{gentity_t},  ), ent_ );
SP_misc_skyportal( ent_ ) = ccall((:SP_misc_skyportal, lib), Void, ( Ptr{gentity_t},  ), ent_ );
HolocronRespawn( self_ ) = ccall((:HolocronRespawn, lib), Void, ( Ptr{gentity_t},  ), self_ );
HolocronPopOut( self_ ) = ccall((:HolocronPopOut, lib), Void, ( Ptr{gentity_t},  ), self_ );
HolocronTouch( self_, other_, trace_ ) = ccall((:HolocronTouch, lib), Void, ( Ptr{gentity_t}, Ptr{gentity_t}, Ptr{trace_t},  ), self_, other_, trace_ );
HolocronThink( ent_ ) = ccall((:HolocronThink, lib), Void, ( Ptr{gentity_t},  ), ent_ );
SP_misc_holocron( ent_ ) = ccall((:SP_misc_holocron, lib), Void, ( Ptr{gentity_t},  ), ent_ );
Use_Shooter( ent_, other_, activator_ ) = ccall((:Use_Shooter, lib), Void, ( Ptr{gentity_t}, Ptr{gentity_t}, Ptr{gentity_t},  ), ent_, other_, activator_ );
InitShooter_Finish( ent_ ) = ccall((:InitShooter_Finish, lib), Void, ( Ptr{gentity_t},  ), ent_ );
InitShooter( ent_, weapon_ ) = ccall((:InitShooter, lib), Void, ( Ptr{gentity_t}, Int32,  ), ent_, weapon_ );
SP_shooter_blaster( ent_ ) = ccall((:SP_shooter_blaster, lib), Void, ( Ptr{gentity_t},  ), ent_ );
check_recharge( ent_ ) = ccall((:check_recharge, lib), Void, ( Ptr{gentity_t},  ), ent_ );
EnergyShieldStationSettings( ent_ ) = ccall((:EnergyShieldStationSettings, lib), Void, ( Ptr{gentity_t},  ), ent_ );
shield_power_converter_use( self_, other_, activator_ ) = ccall((:shield_power_converter_use, lib), Void, ( Ptr{gentity_t}, Ptr{gentity_t}, Ptr{gentity_t},  ), self_, other_, activator_ );
ammo_generic_power_converter_use( self_, other_, activator_ ) = ccall((:ammo_generic_power_converter_use, lib), Void, ( Ptr{gentity_t}, Ptr{gentity_t}, Ptr{gentity_t},  ), self_, other_, activator_ );
SP_misc_ammo_floor_unit( ent_ ) = ccall((:SP_misc_ammo_floor_unit, lib), Void, ( Ptr{gentity_t},  ), ent_ );
SP_misc_shield_floor_unit( ent_ ) = ccall((:SP_misc_shield_floor_unit, lib), Void, ( Ptr{gentity_t},  ), ent_ );
SP_misc_model_shield_power_converter( ent_ ) = ccall((:SP_misc_model_shield_power_converter, lib), Void, ( Ptr{gentity_t},  ), ent_ );
EnergyAmmoStationSettings( ent_ ) = ccall((:EnergyAmmoStationSettings, lib), Void, ( Ptr{gentity_t},  ), ent_ );
ammo_power_converter_use( self_, other_, activator_ ) = ccall((:ammo_power_converter_use, lib), Void, ( Ptr{gentity_t}, Ptr{gentity_t}, Ptr{gentity_t},  ), self_, other_, activator_ );
SP_misc_model_ammo_power_converter( ent_ ) = ccall((:SP_misc_model_ammo_power_converter, lib), Void, ( Ptr{gentity_t},  ), ent_ );
EnergyHealthStationSettings( ent_ ) = ccall((:EnergyHealthStationSettings, lib), Void, ( Ptr{gentity_t},  ), ent_ );
health_power_converter_use( self_, other_, activator_ ) = ccall((:health_power_converter_use, lib), Void, ( Ptr{gentity_t}, Ptr{gentity_t}, Ptr{gentity_t},  ), self_, other_, activator_ );
SP_misc_model_health_power_converter( ent_ ) = ccall((:SP_misc_model_health_power_converter, lib), Void, ( Ptr{gentity_t},  ), ent_ );
DmgBoxHit( self_, other_, trace_ ) = ccall((:DmgBoxHit, lib), Void, ( Ptr{gentity_t}, Ptr{gentity_t}, Ptr{trace_t},  ), self_, other_, trace_ );
DmgBoxUpdateSelf( self_ ) = ccall((:DmgBoxUpdateSelf, lib), Void, ( Ptr{gentity_t},  ), self_ );
DmgBoxAbsorb_Die( self_, inflictor_, attacker_, damage_, mod_ ) = ccall((:DmgBoxAbsorb_Die, lib), Void, ( Ptr{gentity_t}, Ptr{gentity_t}, Ptr{gentity_t}, Int32, Int32,  ), self_, inflictor_, attacker_, damage_, mod_ );
DmgBoxAbsorb_Pain( self_, attacker_, damage_ ) = ccall((:DmgBoxAbsorb_Pain, lib), Void, ( Ptr{gentity_t}, Ptr{gentity_t}, Int32,  ), self_, attacker_, damage_ );
CreateNewDamageBox( ent_ ) = ccall((:CreateNewDamageBox, lib), Ptr{gentity_t}, ( Ptr{gentity_t},  ), ent_ );
ATST_ManageDamageBoxes( ent_ ) = ccall((:ATST_ManageDamageBoxes, lib), Void, ( Ptr{gentity_t},  ), ent_ );
G_PlayerBecomeATST( ent_ ) = ccall((:G_PlayerBecomeATST, lib), Int32, ( Ptr{gentity_t},  ), ent_ );
fx_runner_think( ent_ ) = ccall((:fx_runner_think, lib), Void, ( Ptr{gentity_t},  ), ent_ );
fx_runner_use( self_, other_, activator_ ) = ccall((:fx_runner_use, lib), Void, ( Ptr{gentity_t}, Ptr{gentity_t}, Ptr{gentity_t},  ), self_, other_, activator_ );
fx_runner_link( ent_ ) = ccall((:fx_runner_link, lib), Void, ( Ptr{gentity_t},  ), ent_ );
SP_fx_runner( ent_ ) = ccall((:SP_fx_runner, lib), Void, ( Ptr{gentity_t},  ), ent_ );
SP_CreateWind( ent_ ) = ccall((:SP_CreateWind, lib), Void, ( Ptr{gentity_t},  ), ent_ );
SP_CreateSpaceDust( ent_ ) = ccall((:SP_CreateSpaceDust, lib), Void, ( Ptr{gentity_t},  ), ent_ );
SP_CreateSnow( ent_ ) = ccall((:SP_CreateSnow, lib), Void, ( Ptr{gentity_t},  ), ent_ );
SP_CreateRain( ent_ ) = ccall((:SP_CreateRain, lib), Void, ( Ptr{gentity_t},  ), ent_ );
Use_Target_Screenshake( ent_, other_, activator_ ) = ccall((:Use_Target_Screenshake, lib), Void, ( Ptr{gentity_t}, Ptr{gentity_t}, Ptr{gentity_t},  ), ent_, other_, activator_ );
SP_target_screenshake( ent_ ) = ccall((:SP_target_screenshake, lib), Void, ( Ptr{gentity_t},  ), ent_ );
Use_Target_Escapetrig( ent_, other_, activator_ ) = ccall((:Use_Target_Escapetrig, lib), Void, ( Ptr{gentity_t}, Ptr{gentity_t}, Ptr{gentity_t},  ), ent_, other_, activator_ );
SP_target_escapetrig( ent_ ) = ccall((:SP_target_escapetrig, lib), Void, ( Ptr{gentity_t},  ), ent_ );
maglock_die( self_, inflictor_, attacker_, damage_, mod_ ) = ccall((:maglock_die, lib), Void, ( Ptr{gentity_t}, Ptr{gentity_t}, Ptr{gentity_t}, Int32, Int32,  ), self_, inflictor_, attacker_, damage_, mod_ );
SP_misc_maglock( self_ ) = ccall((:SP_misc_maglock, lib), Void, ( Ptr{gentity_t},  ), self_ );
maglock_link( self_ ) = ccall((:maglock_link, lib), Void, ( Ptr{gentity_t},  ), self_ );
faller_touch( self_, other_, trace_ ) = ccall((:faller_touch, lib), Void, ( Ptr{gentity_t}, Ptr{gentity_t}, Ptr{trace_t},  ), self_, other_, trace_ );
faller_think( ent_ ) = ccall((:faller_think, lib), Void, ( Ptr{gentity_t},  ), ent_ );
misc_faller_create( ent_, other_, activator_ ) = ccall((:misc_faller_create, lib), Void, ( Ptr{gentity_t}, Ptr{gentity_t}, Ptr{gentity_t},  ), ent_, other_, activator_ );
misc_faller_think( ent_ ) = ccall((:misc_faller_think, lib), Void, ( Ptr{gentity_t},  ), ent_ );
SP_misc_faller( ent_ ) = ccall((:SP_misc_faller, lib), Void, ( Ptr{gentity_t},  ), ent_ );
FirstFreeTagOwner() = ccall((:FirstFreeTagOwner, lib), Ptr{tagOwner_t}, (),  );
FirstFreeRefTag( tagOwner_ ) = ccall((:FirstFreeRefTag, lib), Ptr{reference_tag_t}, ( Ptr{tagOwner_t},  ), tagOwner_ );
TAG_Init() = ccall((:TAG_Init, lib), Void, (),  );
TAG_FindOwner( owner_ ) = ccall((:TAG_FindOwner, lib), Ptr{tagOwner_t}, ( Ptr{Char},  ), owner_ );
TAG_Find( owner_, name_ ) = ccall((:TAG_Find, lib), Ptr{reference_tag_t}, ( Ptr{Char}, Ptr{Char},  ), owner_, name_ );
TAG_Add( name_, owner_, origin_, angles_, radius_, flags_ ) = ccall((:TAG_Add, lib), Ptr{reference_tag_t}, ( Ptr{Char}, Ptr{Char}, vec3_t, vec3_t, Int32, Int32,  ), name_, owner_, origin_, angles_, radius_, flags_ );
TAG_GetOrigin( owner_, name_, origin_ ) = ccall((:TAG_GetOrigin, lib), Int32, ( Ptr{Char}, Ptr{Char}, vec3_t,  ), owner_, name_, origin_ );
TAG_GetOrigin2( owner_, name_, origin_ ) = ccall((:TAG_GetOrigin2, lib), Int32, ( Ptr{Char}, Ptr{Char}, vec3_t,  ), owner_, name_, origin_ );
TAG_GetAngles( owner_, name_, angles_ ) = ccall((:TAG_GetAngles, lib), Int32, ( Ptr{Char}, Ptr{Char}, vec3_t,  ), owner_, name_, angles_ );
TAG_GetRadius( owner_, name_ ) = ccall((:TAG_GetRadius, lib), Int32, ( Ptr{Char}, Ptr{Char},  ), owner_, name_ );
TAG_GetFlags( owner_, name_ ) = ccall((:TAG_GetFlags, lib), Int32, ( Ptr{Char}, Ptr{Char},  ), owner_, name_ );
ref_link( ent_ ) = ccall((:ref_link, lib), Void, ( Ptr{gentity_t},  ), ent_ );
SP_reference_tag( ent_ ) = ccall((:SP_reference_tag, lib), Void, ( Ptr{gentity_t},  ), ent_ );
G_ClientForShooter() = ccall((:G_ClientForShooter, lib), Ptr{gclient_t}, (),  );
G_FreeClientForShooter( cl_ ) = ccall((:G_FreeClientForShooter, lib), Void, ( Ptr{gclient_t},  ), cl_ );
misc_weapon_shooter_fire( self_ ) = ccall((:misc_weapon_shooter_fire, lib), Void, ( Ptr{gentity_t},  ), self_ );
misc_weapon_shooter_use( self_, other_, activator_ ) = ccall((:misc_weapon_shooter_use, lib), Void, ( Ptr{gentity_t}, Ptr{gentity_t}, Ptr{gentity_t},  ), self_, other_, activator_ );
misc_weapon_shooter_aim( self_ ) = ccall((:misc_weapon_shooter_aim, lib), Void, ( Ptr{gentity_t},  ), self_ );
SP_misc_weapon_shooter( self_ ) = ccall((:SP_misc_weapon_shooter, lib), Void, ( Ptr{gentity_t},  ), self_ );
SP_misc_weather_zone( ent_ ) = ccall((:SP_misc_weather_zone, lib), Void, ( Ptr{gentity_t},  ), ent_ );
SP_misc_cubemap( ent_ ) = ccall((:SP_misc_cubemap, lib), Void, ( Ptr{gentity_t},  ), ent_ );
