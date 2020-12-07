import 'dart:ffi';

import '../class_struct/rect_struct.dart';

class Rect {
  int _x = 0;
  get x => _x;

  int _y = 0;
  get y => _y;

  int _w = 0;
  get width => _w;

  int _h = 0;
  get heigth => _h;

  Rect();

  //Constructor in preserve Pointer Original
  Rect._fromPointer(Pointer<RectStruct> rs) {
    _x = rs.ref.x;
    _y = rs.ref.y;
    _w = rs.ref.w;
    _h = rs.ref.h;
  }
  factory Rect.fromPointer(Pointer<RectStruct> rectstruct) {
    return Rect._fromPointer(rectstruct);
  }
}
