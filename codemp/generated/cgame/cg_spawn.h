char *CG_NewString( const char *string );
qboolean CG_SpawnString( const char *key, const char *defaultString, char **out );
qboolean CG_SpawnFloat( const char *key, const char *defaultString, float *out );
qboolean CG_SpawnInt( const char *key, const char *defaultString, int *out );
qboolean CG_SpawnBoolean( const char *key, const char *defaultString, qboolean *out );
qboolean CG_SpawnVector( const char *key, const char *defaultString, float *out );
void SP_misc_model_static_cg();
void SP_misc_skyportal_cg();
void SP_misc_skyportal_orient_cg();
void SP_misc_weather_zone_cg();
static int spawncmp( const void *a, const void *b );
void CG_ParseEntityFromSpawnVars();
char *CG_AddSpawnVarToken( const char *string );
qboolean CG_ParseSpawnVars();
void SP_worldspawn_cg();
void CG_ParseEntitiesFromString();
