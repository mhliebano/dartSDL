import 'dart:ffi';
import '../../lib-ffi/ffi.dart';
import '../class_struct/displaysmode_struct.dart';
import '../class_struct/surface_struct.dart';

typedef sdl_createwindow_func = Pointer<Uint64> Function(
    Pointer<Utf8> title, Int32 x, Int32 y, Int32 w, Int32 h, Uint32 flags);
typedef dart_SDL_CreateWindow = Pointer<Uint64> Function(Pointer<Utf8> title, int x, int y, int w, int h, int flags);
typedef sdl_destroywindow_func = Void Function(Pointer<Uint64> window);
typedef dart_SDL_DestroyWindow = void Function(Pointer<Uint64> window);
typedef sdl_setwindow_size_func = Void Function(Pointer<Uint64> window, Int32 w, Int32 h);
typedef dart_SDL_SetWindowSize = void Function(Pointer<Uint64> window, int w, int h);
typedef sdl_setwindowtitle_func = Void Function(Pointer<Uint64> window, Pointer<Utf8> title);
typedef dart_SDL_SetWindowTitle = void Function(Pointer<Uint64> window, Pointer<Utf8> title);
typedef sld_getwindowsurface_func = Pointer<SurfaceStruct> Function(Pointer<Uint64> window);
typedef dart_SDL_GetWindowSurface = Pointer<SurfaceStruct> Function(Pointer<Uint64> window);

//float SDL_GetWindowBrightness(SDL_Window* window)
typedef sld_getwindowbrightness_func = Float Function(Pointer<Uint64> window);
typedef dart_SDL_GetWindowBrightness = double Function(Pointer<Uint64> window);

//int SDL_GetWindowDisplayIndex(SDL_Window* window)
typedef sld_getwindowdisplayindex_func = Int32 Function(Pointer<Uint64> window);
typedef dart_SDL_GetWindowDisplayIndex = int Function(Pointer<Uint64> window);

//int SDL_GetWindowDisplayMode(SDL_Window* window,SDL_DisplayMode* mode)
typedef sld_getwindowdisplaymode_func = Int32 Function(Pointer<Uint64> window, Pointer<DisplayModeStruct> displayMode);
typedef dart_SDL_GetWindowDisplayMode = int Function(Pointer<Uint64> window, Pointer<DisplayModeStruct> displayMode);
