#ifndef EXTRACUNN_UTILS_H
#define EXTRACUNN_UTILS_H

extern "C"
{
#include <lua.h>
}
#include <luaT.h>
#include <THC/THC.h>

THCState* getCutorchState(lua_State* L);
void culstmextra_SpatialFullConvolutionNoBias_init(lua_State *L);
void culstmextra_SpatialConvolutionNoBias_init(lua_State *L);
//void extracunn_Huber_init(lua_State *L);

#endif
