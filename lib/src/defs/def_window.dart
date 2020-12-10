import 'dart:ffi';
import 'package:ffi/ffi.dart';
import '../class_struct/displaysmode_struct.dart';
import '../class_struct/surface_struct.dart';

//
typedef sdl_createwindow_func = Pointer<Uint64> Function(
    Pointer<Utf8> title, Int32 x, Int32 y, Int32 w, Int32 h, Uint32 flags);
typedef dart_SDL_CreateWindow = Pointer<Uint64> Function(Pointer<Utf8> title, int x, int y, int w, int h, int flags);

//
typedef sdl_destroywindow_func = Void Function(Pointer<Uint64> window);
typedef dart_SDL_DestroyWindow = void Function(Pointer<Uint64> window);

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

//int SDL_GetWindowOpacity(SDL_Window* window)
typedef sld_getwindowopacity_func = Int32 Function(Pointer<Uint64> window, Pointer<Float> opacity);
typedef dart_SDL_GetWindowOpacity = int Function(Pointer<Uint64> window, Pointer<Float> opacity);

//void* SDL_GetWindowData(SDL_Window* window, const char* name)
typedef sld_getwindowdata_func = Void Function(Pointer<Uint64> window, Pointer<Utf8> name);
typedef dart_SDL_GetWindowData = void Function(Pointer<Uint64> window, Pointer<Utf8> name);

//Uint32 SDL_GetWindowID(SDL_Window* window)
typedef sdl_getwindowid_func = Int32 Function(Pointer<Uint64> window);
typedef dart_SDL_GetWindowId = int Function(Pointer<Uint64> window);

//Uint32 SDL_GetWindowFlags(SDL_Window* window)
typedef sdl_getwindowflags_func = Int32 Function(Pointer<Uint64> window);
typedef dart_SDL_GetWindowFlags = int Function(Pointer<Uint64> window);

//int SDL_SetWindowBrightness(SDL_Window* window,float brightness)
typedef sld_setwindowbrightness_func = Int32 Function(Pointer<Uint64> window, Float brightness);
typedef dart_SDL_SetWindowBrightness = int Function(Pointer<Uint64> window, double brightness);

//int SDL_SetWindowOpacity(SDL_Window* window,float opacity)
typedef sld_setwindowopacity_func = Int32 Function(Pointer<Uint64> window, Float brightness);
typedef dart_SDL_SetWindowOpacity = int Function(Pointer<Uint64> window, double brightness);

///void* SDL_SetWindowData(SDL_Window* window, const char* name,void* userdata)
typedef sld_setwindowdata_func = Void Function(Pointer<Uint64> window, Pointer<Utf8> name, Pointer<Int32> userdata);
typedef dart_SDL_SetWindowData = void Function(Pointer<Uint64> window, Pointer<Utf8> name, Pointer<Int32> userdata);

//int SDL_SetWindowDisplayMode(SDL_Window* window,const SDL_DisplayMode* mode)
typedef sdl_setwindowdisplaymode_func = Int32 Function(Pointer<Uint64> window, Pointer<DisplayModeStruct> displayMode);
typedef dart_SDL_SetWindowDisplayMode = int Function(Pointer<Uint64> window, Pointer<DisplayModeStruct> displayMode);

//Use this function to set the size of a window's client area.
typedef sdl_setwindow_size_func = Void Function(Pointer<Uint64> window, Int32 w, Int32 h);
typedef dart_SDL_SetWindowSize = void Function(Pointer<Uint64> window, int w, int h);

//void SDL_SetWindowTitle(SDL_Window* window,const char* title)
typedef sdl_setwindowtitle_func = Void Function(Pointer<Uint64> window, Pointer<Utf8> title);
typedef dart_SDL_SetWindowTitle = void Function(Pointer<Uint64> window, Pointer<Utf8> title);
