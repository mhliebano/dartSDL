import 'dart:ffi';

import '../class_struct/palette_struct.dart';
import 'color.dart';

class Palette {
  int _ncolor;
  get ncolor => _color.length;

  List<Color> _color;
  get color => _color;
  set color(List<Color> c) {
    _color = c;
  }

  //Constructor in preserve Pointer Original
  Palette._fromPointer(Pointer<PaletteStruct> pp) {
    _ncolor = pp.ref.ncolor;
    List color = pp.ref.SDL_Color.asTypedList(_ncolor);
    color.forEach((element) {
      _color.add(Color.fromPointer(element));
    });
  }
  factory Palette.fromPointer(Pointer<PaletteStruct> pp) {
    return Palette._fromPointer(pp);
  }
}
