import 'dart:ffi';
import '../../lib-ffi/ffi.dart';
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

  factory PixelFormatStruct.allocate(int format, Pointer<PaletteStruct> palette, int bitsPerPixel, int bytesPerPixel,
      int rmask, int gmask, int bmask, int amask) {
    return allocate<PixelFormatStruct>().ref
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
