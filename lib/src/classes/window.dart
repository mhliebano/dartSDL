import 'dart:ffi';

import 'package:ffi/ffi.dart';

import '../../dartSDL.dart';
import '../class_struct/displaysmode_struct.dart';
import '../class_struct/surface_struct.dart';
import '../defs/def_window.dart';
import '../enums/gl_attr.dart';
import "./gl_context.dart";

class Window {
  DynamicLibrary _sdllib;
  Pointer<Uint64> _window_internal = null;

  int _sdl_window_flag = WindowFlags.SDL_WINDOW_FLAG;
  set setWindowFlag(int f) {
    _sdl_window_flag = f;
  }

  int _x = 0;
  get x => _x;
  set x(int v) {
    _x = v;
  }

  int _y = 0;
  get y => _y;
  set y(int v) {
    _y = v;
  }

  void setPosition(int x, int y) {
    _x = x;
    _y = y;
  }

  int _w = 0;
  int _h = 0;
  void setDimension(int width, int heigth) {
    _w = width;
    _h = heigth;
  }

  Window() {
    _sdllib = dartSDL.sdllib;
  }

  factory Window.fromPointer(Pointer<Uint64> w) {
    Window wd = Window();
    wd._window_internal = w;
    return wd;
  }

  CreateWindow(String title) {
    if (dartSDL.SDL_WasInit(flag: DartSDL.SDL_INIT_VIDEO) != 0) {
      throw ("Debe inicializar el SDL Video, primero");
    }
    final SDL_CreateWindow =
        _sdllib.lookup<NativeFunction<sdl_createwindow_func>>('SDL_CreateWindow').asFunction<dart_SDL_CreateWindow>();
    _window_internal = SDL_CreateWindow(Utf8.toUtf8(title), _x, _y, _w, _h, _sdl_window_flag);
    if (_window_internal == null) {
      throw ("No se pudo crear la ventana");
    }
  }

  ///Use this function to create an OpenGL context for use with an OpenGL window, and make it current.
  ///
  ///Returns the OpenGL context associated with window or NULL on error

  GL_Context GL_CreateContext() {
    final SDL_GL_CreateContext = _sdllib
        .lookup<NativeFunction<sdl_glcreatecontext_func>>("SDL_GL_CreateContext")
        .asFunction<dart_SDL_GL_CreateContext>();
    Pointer _glContext = SDL_GL_CreateContext(_window_internal);
    if (_glContext == null) {
      throw (dartSDL.SDL_GetError());
    }
    GL_Context glc = GL_Context.fromPointer(_glContext);
    return glc;
  }

  ///Use this function to delete an OpenGL context.
  ///
  ///

  void GL_DeleteContext(GL_Context glContext) {
    final SDL_GL_DeleteContext = _sdllib
        .lookup<NativeFunction<sdl_gldeletecontext_func>>("SDL_GL_DeleteContext")
        .asFunction<dart_SDL_GL_DeleteContext>();
    SDL_GL_DeleteContext(glContext.context);
  }

  ///Use this function to get the actual value for an attribute from the current context.
  ///

  int GL_GetAttibute(GL_Attr n) {
    final SDL_GL_GetAttr = _sdllib
        .lookup<NativeFunction<sdl_glgetattribute_func>>("SDL_GL_GetAttribute")
        .asFunction<dart_SDL_GL_GetAttribute>();
    Pointer<Int32> value = allocate();
    int v = SDL_GL_GetAttr(GL_Attr.SDL_GL_RED_SIZE.index, value);
    if (v != 0) {
      throw dartSDL.SDL_GetError();
    }
    return value.cast<Int32>().value;
  }

  ///Use this function to get the currently active OpenGL context.
  ///
  ///Returns the currently active OpenGL context or NULL on failure
  ///

  GL_Context GL_GetCurrentContext() {
    final SDL_GL_GetCurrentContext = _sdllib
        .lookup<NativeFunction<sdl_glgetcurrentcontext_func>>("SDL_GL_GetCurrentContext")
        .asFunction<dart_SDL_GL_GetCurrentContext>();
    Pointer _glContext = SDL_GL_GetCurrentContext();
    if (_glContext == null) {
      throw (dartSDL.SDL_GetError());
    }
    GL_Context glc = GL_Context.fromPointer(_glContext);
    return glc;
  }

