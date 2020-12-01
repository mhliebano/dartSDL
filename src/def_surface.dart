import 'dart:ffi';
import '../lib-ffi/ffi.dart';

typedef sdl_creatergbsurface_func = Pointer<SurfaceStruct> Function(
    Uint32 flags, Int32 width, Int32 heigth, Int32 depth, Uint32 r, Uint32 g, Uint32 b, Uint32 a);
typedef dart_SDL_CreateRGBSurface = Pointer<SurfaceStruct> Function(
    int flags, int width, int heigth, int depth, int r, int g, int b, int a);

class SurfaceStruct extends Struct {
  @Int32()
  int flags;

  Pointer<Struct> SDL_PixelFormat;

  @Int32()
  int w, h;

  @Int32()
  int pitch;

  Pointer<Void> pixels;

  Pointer<Void> userdata;

  @Int32()
  int locked;

  Pointer<Void> lock_data;

  Pointer<Struct> SDL_Rect;

  Pointer<Struct> SDL_BlitMap;

  @Int32()
  int refcount;

  factory SurfaceStruct.allocate(
      int flags,
      Pointer<Struct> SDL_PixelFormat,
      int w,
      int h,
      int pitch,
      Pointer<Void> pixels,
      Pointer<Void> userdata,
      int locked,
      Pointer<Void> lock_data,
      Pointer<Struct> SDL_Rect,
      Pointer<Struct> SDL_BlitMap,
      int refcount) {
    return allocate<SurfaceStruct>().ref
      ..flags = flags
      ..SDL_PixelFormat = SDL_PixelFormat
      ..w = w
      ..h = h
      ..pitch = pitch
      ..pixels = pixels
      ..userdata = userdata
      ..locked = locked
      ..lock_data = lock_data
      ..SDL_Rect = SDL_Rect
      ..SDL_BlitMap = SDL_BlitMap
      ..refcount = refcount;
  }
}
