CG_NewString( string_ ) = ccall((:CG_NewString, lib), Ptr{Char}, ( Ptr{Char},  ), string_ );
CG_SpawnString( key_, defaultString_, out_ ) = ccall((:CG_SpawnString, lib), qboolean, ( Ptr{Char}, Ptr{Char}, Ptr{Ptr{Char}},  ), key_, defaultString_, out_ );
CG_SpawnFloat( key_, defaultString_, out_ ) = ccall((:CG_SpawnFloat, lib), qboolean, ( Ptr{Char}, Ptr{Char}, Ptr{Float32},  ), key_, defaultString_, out_ );
CG_SpawnInt( key_, defaultString_, out_ ) = ccall((:CG_SpawnInt, lib), qboolean, ( Ptr{Char}, Ptr{Char}, Ptr{Int32},  ), key_, defaultString_, out_ );
CG_SpawnBoolean( key_, defaultString_, out_ ) = ccall((:CG_SpawnBoolean, lib), qboolean, ( Ptr{Char}, Ptr{Char}, Ptr{qboolean},  ), key_, defaultString_, out_ );
CG_SpawnVector( key_, defaultString_, out_ ) = ccall((:CG_SpawnVector, lib), qboolean, ( Ptr{Char}, Ptr{Char}, Ptr{Float32},  ), key_, defaultString_, out_ );
SP_misc_model_static_cg() = ccall((:SP_misc_model_static_cg, lib), Void, (),  );
SP_misc_skyportal_cg() = ccall((:SP_misc_skyportal_cg, lib), Void, (),  );
SP_misc_skyportal_orient_cg() = ccall((:SP_misc_skyportal_orient_cg, lib), Void, (),  );
SP_misc_weather_zone_cg() = ccall((:SP_misc_weather_zone_cg, lib), Void, (),  );
spawncmp( a_, b_ ) = ccall((:spawncmp, lib), Int32, ( Ptr{Void}, Ptr{Void},  ), a_, b_ );
CG_ParseEntityFromSpawnVars() = ccall((:CG_ParseEntityFromSpawnVars, lib), Void, (),  );
CG_AddSpawnVarToken( string_ ) = ccall((:CG_AddSpawnVarToken, lib), Ptr{Char}, ( Ptr{Char},  ), string_ );
CG_ParseSpawnVars() = ccall((:CG_ParseSpawnVars, lib), qboolean, (),  );
SP_worldspawn_cg() = ccall((:SP_worldspawn_cg, lib), Void, (),  );
CG_ParseEntitiesFromString() = ccall((:CG_ParseEntitiesFromString, lib), Void, (),  );