  ///Use this function to get the currently active OpenGL context.
  ///
  ///Returns the currently active OpenGL context or NULL on failure
  ///

  Window GL_GetCurrentWindow() {
    final SDL_GL_GetCurrentWindow = _sdllib
        .lookup<NativeFunction<sdl_glgetcurrentwindow_func>>("SDL_GL_GetCurrentWindow")
        .asFunction<dart_SDL_GL_GetCurrentWindow>();
    Pointer<Uint64> _win = SDL_GL_GetCurrentWindow();
    if (_win == null) {
      throw (dartSDL.SDL_GetError());
    }
    Window window = Window.fromPointer(_win);
    return window;
  }

  ///Use this function to get the size of a window's underlying drawable in pixels (for use with glViewport).
  ///
  ///This may differ from SDL_GetWindowSize() if we're rendering to a high-DPI drawable,
  ///i.e. the window was created with SDL_WINDOW_ALLOW_HIGHDPI on a platform with
  ///high-DPI support (Apple calls this "Retina"), and not disabled by the
  ///SDL_HINT_VIDEO_HIGHDPI_DISABLED hint.
  ///

  Map<String, int> GL_GetDrawableSize() {
    final SDL_GetDrawableSize = _sdllib
        .lookup<NativeFunction<sdl_getdrawablesize_func>>("SDL_GL_GetDrawableSize")
        .asFunction<dart_SDL_GetDrawableSize>();
    Pointer<Uint32> w = allocate();
    Pointer<Uint32> h = allocate();
    SDL_GetDrawableSize(_window_internal, w, h);
    return {"width": w.cast<Int32>().value, "heigth": h.cast<Int32>().value};
  }

  void DestroyWindow() {
    final SDL_DestroyWindow = _sdllib
        .lookup<NativeFunction<sdl_destroywindow_func>>('SDL_DestroyWindow')
        .asFunction<dart_SDL_DestroyWindow>();
    SDL_DestroyWindow(_window_internal);
  }

  Surface GetWindowSurface() {
    final SDL_GetWindowSurface = _sdllib
        .lookup<NativeFunction<sld_getwindowsurface_func>>('SDL_GetWindowSurface')
        .asFunction<dart_SDL_GetWindowSurface>();
    Pointer<SurfaceStruct> t = SDL_GetWindowSurface(_window_internal);
    return Surface.SDL_CreateRGBSurfaceFrom(t, _sdllib);
  }

  ///Use this function to get the brightness (gamma multiplier) for the display that owns a given window.
  ///
  /// Returns the [double]brightness for the display where 0.0 is completely dark and 1.0 is normal brightness.
  ///
  double GetWindowBrightness() {
    final SDL_GetWindowBrightness = _sdllib
        .lookup<NativeFunction<sld_getwindowbrightness_func>>("SDL_GetWindowBrightness")
        .asFunction<dart_SDL_GetWindowBrightness>();
    double brig = SDL_GetWindowBrightness(_window_internal);
    return brig;
  }

  ///Use this function to get the index of the display associated with a window.
  ///
  ///Returns the [int]index of the display containing the center of the window on success or a negative error code on failure; call SDL_GetError() for more information.
  ///
  int GetWindowDisplayIndex() {
    final SDL_GetWindowDisplayIndex = _sdllib
        .lookup<NativeFunction<sld_getwindowdisplayindex_func>>("SDL_GetWindowDisplayIndex")
        .asFunction<dart_SDL_GetWindowDisplayIndex>();
    int display = SDL_GetWindowDisplayIndex(_window_internal);
    if (display < 0) {
      print(dartSDL.SDL_GetError());
    }
    return display;
  }

  ///Use this function to fill in information about the display mode to use when a window is visible at fullscreen.
  ///
  ///Returns DisplayMode on success or a negative error code on failure; call SDL_GetError() for more information.
  ///
  DisplayMode GetWindowDisplayMode() {
    final SDL_GetWindowDisplayMode = _sdllib
        .lookup<NativeFunction<sld_getwindowdisplaymode_func>>("SDL_GetWindowDisplayMode")
        .asFunction<dart_SDL_GetWindowDisplayMode>();
    Pointer<DisplayModeStruct> displaymode = DisplayModeStruct().addressOf;
    final desktopdisplaymode = SDL_GetWindowDisplayMode(_window_internal, displaymode);
    DisplayMode dm = null;
    if (desktopdisplaymode == 0) {
      dm = DisplayMode.fromPointer(displaymode);
    } else {
      print(dartSDL.SDL_GetError());
    }
    return dm;
  }

