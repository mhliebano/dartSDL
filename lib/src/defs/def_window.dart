import 'dart:ffi';
import 'package:ffi/ffi.dart';
import '../class_struct/displaysmode_struct.dart';
import '../class_struct/surface_struct.dart';

//
typedef sdl_createwindow_func = Pointer<Uint64> Function(
    Pointer<Utf8> title, Int32 x, Int32 y, Int32 w, Int32 h, Uint32 flags);
typedef dart_SDL_CreateWindow = Pointer<Uint64> Function(
    Pointer<Utf8> title, int x, int y, int w, int h, int flags);

//int SDL_CreateWindowAndRenderer(int width, int height, Uint32 window_flags,SDL_Window** window, SDL_Renderer** renderer)
typedef sdl_createwindowandrender_func = Int32 Function(Int32 w, Int32 h,
    Uint32 flags, Pointer<Uint64> window, Pointer<Uint64> renderer);
typedef dart_SDL_CreateWindowAndRender = int Function(
    int w, int h, int flags, Pointer<Uint64> window, Pointer<Uint64> renderer);

//
typedef sdl_destroywindow_func = Void Function(Pointer<Uint64> window);
typedef dart_SDL_DestroyWindow = void Function(Pointer<Uint64> window);

//SDL_GLContext SDL_GL_CreateContext(SDL_Window* window)
typedef sdl_glcreatecontext_func = Pointer<Uint64> Function(
    Pointer<Uint64> window);
typedef dart_SDL_GL_CreateContext = Pointer<Uint64> Function(
    Pointer<Uint64> window);

//void SDL_GL_DeleteContext(SDL_GLContext context)
typedef sdl_gldeletecontext_func = Void Function(Pointer<Uint64> glContext);
typedef dart_SDL_GL_DeleteContext = void Function(Pointer<Uint64> glContext);

//int SDL_GL_GetAttribute(SDL_GLattr attr,int* value)
typedef sdl_glgetattribute_func = Int32 Function(
    Int32 attr, Pointer<Int32> value);
typedef dart_SDL_GL_GetAttribute = int Function(int attr, Pointer<Int32> value);

//SDL_GLContext SDL_GL_GetCurrentContext(void)
typedef sdl_glgetcurrentcontext_func = Pointer<Uint64> Function();
typedef dart_SDL_GL_GetCurrentContext = Pointer<Uint64> Function();

//SDL_Window* SDL_GL_GetCurrentWindow(void)
typedef sdl_glgetcurrentwindow_func = Pointer<Uint64> Function();
typedef dart_SDL_GL_GetCurrentWindow = Pointer<Uint64> Function();

//void SDL_GL_GetDrawableSize(SDL_Window* window,int* w, int* h)
typedef sdl_getdrawablesize_func = Void Function(
    Pointer<Uint64> window, Pointer<Uint32> w, Pointer<Uint32> h);
typedef dart_SDL_GetDrawableSize = void Function(
    Pointer<Uint64> window, Pointer<Uint32> width, Pointer<Uint32> heigth);

//int SDL_GL_GetSwapInterval(void)
typedef sdl_glgetswapinterval_func = Int32 Function();
typedef dart_SDL_GL_GetSwapInterval = int Function();

//int SDL_GL_MakeCurrent(SDL_Window*   window, SDL_GLContext context)
typedef sdl_glmakecurrent_func = Int32 Function(
    Pointer<Uint64> window, Pointer<Uint64> context);
typedef dart_SDL_GL_MakeCurrent = int Function(
    Pointer<Uint64> window, Pointer<Uint64> context);

//void SDL_GL_ResetAttributes(void)
typedef sdl_glresetattributes_func = Void Function();
typedef dart_SDL_GL_ResetAttributes = void Function();

//int SDL_GL_SetAttribute(SDL_GLattr attr, int value)
typedef sdl_glsetattribute_func = Int32 Function(Int32 GL_Attr, Int32 value);
typedef dart_SDL_GL_SetAttribute = int Function(int GL_Attr, int value);

//int SDL_GL_SetSwapInterval(int interval)
typedef sdl_glsetswapinterval_func = Int32 Function(Int32 interval);
typedef dart_SDL_GL_SetSwapInterval = int Function(int interval);

