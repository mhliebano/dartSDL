import 'dart:ffi';

import 'package:ffi/ffi.dart';

import '../../dartSDL.dart';
import '../class_struct/displaysmode_struct.dart';
import '../class_struct/rect_struct.dart';
import '../defs/def_display.dart';

class Display {
  DynamicLibrary _sdllib;
  Display() {
    _sdllib = dartSDL.sdllib;
  }
  int GetNumDisplayModes(int index) {
    final SDL_GetNumDisplaysModes = _sdllib
        .lookup<NativeFunction<sdl_getnumdisplaymodes_func>>(
            'SDL_GetNumDisplayModes')
        .asFunction<dart_SDL_GetNumDisplayModes>();
    final numdisplays = SDL_GetNumDisplaysModes(index);
    return numdisplays;
  }

  int GetNumVideoDisplays() {
    final SDL_GetNumVideoDisplays = _sdllib
        .lookup<NativeFunction<sdl_getnumvideodisplays_func>>(
            'SDL_GetNumVideoDisplays')
        .asFunction<dart_SDL_GetNumVideoDisplays>();
    final numvideo = SDL_GetNumVideoDisplays();
    return numvideo;
  }

  DisplayMode GetDesktopDisplayMode(int displayIndex) {
    final SDL_GetDesktopDisplayMode = _sdllib
        .lookup<NativeFunction<sdl_desktopdisplaymode_func>>(
            "SDL_GetDesktopDisplayMode")
        .asFunction<dart_SDL_GetDesktopDisplayMode>();
    Pointer<DisplayModeStruct> displaymode = DisplayModeStruct().addressOf;
    final desktopdisplaymode =
        SDL_GetDesktopDisplayMode(displayIndex, displaymode);
    DisplayMode dm = null;
    if (desktopdisplaymode == 0) {
      dm = DisplayMode.fromPointer(displaymode);
    }
    return dm;
  }

  DisplayMode GetDisplayMode(int displayIndex, int modeIndex) {
    final SDL_GetDisplayMode = _sdllib
        .lookup<NativeFunction<sdl_getdisplaymode_func>>("SDL_GetDisplayMode")
        .asFunction<dart_SDL_GetDisplayMode>();
    Pointer<DisplayModeStruct> displaymode = DisplayModeStruct().addressOf;
    final desktopdisplaymode =
        SDL_GetDisplayMode(displayIndex, modeIndex, displaymode);
    DisplayMode dm = null;
    if (desktopdisplaymode == 0) {
      dm = DisplayMode.fromPointer(displaymode);
    }
    return dm;
  }

  DisplayMode GetCurrentDisplayMode(int displayIndex) {
    final SDL_GetCurrentDisplayMode = _sdllib
        .lookup<NativeFunction<sdl_getcurrentdisplaymode_func>>(
            "SDL_GetCurrentDisplayMode")
        .asFunction<dart_SDL_GetCurrentDisplayMode>();
    Pointer<DisplayModeStruct> displaymode = DisplayModeStruct().addressOf;
    final desktopdisplaymode =
        SDL_GetCurrentDisplayMode(displayIndex, displaymode);
    DisplayMode dm = null;
    if (desktopdisplaymode == 0) {
      dm = DisplayMode.fromPointer(displaymode);
    }
    return dm;
  }

  Rect GetDisplayBounds(int displayIndex) {
    final SDL_GetDisplayBounds = _sdllib
        .lookup<NativeFunction<sdl_getdisplaybounds_func>>(
            "SDL_GetDisplayBounds")
        .asFunction<dart_SDL_GetDisplayBounds>();
    Pointer<RectStruct> rectpointer = RectStruct().addressOf;
    final rectbounds = SDL_GetDisplayBounds(displayIndex, rectpointer);
    Rect rect = null;
    if (rectbounds == 0) {
      rect = Rect.fromPointer(rectpointer);
    }
    return rect;
  }

  String GetDisplayName(int displayIndex) {
    final SDL_GetDisplayName = _sdllib
        .lookup<NativeFunction<sdl_getdisplayname_func>>("SDL_GetDisplayName")
        .asFunction<dart_SDL_GetDisplayName>();
    final name = SDL_GetDisplayName(displayIndex);
    return (name.toDartString());
  }

