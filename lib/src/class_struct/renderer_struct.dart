import 'dart:ffi';
import 'package:ffi/ffi.dart';

class RendererStruct extends Struct {
  Pointer<Utf8> name;

  @Uint32()
  int flags;

  @Uint32()
  int num_texture_formats;

  Pointer texture_formats;

  @Uint32()
  int max_texture_width;

  @Uint32()
  int max_texture_height;

  factory RendererStruct.malloc(
      Pointer<Utf8> name,
      int flags,
      Pointer texture_formats,
      int num_texture_formats,
      int max_texture_width,
      int max_texture_height) {
    return calloc<RendererStruct>().ref
      ..flags
      ..name
      ..texture_formats
      ..num_texture_formats
      ..max_texture_height
      ..max_texture_width;
  }
}
