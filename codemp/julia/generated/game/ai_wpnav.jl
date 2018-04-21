GetFlagStr( flags_ ) = ccall((:GetFlagStr, lib), Char, ( Int32,  ), flags_ );
G_TestLine( start_, end_, color_, time_ ) = ccall((:G_TestLine, lib), Void, ( vec3_t, vec3_t, Int32, Int32,  ), start_, end_, color_, time_ );
BotWaypointRender() = ccall((:BotWaypointRender, lib), Void, (),  );
TransferWPData( from_, to_ ) = ccall((:TransferWPData, lib), Void, ( Int32, Int32,  ), from_, to_ );
CreateNewWP( origin_, flags_ ) = ccall((:CreateNewWP, lib), Void, ( vec3_t, Int32,  ), origin_, flags_ );
CreateNewWP_FromObject( wp_ ) = ccall((:CreateNewWP_FromObject, lib), Void, ( Ptr{wpobject_t},  ), wp_ );
RemoveWP() = ccall((:RemoveWP, lib), Void, (),  );
RemoveAllWP() = ccall((:RemoveAllWP, lib), Void, (),  );
RemoveWP_InTrail( afterindex_ ) = ccall((:RemoveWP_InTrail, lib), Void, ( Int32,  ), afterindex_ );
CreateNewWP_InTrail( origin_, flags_, afterindex_ ) = ccall((:CreateNewWP_InTrail, lib), Int32, ( vec3_t, Int32, Int32,  ), origin_, flags_, afterindex_ );
CreateNewWP_InsertUnder( origin_, flags_, afterindex_ ) = ccall((:CreateNewWP_InsertUnder, lib), Int32, ( vec3_t, Int32, Int32,  ), origin_, flags_, afterindex_ );
TeleportToWP( pl_, afterindex_ ) = ccall((:TeleportToWP, lib), Void, ( Ptr{gentity_t}, Int32,  ), pl_, afterindex_ );
WPFlagsModify( wpnum_, flags_ ) = ccall((:WPFlagsModify, lib), Void, ( Int32, Int32,  ), wpnum_, flags_ );
NotWithinRange( base_, extent_ ) = ccall((:NotWithinRange, lib), Int32, ( Int32, Int32,  ), base_, extent_ );
NodeHere( spot_ ) = ccall((:NodeHere, lib), Int32, ( vec3_t,  ), spot_ );
CanGetToVector( org1_, org2_, mins_, maxs_ ) = ccall((:CanGetToVector, lib), Int32, ( vec3_t, vec3_t, vec3_t, vec3_t,  ), org1_, org2_, mins_, maxs_ );
CanGetToVectorTravel( org1_, org2_, mins_, maxs_ ) = ccall((:CanGetToVectorTravel, lib), Int32, ( vec3_t, vec3_t, vec3_t, vec3_t,  ), org1_, org2_, mins_, maxs_ );
CanGetToVectorTravel( org1_, moveTo_, mins_, maxs_ ) = ccall((:CanGetToVectorTravel, lib), Int32, ( vec3_t, vec3_t, vec3_t, vec3_t,  ), org1_, moveTo_, mins_, maxs_ );
ConnectTrail( startindex_, endindex_, behindTheScenes_ ) = ccall((:ConnectTrail, lib), Int32, ( Int32, Int32, qboolean,  ), startindex_, endindex_, behindTheScenes_ );
OpposingEnds( start_, end_ ) = ccall((:OpposingEnds, lib), Int32, ( Int32, Int32,  ), start_, end_ );
DoorBlockingSection( start_, end_ ) = ccall((:DoorBlockingSection, lib), Int32, ( Int32, Int32,  ), start_, end_ );
RepairPaths( behindTheScenes_ ) = ccall((:RepairPaths, lib), Int32, ( qboolean,  ), behindTheScenes_ );
OrgVisibleCurve( org1_, mins_, maxs_, org2_, ignore_ ) = ccall((:OrgVisibleCurve, lib), Int32, ( vec3_t, vec3_t, vec3_t, vec3_t, Int32,  ), org1_, mins_, maxs_, org2_, ignore_ );
CanForceJumpTo( baseindex_, testingindex_, distance_ ) = ccall((:CanForceJumpTo, lib), Int32, ( Int32, Int32, Float32,  ), baseindex_, testingindex_, distance_ );
CalculatePaths() = ccall((:CalculatePaths, lib), Void, (),  );
GetObjectThatTargets( ent_ ) = ccall((:GetObjectThatTargets, lib), gentity_t, ( Ptr{gentity_t},  ), ent_ );
CalculateSiegeGoals() = ccall((:CalculateSiegeGoals, lib), Void, (),  );
GetNearestVisibleWPToItem( org_, ignore_ ) = ccall((:GetNearestVisibleWPToItem, lib), Int32, ( vec3_t, Int32,  ), org_, ignore_ );
CalculateWeightGoals() = ccall((:CalculateWeightGoals, lib), Void, (),  );
CalculateJumpRoutes() = ccall((:CalculateJumpRoutes, lib), Void, (),  );
LoadPathData( filename_ ) = ccall((:LoadPathData, lib), Int32, ( Ptr{Char},  ), filename_ );
FlagObjects() = ccall((:FlagObjects, lib), Void, (),  );
SavePathData( filename_ ) = ccall((:SavePathData, lib), Int32, ( Ptr{Char},  ), filename_ );
G_NearestNodeToPoint( point_ ) = ccall((:G_NearestNodeToPoint, lib), Int32, ( vec3_t,  ), point_ );
G_NodeClearForNext() = ccall((:G_NodeClearForNext, lib), Void, (),  );
G_NodeClearFlags() = ccall((:G_NodeClearFlags, lib), Void, (),  );
G_NodeMatchingXY( x_, y_ ) = ccall((:G_NodeMatchingXY, lib), Int32, ( Float32, Float32,  ), x_, y_ );
G_NodeMatchingXY_BA( x_, y_, final_ ) = ccall((:G_NodeMatchingXY_BA, lib), Int32, ( Int32, Int32, Int32,  ), x_, y_, final_ );
G_RecursiveConnection( start_, end_, weight_, traceCheck_, baseHeight_ ) = ccall((:G_RecursiveConnection, lib), Int32, ( Int32, Int32, Int32, qboolean, Float32,  ), start_, end_, weight_, traceCheck_, baseHeight_ );
G_DebugNodeFile() = ccall((:G_DebugNodeFile, lib), Void, (),  );
CreateAsciiTableRepresentation() = ccall((:CreateAsciiTableRepresentation, lib), Void, (),  );
CreateAsciiNodeTableRepresentation( start_, end_ ) = ccall((:CreateAsciiNodeTableRepresentation, lib), Void, ( Int32, Int32,  ), start_, end_ );
G_BackwardAttachment( start_, finalDestination_, insertAfter_ ) = ccall((:G_BackwardAttachment, lib), qboolean, ( Int32, Int32, Int32,  ), start_, finalDestination_, insertAfter_ );
G_RMGPathing() = ccall((:G_RMGPathing, lib), Void, (),  );
BeginAutoPathRoutine() = ccall((:BeginAutoPathRoutine, lib), Void, (),  );
LoadPath_ThisLevel() = ccall((:LoadPath_ThisLevel, lib), Void, (),  );
GetClosestSpawn( ent_ ) = ccall((:GetClosestSpawn, lib), gentity_t, ( Ptr{gentity_t},  ), ent_ );
GetNextSpawnInIndex( currentSpawn_ ) = ccall((:GetNextSpawnInIndex, lib), gentity_t, ( Ptr{gentity_t},  ), currentSpawn_ );
AcceptBotCommand( cmd_, pl_ ) = ccall((:AcceptBotCommand, lib), Int32, ( Ptr{Char}, Ptr{gentity_t},  ), cmd_, pl_ );
