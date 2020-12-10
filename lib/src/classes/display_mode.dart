import 'dart:ffi';

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

  int _format;
  get format => _format;

  int _width;
  get width => _width;

  int _heigth;
  get heigth => _heigth;

  int _refresh_rate;
  get refresh_rate => _refresh_rate;

  DisplayMode() {}

  //Constructor in preserve Pointer Original
  DisplayMode._fromPointer(Pointer<DisplayModeStruct> displayMode) {
    _format = displayMode.ref.format;
    _width = displayMode.ref.w;
    _heigth = displayMode.ref.h;
    _refresh_rate = displayMode.ref.refresh_rate;
  }
  factory DisplayMode.fromPointer(Pointer<DisplayModeStruct> displayMode) {
    return DisplayMode._fromPointer(displayMode);
  }
}