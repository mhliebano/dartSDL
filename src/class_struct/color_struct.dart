import 'dart:ffi';
import '../../lib-ffi/ffi.dart';

class ColorStruct extends Struct {
  @Uint8()
  int r;
  @Uint8()
  int g;
  @Uint8()
  int b;
  @Uint8()
  int a;
  factory ColorStruct.allocate(int r, int g, int b, int a) {
    return allocate<ColorStruct>().ref
      ..r = r
      ..g = g
      ..b = b
      ..a = a;
  }
}
