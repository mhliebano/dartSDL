import 'dart:ffi';
import 'package:dartSDL/src/class_struct/rect_struct.dart';
import '../class_struct/surface_struct.dart';

typedef sdl_creatergbsurface_func = Pointer<SurfaceStruct> Function(
    Uint32 flags,
    Int32 width,
    Int32 heigth,
    Int32 depth,
    Uint32 r,
    Uint32 g,
    Uint32 b,
    Uint32 a);
typedef dart_SDL_CreateRGBSurface = Pointer<SurfaceStruct> Function(
    int flags, int width, int heigth, int depth, int r, int g, int b, int a);
typedef sdl_creatergbsurfacefrom_func = Pointer<SurfaceStruct> Function(
    Pointer<Void> pixels,
    Int32 width,
    Int32 heigth,
    Int32 depth,
    Int32 pitch,
    Uint32 r,
    Uint32 g,
    Uint32 b,
    Uint32 a);
typedef dart_SDL_CreateRGBSurfaceFrom = Pointer<SurfaceStruct> Function(
    Pointer<Void> pixels,
    int width,
    int heigth,
    int depth,
    int pitch,
    int r,
    int g,
    int b,
    int a);
//int SDL_FillRect (SDL_Surface * dst, const SDL_Rect * rect, Uint32 color);
typedef sdl_fillrect_func = Int32 Function(
    Pointer<SurfaceStruct> surface, Pointer<RectStruct> rect, Int32 color);
typedef dart_SDL_FillRect = int Function(
    Pointer<SurfaceStruct> surface, Pointer<RectStruct> rect, int color);
