import 'dart:ffi';
import 'package:ffi/ffi.dart';

class DisplayModeStruct extends Struct {
  // expose address of the struct as a field

  @Uint32()
  int format;

  @Int32()
  int w;

  @Int32()
  int h;

  @Int32()
  int refresh_rate;

  @Int32()
  int driverdata;

  factory DisplayModeStruct.calloc(
      int format, int w, int h, int refresh_rate, int driverdata) {
    return calloc<DisplayModeStruct>().ref
      ..format = format
      ..w = w
      ..h = h
      ..refresh_rate = refresh_rate
      ..driverdata = driverdata;
  }

  factory DisplayModeStruct() {
    return calloc<DisplayModeStruct>().ref
      ..format
      ..w
      ..h
      ..refresh_rate
      ..driverdata;
  }
}
