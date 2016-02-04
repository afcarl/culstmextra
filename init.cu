#include "luaT.h"
#include "TH.h"
#include "THC.h"
#include "THLogAdd.h" /* DEBUG: WTF */

#include <thrust/transform.h>
#include <thrust/reduce.h>
#include <thrust/transform_reduce.h>
#include <thrust/functional.h>
#include <thrust/device_ptr.h>

#include "utils.h"

LUA_EXTERNC DLL_EXPORT int luaopen_libculstmextra(lua_State *L);

int luaopen_libculstmextra(lua_State *L)
{
  lua_newtable(L);
  culstmextra_SpatialFullConvolutionNoBias_init(L);
  culstmextra_SpatialConvolutionNoBias_init(L);

  return 1;
}
