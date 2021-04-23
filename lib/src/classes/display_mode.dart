import 'dart:ffi';

import 'package:ffi/ffi.dart';

import '../class_struct/displaysmode_struct.dart';

class DisplayMode {
// SDL_PIXELFORMAT_UNKNOWN
// SDL_PIXELFORMAT_INDEX1LSB
// SDL_PIXELFORMAT_INDEX1MSB
// SDL_PIXELFORMAT_INDEX4LSB
// SDL_PIXELFORMAT_INDEX4MSB
// SDL_PIXELFORMAT_INDEX8
// SDL_PIXELFORMAT_RGB332
// SDL_PIXELFORMAT_RGB444
// SDL_PIXELFORMAT_RGB555
// SDL_PIXELFORMAT_BGR555
// SDL_PIXELFORMAT_ARGB4444
// SDL_PIXELFORMAT_RGBA4444
// SDL_PIXELFORMAT_ABGR4444
// SDL_PIXELFORMAT_BGRA4444
// SDL_PIXELFORMAT_ARGB1555
// SDL_PIXELFORMAT_RGBA5551
// SDL_PIXELFORMAT_ABGR1555
// SDL_PIXELFORMAT_BGRA5551
// SDL_PIXELFORMAT_RGB565
// SDL_PIXELFORMAT_BGR565
// SDL_PIXELFORMAT_RGB24
// SDL_PIXELFORMAT_BGR24
// SDL_PIXELFORMAT_RGB888
// SDL_PIXELFORMAT_RGBX8888
// SDL_PIXELFORMAT_BGR888
// SDL_PIXELFORMAT_BGRX8888
// SDL_PIXELFORMAT_ARGB8888
// SDL_PIXELFORMAT_RGBA8888
// SDL_PIXELFORMAT_ABGR8888
// SDL_PIXELFORMAT_BGRA8888
// SDL_PIXELFORMAT_ARGB2101010
// SDL_PIXELFORMAT_RGBA32
// SDL_PIXELFORMAT_ARGB32
// SDL_PIXELFORMAT_BGRA32
// SDL_PIXELFORMAT_ABGR32
// SDL_PIXELFORMAT_YV12
// SDL_PIXELFORMAT_IYUV
// SDL_PIXELFORMAT_YUY2
// SDL_PIXELFORMAT_UYVY
// SDL_PIXELFORMAT_YVYU
// SDL_PIXELFORMAT_NV12
// SDL_PIXELFORMAT_NV21

  int _format = 0;
  get format => _format;
  set format(int f) {
    _format = f;
  }

  int _width = 0;
  get width => _width;
  set width(int w) {
    _width = w;
  }

  int _heigth = 0;
  get heigth => _heigth;
  set heigth(int h) {
    _heigth = h;
  }

  int _refresh_rate = 0;
  get refresh_rate => _refresh_rate;
  set refresh_rate(int refresh_rate) {
    _refresh_rate = refresh_rate;
  }

  var _driver_data = 0;
  get driverdata => _driver_data;
  set driverdata(int driver_data) {
    _driver_data = driver_data;
  }

  DisplayMode() {}

  //Constructor in preserve Pointer Original
  DisplayMode._fromPointer(Pointer<DisplayModeStruct> displayMode) {
    _format = displayMode.ref.format;
    _width = displayMode.ref.w;
    _heigth = displayMode.ref.h;
    _refresh_rate = displayMode.ref.refresh_rate;
    _driver_data = displayMode.cast<Uint32>().value;
  }
  factory DisplayMode.fromPointer(Pointer<DisplayModeStruct> displayMode) {
    return DisplayMode._fromPointer(displayMode);
  }

  Pointer<DisplayModeStruct> toPointer() {
    Pointer<DisplayModeStruct> dmp = calloc();
    dmp.ref.driverdata = _driver_data;
    dmp.ref.format = _format;
    dmp.ref.h = _heigth;
    dmp.ref.w = width;
    return dmp;
  }
}