  Rect GetDisplayUsableBounds(int displayIndex) {
    final SDL_GetDisplayUsableBounds = _sdllib
        .lookup<NativeFunction<sdl_getdisplayusablebounds_func>>(
            "SDL_GetDisplayUsableBounds")
        .asFunction<dart_SDL_GetDisplayUsableBounds>();
    Pointer<RectStruct> rectpointer = RectStruct().addressOf;
    final rectbounds = SDL_GetDisplayUsableBounds(displayIndex, rectpointer);
    Rect rect = null;
    if (rectbounds == 0) {
      rect = Rect.fromPointer(rectpointer);
    }
    return rect;
  }

  String GetCurrentVideoDriver() {
    final SDL_GetCurrentVideoDriver = _sdllib
        .lookup<NativeFunction<sdl_getcurrentvideodriver_func>>(
            "SDL_GetCurrentVideoDriver")
        .asFunction<dart_SDL_GetCurrentVideoDriver>();
    final name = SDL_GetCurrentVideoDriver();
    return name.toDartString();
  }

  int GetNumVideoDrivers() {
    final SDL_GetNumVideoDriver = _sdllib
        .lookup<NativeFunction<sdl_getnumvideodrivers_func>>(
            'SDL_GetNumVideoDrivers')
        .asFunction<dart_SDL_GetNumVideoDrivers>();
    final numvideo = SDL_GetNumVideoDriver();
    return numvideo;
  }

  ///Use this function to get the name of a built in video driver.
  ///
  ///index = the [int]index of a video driver
  ///
  ///Returns the [String]name of the video driver with the given index.
  String GetVideoDriver(int index) {
    final SDL_GetVideoDriver = _sdllib
        .lookup<NativeFunction<sdl_getvideodriver_func>>("SDL_GetVideoDriver")
        .asFunction<dart_SDL_GetVideoDriver>();
    final name = SDL_GetVideoDriver(index);
    return name.toDartString();
  }

  ///Use this function to get the dots/pixels-per-inch for a display.
  ///
  Map<String, double> GetDisplayDPI(int index) {
    final SDL_GetDisplayDPI = _sdllib
        .lookup<NativeFunction<sdl_getdisplaydpi_func>>("SDL_GetDisplayDPI")
        .asFunction<dart_SDL_GetDisplayDPI>();
    Pointer<Float> ddpi = calloc();
    Pointer<Float> hdpi = calloc();
    Pointer<Float> vdpi = calloc();
    int s = SDL_GetDisplayDPI(index, ddpi, hdpi, vdpi);
    if (s != 0) {
      throw dartSDL.SDL_GetError();
    }
    return {"ddpi": ddpi.value, "hdpi": hdpi.value, "vdpi": vdpi.value};
  }

  ///Use this function to get the closest match to the requested display mode.
  ///
  ///displayIndex=the index of the display to query
  ///mode = an SDL_DisplayMode structure containing the desired display mode

  DisplayMode GetClosestDisplayMode(int displayIndex, DisplayMode mode) {
    final SDL_GetClosestDisplayMode = _sdllib
        .lookup<NativeFunction<sdl_getclosesdisplaymode_func>>(
            "SDL_GetClosestDisplayMode")
        .asFunction<dart_SDL_GetClosesDisplayMode>();
    Pointer<DisplayModeStruct> dm = calloc();
    if (SDL_GetClosestDisplayMode(displayIndex, mode.toPointer(), dm) == null) {
      throw dartSDL.SDL_GetError();
    }
    return DisplayMode.fromPointer(dm);
  }

  void DisableScreenSaver() {
    final SDL_DisableScreenSaver = _sdllib
        .lookup<NativeFunction<sdl_disablescreensaver_func>>(
            'SDL_DisableScreenSaver')
        .asFunction<dart_SDL_DisableScreenSaver>();
    SDL_DisableScreenSaver();
  }

  void EnableScreenSaver() {
    final SDL_EnableScreenSaver = _sdllib
        .lookup<NativeFunction<sdl_enablescreensaver_func>>(
            'SDL_EnableScreenSaver')
        .asFunction<dart_SDL_EnableScreenSaver>();
    SDL_EnableScreenSaver();
  }
}
