import 'dart:ffi';

import '../class_struct/displaysmode_struct.dart';

typedef sdl_desktopdisplaymode_func = Int32 Function(Int32 displayIndex, Pointer<DisplayModeStruct> displayMode);
typedef dart_SDL_GetDesktopDisplayMode = int Function(int displayIndex, Pointer<DisplayModeStruct> displayMode);

typedef sdl_getdisplaymode_func = Int32 Function(
    Int32 displayIndex, Int32 modeIndex, Pointer<DisplayModeStruct> displayMode);
typedef dart_SDL_GetDisplayMode = int Function(int displayIndex, int modeIndex, Pointer<DisplayModeStruct> displayMode);
