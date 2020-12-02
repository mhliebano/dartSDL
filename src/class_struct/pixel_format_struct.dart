//TODO implemnetar el factory
import 'dart:ffi';
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
}
