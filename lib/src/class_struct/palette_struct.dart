import 'dart:ffi';
import 'package:ffi/ffi.dart';

class PaletteStruct extends Struct {
  @Int32()
  int ncolor;

  //Lista de ColoresStruct
  Pointer<Uint32> SDL_Color;

  factory PaletteStruct.calloc(int ncolor, Pointer<Uint32> SDL_color) {
    return calloc<PaletteStruct>().ref
      ..ncolor
      ..SDL_Color;
  }
}
