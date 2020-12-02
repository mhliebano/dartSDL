import 'dart:ffi';
import '../../lib-ffi/ffi.dart';
import 'pixel_format_struct.dart';
import 'rect_struct.dart';

class SurfaceStruct extends Struct {
  @Int32()
  int flags;

  Pointer<PixelFormatStruct> SDL_PixelFormat;

  @Int32()
  int w, h;

  @Int32()
  int pitch;

  Pointer<Void> pixels;

  Pointer<Void> userdata;

  Pointer<RectStruct> SDL_Rect;

  @Int32()
  int refcount;

  factory SurfaceStruct.allocate(int flags, Pointer<PixelFormatStruct> SDL_PixelFormat, int w, int h, int pitch,
      Pointer<Void> pixels, Pointer<Void> userdata, Pointer<RectStruct> SDL_Rect, int refcount) {
    return allocate<SurfaceStruct>().ref
      ..flags
      ..SDL_PixelFormat
      ..w
      ..h
      ..pitch
      ..pixels
      ..userdata
      ..SDL_Rect
      ..refcount;
  }
}
