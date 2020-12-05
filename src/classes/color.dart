import 'dart:ffi';

import '../class_struct/color_struct.dart';

class Color {
  int _r;
  get rmask => _r;
  set rmask(int r) {
    _r = r;
  }

  int _g;
  get gmask => _g;
  set gmask(int g) {
    _g = g;
  }

  int _b;
  get bmask => _b;
  set bmask(int b) {
    _b = b;
  }

  int _a;
  get amask => _a;
  set amask(int a) {
    _a = a;
  }

  //Constructor in preserve Pointer Original
  Color._fromPointer(Pointer<ColorStruct> color) {}
  factory Color.fromPointer(Pointer<ColorStruct> color) {
    return Color._fromPointer(color);
  }
}