  ///Use this function to get the opacity of a window.
  ///
  ///Returns a negative error code on failure; call SDL_GetError() for more information.
  ///
  double GetWindowOpacity() {
    final SDL_GetWindowOpacity = _sdllib
        .lookup<NativeFunction<sld_getwindowopacity_func>>("SDL_GetWindowOpacity")
        .asFunction<dart_SDL_GetWindowOpacity>();
    Pointer<Float> op = allocate();
    int opac = SDL_GetWindowOpacity(_window_internal, op);
    if (opac < 0) {
      print(dartSDL.SDL_GetError());
    }
    return op.value;
  }

  ///Use this function to retrieve the data pointer associated with a window.
  ///
  ///Returns the value associated with name.
  ///
  String GetWindowData() {
    final SDL_GetWindowData = _sdllib
        .lookup<NativeFunction<sld_getwindowdata_func>>("SDL_GetWindowData")
        .asFunction<dart_SDL_GetWindowData>();
    Pointer<Utf8> namepointer = Utf8.toUtf8("testdatapointer");
    Pointer data = SDL_GetWindowData(_window_internal, namepointer);
    print(data.cast<Int32>().value);
    return "ok"; //Utf8.fromUtf8(namepointer);
  }

  ///Use this function to get the window flags.
  ///
  ///Returns a mask of the SDL_WindowFlags associated with window
  ///
  int GetWindowFlags() {
    final SDL_GetWindowFlags = _sdllib
        .lookup<NativeFunction<sdl_getwindowflags_func>>("SDL_GetWindowFlags")
        .asFunction<dart_SDL_GetWindowFlags>();
    int flags = SDL_GetWindowFlags(_window_internal);
    return flags;
  }

  ///Use this function to get the numeric ID of a window, for logging purposes.
  ///
  ///Returns the ID of the window on success or 0 on failure; call SDL_GetError() for more information.
  ///
  int GetWindowId() {
    final SDL_GetWindowId =
        _sdllib.lookup<NativeFunction<sdl_getwindowid_func>>("SDL_GetWindowID").asFunction<dart_SDL_GetWindowId>();
    int id = SDL_GetWindowId(_window_internal);
    if (id == 0) {
      print(dartSDL.SDL_GetError());
    }
    return id;
  }

  ///Use this function to get the size of a window's client area.
  ///
  ///The window size in screen coordinates may differ from the size in pixels,
  ///if the window was created with SDL_WINDOW_ALLOW_HIGHDPI on a platform with
  ///high-dpi support (e.g. iOS or OS X). Use SDL_GL_GetDrawableSize(),
  ///SDL_Vulkan_GetDrawableSize(), or SDL_GetRendererOutputSize() to get the
  ///real client area size in pixels.
  ///

  Map<String, int> GetWindowSize() {
    final SDL_GetWindowSize = _sdllib
        .lookup<NativeFunction<sdl_getwindowsize_func>>("SDL_GetWindowSize")
        .asFunction<dart_SDL_GetWindowSize>();
    Pointer<Uint32> w = allocate();
    Pointer<Uint32> h = allocate();
    SDL_GetWindowSize(_window_internal, w, h);
    return {"width": w.cast<Int32>().value, "heigth": h.cast<Int32>().value};
  }

  ///Use this function to get the maximum size of a window's client area.
  ///
  ///may be 0

  Map<String, int> GetWindowMaximumSize() {
    final SDL_GetWindowMaxSize = _sdllib
        .lookup<NativeFunction<sdl_getwindowmaxsize_func>>("SDL_GetWindowMaximumSize")
        .asFunction<dart_SDL_GetWindowMaxSize>();
    Pointer<Uint32> w = allocate();
    Pointer<Uint32> h = allocate();
    SDL_GetWindowMaxSize(_window_internal, w, h);
    return {"width": w.cast<Int32>().value, "heigth": h.cast<Int32>().value};
  }

  ///Use this function to get the minimun size of a window's client area.
  ///
  ///may be 0

  Map<String, int> GetWindowMinimumSize() {
    final SDL_GetWindowMinSize = _sdllib
        .lookup<NativeFunction<sdl_getwindowminsize_func>>("SDL_GetWindowMinimumSize")
        .asFunction<dart_SDL_GetWindowMinSize>();
    Pointer<Uint32> w = allocate();
    Pointer<Uint32> h = allocate();
    SDL_GetWindowMinSize(_window_internal, w, h);
    return {"width": w.cast<Int32>().value, "heigth": h.cast<Int32>().value};
  }

