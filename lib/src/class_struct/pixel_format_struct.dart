import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'palette_struct.dart';

class PixelFormatStruct extends Struct {
  @Uint32()
  int format;

  Pointer<PaletteStruct> palette;

  @Uint8()
  int bitsPerPixel;

  @Uint8()
  int bytesPerPixel;

  @Uint32()
  int rmask;

  @Uint32()
  int gmask;

  @Uint32()
  int bmask;

  @Uint32()
  int amask;

  factory PixelFormatStruct.calloc(
      int format,
      Pointer<PaletteStruct> palette,
      int bitsPerPixel,
      int bytesPerPixel,
      int rmask,
      int gmask,
      int bmask,
      int amask) {
    return calloc<PixelFormatStruct>().ref
      ..format
      ..palette
      ..bitsPerPixel
      ..bytesPerPixel
      ..rmask
      ..gmask
      ..bmask
      ..amask;
  }
}
