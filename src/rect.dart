import 'class_struct/rect_struct.dart';

class Rect {
  RectStruct _r;

  get x => _r.x;
  set x(int v) {
    _r.x = v;
  }

  get y => _r.y;
  set y(int v) {
    _r.y = v;
  }

  get width => _r.w;
  set width(int w) {
    _r.w = w;
  }

  get heigth => _r.h;
  set heigth(int h) {
    _r.h = h;
  }

  Rect(x, y, w, h) {
    _r = RectStruct.allocate(x, y, w, h);
  }
}