  ///Use this function to get the pixel format associated with the window.
  ///
  ///Returns the pixel format of the window on success or SDL_PIXELFORMAT_UNKNOWN
  ///on failure; call SDL_GetError() for more information.

  int GetWindowPixelFormat() {
    final SDL_GetWindowPixelFormat = _sdllib
        .lookup<NativeFunction<sdl_getwindowpixelformat_func>>("SDL_GetWindowPixelFormat")
        .asFunction<dart_SDL_GetWindowPixelFormat>();
    int pf = SDL_GetWindowPixelFormat(_window_internal);
    return pf;
  }

  ///Use this function to get the position of a window.
  ///
  ///

  Map<String, int> GetWindowPosition() {
    final SDL_GetWindowPosition = _sdllib
        .lookup<NativeFunction<sdl_getwindowposition_func>>("SDL_GetWindowPosition")
        .asFunction<dart_SDL_GetWindowPosition>();
    Pointer<Uint32> x = allocate();
    Pointer<Uint32> y = allocate();
    SDL_GetWindowPosition(_window_internal, x, y);
    return {"x": x.cast<Int32>().value, "y": y.cast<Int32>().value};
  }

  ///Use this function to get the title of a window.
  ///
  ///Returns the title of the window in UTF-8 format or "" if there is no title.
  ///

  String GetWindowTitle() {
    final SDL_GetWindowTitle = _sdllib
        .lookup<NativeFunction<sdl_getwindowtitle_func>>("SDL_GetWindowTitle")
        .asFunction<dart_SDL_GetWindowTitle>();
    Pointer<Utf8> title = SDL_GetWindowTitle(_window_internal);
    return Utf8.fromUtf8(title);
  }

  ///Use this function to hide a window.
  ///
  ///

  void HideWindow() {
    final SDL_HideWindow =
        _sdllib.lookup<NativeFunction<sdl_hidewindow_func>>("SDL_HideWindow").asFunction<dart_SDL_HideWindow>();
    SDL_HideWindow(_window_internal);
  }

  ///Use this function to check whether the screensaver is currently enabled.
  ///
  ///Returns SDL_TRUE if the screensaver is enabled, SDL_FALSE if it is disabled.

  bool IsScreenSaverEnabled() {
    final SDL_IsScreenSaverEnabled = _sdllib
        .lookup<NativeFunction<sdl_isscreensaverenabled_func>>("SDL_IsScreenSaverEnabled")
        .asFunction<dart_SDL_IsScreenSaverEnabled>();
    int value = SDL_IsScreenSaverEnabled(_window_internal);
    if (value == 0) {
      return false;
    } else {
      return true;
    }
  }

  ///Use this function to make a window as large as possible.
  ///
  ///use flags SDL_WINDOW_RESIZABLE or similar

  void MaximizeWindow() {
    final SDL_MaximizeWindow = _sdllib
        .lookup<NativeFunction<sdl_maximizewindow_func>>("SDL_MaximizeWindow")
        .asFunction<dart_SDL_MaximizeWindow>();
    SDL_MaximizeWindow(_window_internal);
  }

  ///Use this function to minimize a window to an iconic representation.
  ///
  ///

  void MinimizeWindow() {
    final SDL_MinimizeWindow = _sdllib
        .lookup<NativeFunction<sdl_minimizewindow_func>>("SDL_MinimizeWindow")
        .asFunction<dart_SDL_MinimizeWindow>();
    SDL_MinimizeWindow(_window_internal);
  }

  ///Use this function to raise a window above other windows and set the input focus.
  ///
  ///

  void RaiseWindow() {
    final SDL_RaiseWindow =
        _sdllib.lookup<NativeFunction<sdl_raisewindow_func>>("SDL_RaiseWindow").asFunction<dart_SDL_RaiseWindow>();
    SDL_RaiseWindow(_window_internal);
  }

  ///Use this function to restore the size and position of a minimized or maximized window.
  ///
  ///

  void RestoreWindow() {
    final SDL_RestoreWindow = _sdllib
        .lookup<NativeFunction<sdl_restorewindow_func>>("SDL_RestoreWindow")
        .asFunction<dart_SDL_RestoreWindow>();
    SDL_RestoreWindow(_window_internal);
  }

