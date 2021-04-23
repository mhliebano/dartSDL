import 'dart:ffi';
import 'package:ffi/ffi.dart';

class RectStruct extends Struct {
  @Int32()
  int x;

  @Int32()
  int y;

  @Int32()
  int w;

  @Int32()
  int h;

  factory RectStruct.calloc(int x, int y, int w, int h) {
    return calloc<RectStruct>().ref
      ..x
      ..y
      ..w
      ..h;
  }

  factory RectStruct() {
    return calloc<RectStruct>().ref
      ..x
      ..y
      ..w
      ..h;
  }
}
