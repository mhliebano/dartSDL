import 'dart:ffi';
import '../../lib-ffi/ffi.dart';

class RectStruct extends Struct {
  @Int32()
  int x;

  @Int32()
  int y;

  @Int32()
  int w;

  @Int32()
  int h;

  factory RectStruct.allocate(int x, int y, int w, int h) {
    return allocate<RectStruct>().ref
      ..x
      ..y
      ..w
      ..h;
  }

  factory RectStruct() {
    return allocate<RectStruct>().ref
      ..x
      ..y
      ..w
      ..h;
  }
}