//void SDL_GL_SwapWindow(SDL_Window* window)
typedef sdl_glswapwindow_func = Void Function(Pointer<Uint64> window);
typedef dart_SDL_GL_SwapWindow = void Function(Pointer<Uint64> window);

typedef sld_getwindowsurface_func = Pointer<SurfaceStruct> Function(
    Pointer<Uint64> window);
typedef dart_SDL_GetWindowSurface = Pointer<SurfaceStruct> Function(
    Pointer<Uint64> window);

//float SDL_GetWindowBrightness(SDL_Window* window)
typedef sld_getwindowbrightness_func = Float Function(Pointer<Uint64> window);
typedef dart_SDL_GetWindowBrightness = double Function(Pointer<Uint64> window);

//int SDL_GetWindowDisplayIndex(SDL_Window* window)
typedef sld_getwindowdisplayindex_func = Int32 Function(Pointer<Uint64> window);
typedef dart_SDL_GetWindowDisplayIndex = int Function(Pointer<Uint64> window);

//int SDL_GetWindowDisplayMode(SDL_Window* window,SDL_DisplayMode* mode)
typedef sld_getwindowdisplaymode_func = Int32 Function(
    Pointer<Uint64> window, Pointer<DisplayModeStruct> displayMode);
typedef dart_SDL_GetWindowDisplayMode = int Function(
    Pointer<Uint64> window, Pointer<DisplayModeStruct> displayMode);

//int SDL_GetWindowOpacity(SDL_Window* window)
typedef sld_getwindowopacity_func = Int32 Function(
    Pointer<Uint64> window, Pointer<Float> opacity);
typedef dart_SDL_GetWindowOpacity = int Function(
    Pointer<Uint64> window, Pointer<Float> opacity);

//void* SDL_GetWindowData(SDL_Window* window, const char* name)
typedef sld_getwindowdata_func = Pointer Function(
    Pointer<Uint64> window, Pointer<Utf8> name);
typedef dart_SDL_GetWindowData = Pointer Function(
    Pointer<Uint64> window, Pointer<Utf8> name);

//Uint32 SDL_GetWindowID(SDL_Window* window)
typedef sdl_getwindowid_func = Int32 Function(Pointer<Uint64> window);
typedef dart_SDL_GetWindowId = int Function(Pointer<Uint64> window);

//Uint32 SDL_GetWindowFlags(SDL_Window* window)
typedef sdl_getwindowflags_func = Int32 Function(Pointer<Uint64> window);
typedef dart_SDL_GetWindowFlags = int Function(Pointer<Uint64> window);

//void SDL_GetWindowSize(SDL_Window* window, int* w,int* h)
typedef sdl_getwindowsize_func = Void Function(
    Pointer<Uint64> window, Pointer<Uint32> w, Pointer<Uint32> h);
typedef dart_SDL_GetWindowSize = void Function(
    Pointer<Uint64> window, Pointer<Uint32> width, Pointer<Uint32> heigth);

//void SDL_GetWindowMaximumSize(SDL_Window* window,int* w,int* h)
typedef sdl_getwindowmaxsize_func = Void Function(
    Pointer<Uint64> window, Pointer<Uint32> w, Pointer<Uint32> h);
typedef dart_SDL_GetWindowMaxSize = void Function(
    Pointer<Uint64> window, Pointer<Uint32> width, Pointer<Uint32> heigth);

//void SDL_GetWindowMinimumSize(SDL_Window* window,int* w,int* h)
typedef sdl_getwindowminsize_func = Void Function(
    Pointer<Uint64> window, Pointer<Uint32> w, Pointer<Uint32> h);
typedef dart_SDL_GetWindowMinSize = void Function(
    Pointer<Uint64> window, Pointer<Uint32> width, Pointer<Uint32> heigth);

//Uint32 SDL_GetWindowPixelFormat(SDL_Window* window)
typedef sdl_getwindowpixelformat_func = Int32 Function(Pointer<Uint64> window);
typedef dart_SDL_GetWindowPixelFormat = int Function(Pointer<Uint64> window);

//void SDL_GetWindowPosition(SDL_Window* window, int*        x, int*        y)
typedef sdl_getwindowposition_func = Void Function(
    Pointer<Uint64> window, Pointer<Uint32> w, Pointer<Uint32> h);
typedef dart_SDL_GetWindowPosition = void Function(
    Pointer<Uint64> window, Pointer<Uint32> width, Pointer<Uint32> heigth);

