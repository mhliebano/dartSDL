import 'dart:ffi';
import '../lib-ffi/ffi.dart';

//Def Windows
typedef sdl_createwindow_func = Pointer<Uint64> Function(
    Pointer<Utf8> title, Int32 x, Int32 y, Int32 w, Int32 h, Uint32 flags);
typedef dart_SDL_CreateWindow = Pointer<Uint64> Function(Pointer<Utf8> title, int x, int y, int w, int h, int flags);
typedef sdl_destroywindow_func = Void Function(Pointer<Uint64> window);
typedef dart_SDL_DestroyWindow = void Function(Pointer<Uint64> window);
typedef sdl_setwindow_size_func = Void Function(Pointer<Uint64> window, Int32 w, Int32 h);
typedef dart_SDL_SetWindowSize = void Function(Pointer<Uint64> window, int w, int h);
typedef sdl_setwindowtitle_func = Void Function(Pointer<Uint64> window, Pointer<Utf8> title);
typedef dart_SDL_SetWindowTitle = void Function(Pointer<Uint64> window, Pointer<Utf8> title);

class DisplayModeStruct extends Struct {
  @Uint32()
  int format;

  @Int32()
  int w;

  @Int32()
  int h;

  @Int32()
  int refresh_rate;

  Pointer<Void> driverdata;

  factory DisplayModeStruct.allocate(int format, int w, int h, int refresh_rate, Pointer<void> driverdata) {
    return allocate<DisplayModeStruct>().ref
      ..format = format
      ..w = w
      ..h = h
      ..refresh_rate = refresh_rate
      ..driverdata = driverdata;
  }
}

//TODO DISPLAY AND WINDOW MANAGENT
// SDL_CreateWindowAndRenderer
// SDL_CreateWindowFrom
// SDL_DisableScreenSaver
// SDL_EnableScreenSaver
// SDL_GL_CreateContext
// SDL_GL_DeleteContext
// SDL_GL_ExtensionSupported
// SDL_GL_GetAttribute
// SDL_GL_GetCurrentContext
// SDL_GL_GetCurrentWindow
// SDL_GL_GetDrawableSize
// SDL_GL_GetProcAddress
// SDL_GL_GetSwapInterval
// SDL_GL_LoadLibrary
// SDL_GL_MakeCurrent
// SDL_GL_ResetAttributes
// SDL_GL_SetAttribute
// SDL_GL_SetSwapInterval
// SDL_GL_SwapWindow
// SDL_GL_UnloadLibrary
// SDL_GetClosestDisplayMode
// SDL_GetCurrentDisplayMode
// SDL_GetCurrentVideoDriver
// SDL_GetDesktopDisplayMode
// SDL_GetDisplayBounds
// SDL_GetDisplayDPI
// SDL_GetDisplayMode
// SDL_GetDisplayName
// SDL_GetDisplayUsableBounds
// SDL_GetGrabbedWindow
// SDL_GetNumDisplayModes
// SDL_GetNumVideoDisplays
// SDL_GetNumVideoDrivers
// SDL_GetVideoDriver
// SDL_GetWindowBordersSize
// SDL_GetWindowBrightness
// SDL_GetWindowData
// SDL_GetWindowDisplayIndex
// SDL_GetWindowDisplayMode
// SDL_GetWindowFlags
// SDL_GetWindowFromID
// SDL_GetWindowGammaRamp
// SDL_GetWindowGrab
// SDL_GetWindowID
// SDL_GetWindowMaximumSize
// SDL_GetWindowMinimumSize
// SDL_GetWindowOpacity
// SDL_GetWindowPixelFormat
// SDL_GetWindowPosition
// SDL_GetWindowSize
// SDL_GetWindowSurface
// SDL_GetWindowTitle
// SDL_GetWindowWMInfo
// SDL_HideWindow
// SDL_IsScreenSaverEnabled
// SDL_MaximizeWindow
// SDL_MinimizeWindow
// SDL_RaiseWindow
// SDL_RestoreWindow
// SDL_SetWindowBordered
// SDL_SetWindowBrightness
// SDL_SetWindowData
// SDL_SetWindowDisplayMode
// SDL_SetWindowFullscreen
// SDL_SetWindowGammaRamp
// SDL_SetWindowGrab
// SDL_SetWindowHitTest
// SDL_SetWindowIcon
// SDL_SetWindowInputFocus
// SDL_SetWindowMaximumSize
// SDL_SetWindowMinimumSize
// SDL_SetWindowModalFor
// SDL_SetWindowOpacity
// SDL_SetWindowPosition
// SDL_SetWindowResizable
// SDL_ShowMessageBox
// SDL_ShowSimpleMessageBox
// SDL_ShowWindow
// SDL_UpdateWindowSurface
// SDL_UpdateWindowSurfaceRects
// SDL_VideoInit
// SDL_VideoQuit
