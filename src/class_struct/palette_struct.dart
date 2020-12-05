import 'dart:ffi';
import '../../lib-ffi/ffi.dart';

class PaletteStruct extends Struct {
  @Int32()
  int ncolor;

  //Lista de ColoresStruct
  Pointer<Uint32> SDL_Color;

  factory PaletteStruct.allocate(int ncolor, Pointer<Uint32> SDL_color) {
    return allocate<PaletteStruct>().ref
      ..ncolor
      ..SDL_Color;
  }
}
