import 'dart:ffi';
import 'package:ffi/ffi.dart';

class DisplayModeStruct extends Struct {
  @Uint32()
  int format;

  @Int32()
  int w;

  @Int32()
  int h;

  @Int32()
  int refresh_rate;

  Pointer<Void> driverdata;

  factory DisplayModeStruct.allocate(int format, int w, int h, int refresh_rate, Pointer<void> driverdata) {
    return allocate<DisplayModeStruct>().ref
      ..format = format
      ..w = w
      ..h = h
      ..refresh_rate = refresh_rate
      ..driverdata = driverdata;
  }

  factory DisplayModeStruct() {
    return allocate<DisplayModeStruct>().ref
      ..format
      ..w
      ..h
      ..refresh_rate
      ..driverdata;
  }
}