//const char* SDL_GetWindowTitle(SDL_Window* window)
typedef sdl_getwindowtitle_func = Pointer<Utf8> Function(
    Pointer<Uint64> window);
typedef dart_SDL_GetWindowTitle = Pointer<Utf8> Function(
    Pointer<Uint64> window);

//void SDL_HideWindow(SDL_Window* window)
typedef sdl_hidewindow_func = Void Function(Pointer<Uint64> window);
typedef dart_SDL_HideWindow = void Function(Pointer<Uint64> window);

//SDL_bool SDL_IsScreenSaverEnabled(void)
typedef sdl_isscreensaverenabled_func = Int32 Function(Pointer<Uint64> window);
typedef dart_SDL_IsScreenSaverEnabled = int Function(Pointer<Uint64> window);

//void SDL_MaximizeWindow(SDL_Window* window)
typedef sdl_maximizewindow_func = Void Function(Pointer<Uint64> window);
typedef dart_SDL_MaximizeWindow = void Function(Pointer<Uint64> window);

//void SDL_MinimizeWindow(SDL_Window* window)
typedef sdl_minimizewindow_func = Void Function(Pointer<Uint64> window);
typedef dart_SDL_MinimizeWindow = void Function(Pointer<Uint64> window);

//void SDL_RaiseWindow(SDL_Window* window)
typedef sdl_raisewindow_func = Void Function(Pointer<Uint64> window);
typedef dart_SDL_RaiseWindow = void Function(Pointer<Uint64> window);

//void SDL_RestoreWindow(SDL_Window* window)
typedef sdl_restorewindow_func = Void Function(Pointer<Uint64> window);
typedef dart_SDL_RestoreWindow = void Function(Pointer<Uint64> window);

//void SDL_SetWindowBordered(SDL_Window* window, SDL_bool    bordered)
typedef sdl_setwindowbordered_func = Void Function(
    Pointer<Uint64> window, Int32 bordered);
typedef dart_SDL_SetWindowBordered = void Function(
    Pointer<Uint64> window, int bordered);

//int SDL_SetWindowBrightness(SDL_Window* window,float brightness)
typedef sld_setwindowbrightness_func = Int32 Function(
    Pointer<Uint64> window, Float brightness);
typedef dart_SDL_SetWindowBrightness = int Function(
    Pointer<Uint64> window, double brightness);

//int SDL_SetWindowOpacity(SDL_Window* window,float opacity)
typedef sld_setwindowopacity_func = Int32 Function(
    Pointer<Uint64> window, Float brightness);
typedef dart_SDL_SetWindowOpacity = int Function(
    Pointer<Uint64> window, double brightness);

///void* SDL_SetWindowData(SDL_Window* window, const char* name,void* userdata)
typedef sld_setwindowdata_func = Void Function(
    Pointer<Uint64> window, Pointer<Utf8> name, Pointer<Int32> userdata);
typedef dart_SDL_SetWindowData = void Function(
    Pointer<Uint64> window, Pointer<Utf8> name, Pointer<Int32> userdata);

//int SDL_SetWindowDisplayMode(SDL_Window* window,const SDL_DisplayMode* mode)
typedef sdl_setwindowdisplaymode_func = Int32 Function(
    Pointer<Uint64> window, Pointer<DisplayModeStruct> displayMode);
typedef dart_SDL_SetWindowDisplayMode = int Function(
    Pointer<Uint64> window, Pointer<DisplayModeStruct> displayMode);

//Use this function to set the size of a window's client area.
typedef sdl_setwindow_size_func = Void Function(
    Pointer<Uint64> window, Int32 w, Int32 h);
typedef dart_SDL_SetWindowSize = void Function(
    Pointer<Uint64> window, int w, int h);

//void SDL_SetWindowTitle(SDL_Window* window,const char* title)
typedef sdl_setwindowtitle_func = Void Function(
    Pointer<Uint64> window, Pointer<Utf8> title);
typedef dart_SDL_SetWindowTitle = void Function(
    Pointer<Uint64> window, Pointer<Utf8> title);

//void SDL_ShowWindow(SDL_Window* window)
typedef sdl_showwindow_func = Void Function(Pointer<Uint64> window);
typedef dart_SDL_ShowWindow = void Function(Pointer<Uint64> window);
