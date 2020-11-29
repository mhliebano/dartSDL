import 'dart:ffi' as ffi;

typedef sdl_createrenderer_func = ffi.Pointer<ffi.Uint64> Function(
    ffi.Pointer<ffi.Uint64> window, ffi.Int32 index, ffi.Uint32 flags);
typedef dart_SDL_CreateRenderer = ffi.Pointer<ffi.Uint64> Function(
    ffi.Pointer<ffi.Uint64> window, int index, int flags);
typedef sdl_destroyrenderer_func = ffi.Void Function(ffi.Pointer<ffi.Uint64> renderer);
typedef dart_SDL_DestroyRenderer = void Function(ffi.Pointer<ffi.Uint64> render);
typedef sdl_setrenderdrawcolor_func = ffi.Int32 Function(
    ffi.Pointer<ffi.Uint64> render, ffi.Int8 r, ffi.Int8 g, ffi.Int8 b, ffi.Int8 a);
typedef dart_SDL_SetRenderDrawColor = int Function(ffi.Pointer<ffi.Uint64> render, int r, int g, int b, int a);
