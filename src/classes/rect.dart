import 'dart:ffi';

import '../class_struct/rect_struct.dart';

class Rect {
  int _x = 0;
  get x => _x;
  set x(int v) {
    _x = v;
  }

  int _y = 0;
  get y => _y;
  set y(int v) {
    _y = v;
  }

  int _w = 0;
  get width => _w;
  set width(int w) {
    _w = w;
  }

  int _h = 0;
  get heigth => _h;
  set heigth(int h) {
    _h = h;
  }

  Rect({x, y, width, height});

  Rect._default(Pointer<RectStruct> rect) {
    _x = rect.ref.x;
    _y = rect.ref.y;
    _w = rect.ref.w;
    _h = rect.ref.h;
  }
  factory Rect.fromStruct(Pointer<RectStruct> rect) {
    return Rect._default(rect);
  }
}