  ///void SDL_SetWindowSize(SDL_Window* window,int w,int h)
  ///
  ///width  = the width of the window in pixels, in screen coordinates, must be > 0
  ///height = the height of the window in pixels, in screen coordinates, must be > 0
  ///
  /// The window size in screen coordinates may differ from the size in pixels,
  /// if the window was created with SDL_WINDOW_ALLOW_HIGHDPI on a platform
  /// with high-dpi support (e.g. iOS or OS X). Use SDL_GL_GetDrawableSize()
  /// or SDL_GetRendererOutputSize() to get the real client area size in pixels.
  /// Fullscreen windows automatically match the size of the display mode,
  /// and you should use SDL_SetWindowDisplayMode() to change their size.

  void SetWindowSize(int width, int heigth) {
    final SDL_SetWindowSize = _sdllib
        .lookup<NativeFunction<sdl_setwindow_size_func>>('SDL_SetWindowSize')
        .asFunction<dart_SDL_SetWindowSize>();
    SDL_SetWindowSize(_window_internal, width, heigth);
  }

  ///Use this function to set the title of a window.
  ///
  ///title= the desired window title in UTF-8 format
  ///
  void SetWindowTitle(String title) {
    final SDL_SetWindowTitle = _sdllib
        .lookup<NativeFunction<sdl_setwindowtitle_func>>('SDL_SetWindowTitle')
        .asFunction<dart_SDL_SetWindowTitle>();
    SDL_SetWindowTitle(_window_internal, Utf8.toUtf8(title));
  }

  ///Use this function to set the brightness (gamma multiplier) for the display that owns a given window.
  ///
  ///[double]brightness the brightness (gamma multiplier) value to set where 0.0 is completely dark and 1.0 is normal brightness
  ///
  void SetWindowBrightness(double brightness) {
    final SDL_SetWindowBrightness = _sdllib
        .lookup<NativeFunction<sld_setwindowbrightness_func>>("SDL_SetWindowBrightness")
        .asFunction<dart_SDL_SetWindowBrightness>();
    int brig = SDL_SetWindowBrightness(_window_internal, brightness);
    if (brig < 0) {
      print(dartSDL.SDL_GetError());
    }
  }

  ///Use this function to set the opacity for a window.
  ///
  ///Returns a negative error code on failure; call SDL_GetError() for more information.
  ///
  void SetWindowOpacity(double opacity) {
    final SDL_SetWindowOpacity = _sdllib
        .lookup<NativeFunction<sld_setwindowopacity_func>>("SDL_SetWindowOpacity")
        .asFunction<dart_SDL_SetWindowOpacity>();
    int opac = SDL_SetWindowOpacity(_window_internal, opacity);
    if (opac < 0) {
      print(dartSDL.SDL_GetError());
    }
  }

  void SetWindowData(String variable, var data) {
    final SDL_SetWindowData = _sdllib
        .lookup<NativeFunction<sld_setwindowdata_func>>("SDL_SetWindowData")
        .asFunction<dart_SDL_SetWindowData>();

    Pointer<Utf8> namepointer = Utf8.toUtf8(variable);
    Pointer<Int32> datapointer = Pointer.fromAddress(data);
    SDL_SetWindowData(_window_internal, namepointer, datapointer);
    //return Utf8.fromUtf8(namepointer);
  }

  void SetWindowDisplayMode(DisplayMode dm) {
    final SDL_SetWindowDisplayMode = _sdllib
        .lookup<NativeFunction<sdl_setwindowdisplaymode_func>>("SDL_SetWindowDisplayMode")
        .asFunction<dart_SDL_SetWindowDisplayMode>();

    DisplayModeStruct dps = DisplayModeStruct.allocate(dm.format, dm.width, dm.heigth, dm.refresh_rate, 0);
    SDL_SetWindowDisplayMode(_window_internal, dps.addressOf);
    //return Utf8.fromUtf8(namepointer);
  }

  ///Use this function to hide a window.
  ///
  ///

  void ShowWindow() {
    final SDL_ShowWindow =
        _sdllib.lookup<NativeFunction<sdl_showwindow_func>>("SDL_ShowWindow").asFunction<dart_SDL_ShowWindow>();
    SDL_ShowWindow(_window_internal);
  }
}
