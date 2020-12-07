import 'dart:ffi';
import '../../lib-ffi/ffi.dart';
import '../class_struct/displaysmode_struct.dart';
import '../class_struct/rect_struct.dart';
import '../dartSDL.dart';
import '../defs/def_display.dart';
import '../defs/def_sdl.dart';

class DartSDL {
  static const SDL_INIT_VIDEO = 0x00000020;
  static const SDL_INIT_AUDIO = 0x00000010;
  static const SDL_INIT_TIMER = 0x00000001;
  static const SDL_INIT_JOYSTICK = 0x00000200;
  static const SDL_INIT_HAPTIC = 0x00001000;
  static const SDL_INIT_GAMECONTROLLER = 0x00002000;
  static const SDL_INIT_EVENTS = 0x00004000;
  static const SDL_INIT_SENSOR = 0x00008000;
  static const SDL_INIT_NOPARACHUTE = 0x00100000;

  DynamicLibrary _sdllib;
  get sdllib => _sdllib;

  int _sdl_internal;

  DartSDL() {
    // Abro la libreria
    String path = "../../libs/libSDL2-2.0.so.0.9.0";
    _sdllib = DynamicLibrary.open(path);
  }

  void SDL_Init() {
    final SDL_Init = _sdllib.lookup<NativeFunction<sdl_init_func>>('SDL_Init').asFunction<dart_SDL_Init>();
    _sdl_internal = SDL_Init(SDL_INIT_VIDEO | SDL_INIT_AUDIO);
    if (_sdl_internal != 0) {
      throw ("No se pudo inicializar el SDL");
    }
  }

  void SDL_Quit() {
    final SDL_Quit = _sdllib.lookup<NativeFunction<sdl_quit_func>>('SDL_Quit').asFunction<dart_SDL_Quit>();
    SDL_Quit();
  }

  String SDL_GetError() {
    final SDL_GetError =
        _sdllib.lookup<NativeFunction<sdl_geterror_func>>('SDL_GetError').asFunction<dart_SDL_GetError>();
    final error = SDL_GetError();
    return (Utf8.fromUtf8(error));
  }

  int SDL_GetNumDisplayModes(int index) {
    final SDL_GetNumDisplaysModes = _sdllib
        .lookup<NativeFunction<sdl_getnumdisplaymodes_func>>('SDL_GetNumDisplayModes')
        .asFunction<dart_SDL_GetNumDisplayModes>();
    final numdisplays = SDL_GetNumDisplaysModes(index);
    return numdisplays;
  }

  int SDL_GetNumVideoDisplays() {
    final SDL_GetNumVideoDisplays = _sdllib
        .lookup<NativeFunction<sdl_getnumvideodisplays_func>>('SDL_GetNumVideoDisplays')
        .asFunction<dart_SDL_GetNumVideoDisplays>();
    final numvideo = SDL_GetNumVideoDisplays();
    return numvideo;
  }

  DisplayMode SDL_GetDesktopDisplayMode(int displayIndex) {
    final SDL_GetDesktopDisplayMode = _sdllib
        .lookup<NativeFunction<sdl_desktopdisplaymode_func>>("SDL_GetDesktopDisplayMode")
        .asFunction<dart_SDL_GetDesktopDisplayMode>();
    Pointer<DisplayModeStruct> displaymode = DisplayModeStruct().addressOf;
    final desktopdisplaymode = SDL_GetDesktopDisplayMode(displayIndex, displaymode);
    DisplayMode dm = null;
    if (desktopdisplaymode == 0) {
      dm = DisplayMode.fromPointer(displaymode);
    }
    return dm;
  }

  DisplayMode SDL_GetDisplayMode(int displayIndex, int modeIndex) {
    final SDL_GetDisplayMode = _sdllib
        .lookup<NativeFunction<sdl_getdisplaymode_func>>("SDL_GetDisplayMode")
        .asFunction<dart_SDL_GetDisplayMode>();
    Pointer<DisplayModeStruct> displaymode = DisplayModeStruct().addressOf;
    final desktopdisplaymode = SDL_GetDisplayMode(displayIndex, modeIndex, displaymode);
    DisplayMode dm = null;
    if (desktopdisplaymode == 0) {
      dm = DisplayMode.fromPointer(displaymode);
    }
    return dm;
  }

