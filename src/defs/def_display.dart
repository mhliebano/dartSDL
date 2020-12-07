import 'dart:ffi';

import '../../lib-ffi/src/utf8.dart';
import '../class_struct/displaysmode_struct.dart';
import '../class_struct/rect_struct.dart';

typedef sdl_desktopdisplaymode_func = Int32 Function(Int32 displayIndex, Pointer<DisplayModeStruct> displayMode);
typedef dart_SDL_GetDesktopDisplayMode = int Function(int displayIndex, Pointer<DisplayModeStruct> displayMode);

typedef sdl_getdisplaymode_func = Int32 Function(
    Int32 displayIndex, Int32 modeIndex, Pointer<DisplayModeStruct> displayMode);
typedef dart_SDL_GetDisplayMode = int Function(int displayIndex, int modeIndex, Pointer<DisplayModeStruct> displayMode);

//SDL_GetCurrentDisplayMode(int displayIndex,SDL_DisplayMode* mode)
typedef sdl_getcurrentdisplaymode_func = Int32 Function(Int32 displayIndex, Pointer<DisplayModeStruct> displayMode);
typedef dart_SDL_GetCurrentDisplayMode = int Function(int displayIndex, Pointer<DisplayModeStruct> displayMode);

//int SDL_GetDisplayBounds(int displayIndex, SDL_Rect* rect)
typedef sdl_getdisplaybounds_func = Int32 Function(Int32 displayIndex, Pointer<RectStruct> rect);
typedef dart_SDL_GetDisplayBounds = int Function(int displayIndex, Pointer<RectStruct> rect);

//const char* SDL_GetDisplayName(int displayIndex)
typedef sdl_getdisplayname_func = Pointer<Utf8> Function(Int32 displayIndex);
typedef dart_SDL_GetDisplayName = Pointer<Utf8> Function(int displayIndex);

//int SDL_GetDisplayUsableBounds(int displayIndex,SDL_Rect* rect)
typedef sdl_getdisplayusablebounds_func = Int32 Function(Int32 displayIndex, Pointer<RectStruct> rect);
typedef dart_SDL_GetDisplayUsableBounds = int Function(int displayIndex, Pointer<RectStruct> rect);

//const char* SDL_GetCurrentVideoDriver(void)
typedef sdl_getcurrentvideodriver_func = Pointer<Utf8> Function();
typedef dart_SDL_GetCurrentVideoDriver = Pointer<Utf8> Function();

//int SDL_GetNumVideoDrivers(void)
typedef sdl_getnumvideodrivers_func = Int32 Function();
typedef dart_SDL_GetNumVideoDrivers = int Function();
