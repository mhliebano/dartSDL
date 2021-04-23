import 'dart:ffi';

import 'package:dartSDL/src/class_struct/renderer_struct.dart';

typedef sdl_createrenderer_func = Pointer<Uint64> Function(
    Pointer<Uint64> window, Int32 index, Uint32 flags);
typedef dart_SDL_CreateRenderer = Pointer<Uint64> Function(
    Pointer<Uint64> window, int index, int flags);

//int SDL_GetRendererInfo(SDL_Renderer*     renderer, SDL_RendererInfo* info)
typedef sdl_getrendererinfo_func = Int32 Function(
    Pointer<Uint64> renderer, Pointer<RendererStruct> info);
typedef dart_SDL_GetRendererInfo = int Function(
    Pointer<Uint64> renderer, Pointer<RendererStruct> info);

typedef sdl_destroyrenderer_func = Void Function(Pointer<Uint64> renderer);
typedef dart_SDL_DestroyRenderer = void Function(Pointer<Uint64> render);
typedef sdl_setrenderdrawcolor_func = Int32 Function(
    Pointer<Uint64> render, Int8 r, Int8 g, Int8 b, Int8 a);
typedef dart_SDL_SetRenderDrawColor = int Function(
    Pointer<Uint64> render, int r, int g, int b, int a);