  DisplayMode SDL_GetCurrentDisplayMode(int displayIndex) {
    final SDL_GetCurrentDisplayMode = _sdllib
        .lookup<NativeFunction<sdl_getcurrentdisplaymode_func>>("SDL_GetCurrentDisplayMode")
        .asFunction<dart_SDL_GetCurrentDisplayMode>();
    Pointer<DisplayModeStruct> displaymode = DisplayModeStruct().addressOf;
    final desktopdisplaymode = SDL_GetCurrentDisplayMode(displayIndex, displaymode);
    DisplayMode dm = null;
    if (desktopdisplaymode == 0) {
      dm = DisplayMode.fromPointer(displaymode);
    }
    return dm;
  }

  Rect SDL_GetDisplayBounds(int displayIndex) {
    final SDL_GetDisplayBounds = _sdllib
        .lookup<NativeFunction<sdl_getdisplaybounds_func>>("SDL_GetDisplayBounds")
        .asFunction<dart_SDL_GetDisplayBounds>();
    Pointer<RectStruct> rectpointer = RectStruct().addressOf;
    final rectbounds = SDL_GetDisplayBounds(displayIndex, rectpointer);
    Rect rect = null;
    if (rectbounds == 0) {
      rect = Rect.fromPointer(rectpointer);
    }
    return rect;
  }

  String SDL_GetDisplayName(int displayIndex) {
    final SDL_GetDisplayName = _sdllib
        .lookup<NativeFunction<sdl_getdisplayname_func>>("SDL_GetDisplayName")
        .asFunction<dart_SDL_GetDisplayName>();
    final name = SDL_GetDisplayName(displayIndex);
    return (Utf8.fromUtf8(name));
  }

  Rect SDL_GetDisplayUsableBounds(int displayIndex) {
    final SDL_GetDisplayUsableBounds = _sdllib
        .lookup<NativeFunction<sdl_getdisplayusablebounds_func>>("SDL_GetDisplayUsableBounds")
        .asFunction<dart_SDL_GetDisplayUsableBounds>();
    Pointer<RectStruct> rectpointer = RectStruct().addressOf;
    final rectbounds = SDL_GetDisplayUsableBounds(displayIndex, rectpointer);
    Rect rect = null;
    if (rectbounds == 0) {
      rect = Rect.fromPointer(rectpointer);
    }
    return rect;
  }

  String SDL_GetCurrentVideoDriver() {
    final SDL_GetCurrentVideoDriver = _sdllib
        .lookup<NativeFunction<sdl_getcurrentvideodriver_func>>("SDL_GetCurrentVideoDriver")
        .asFunction<dart_SDL_GetCurrentVideoDriver>();
    final name = SDL_GetCurrentVideoDriver();
    return (Utf8.fromUtf8(name));
  }

  int SDL_GetNumVideoDrivers() {
    final SDL_GetNumVideoDriver = _sdllib
        .lookup<NativeFunction<sdl_getnumvideodrivers_func>>('SDL_GetNumVideoDrivers')
        .asFunction<dart_SDL_GetNumVideoDrivers>();
    final numvideo = SDL_GetNumVideoDriver();
    return numvideo;
  }

  void SDL_DisableScreenSaver() {
    final SDL_DisableScreenSaver = _sdllib
        .lookup<NativeFunction<sdl_disablescreensaver_func>>('SDL_DisableScreenSaver')
        .asFunction<dart_SDL_DisableScreenSaver>();
    SDL_DisableScreenSaver();
  }

  void SDL_EnableScreenSaver() {
    final SDL_EnableScreenSaver = _sdllib
        .lookup<NativeFunction<sdl_enablescreensaver_func>>('SDL_EnableScreenSaver')
        .asFunction<dart_SDL_EnableScreenSaver>();
    SDL_EnableScreenSaver();
  }

  bool isInit() {
    if (_sdl_internal == 0) {
      return true;
    } else {
      return false;
    }
  }
}
