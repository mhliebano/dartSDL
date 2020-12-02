import 'dart:ffi';
import '../../lib-ffi/ffi.dart';
import 'color_struct.dart';

class PaletteStruct extends Struct {
  @Int32()
  int ncolor;

  Pointer<ColorStruct> SDL_Color;

  factory PaletteStruct.allocate(int ncolor, ColorStruct SDL_color) {
    return allocate<PaletteStruct>().ref
      ..ncolor
      ..SDL_Color;
  }
}
