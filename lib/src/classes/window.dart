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
  get windowPointer => _window_internal;

  Renderer _renderer = null;
  get renderer => _renderer;

  Window() {
    _sdllib = dartSDL.sdllib;
  }

  factory Window.fromPointer(Pointer<Uint64> w) {
    Window wd = Window();
    wd._window_internal = w;
    return wd;
  }

  Window.CreateWindow(
      String title, int x, int y, int width, int height, int flag) {
    _sdllib = dartSDL.sdllib;
    final SDL_CreateWindow = _sdllib
        .lookup<NativeFunction<sdl_createwindow_func>>('SDL_CreateWindow')
        .asFunction<dart_SDL_CreateWindow>();
    _window_internal =
        SDL_CreateWindow(title.toNativeUtf8(), x, y, width, height, flag);
    if (_window_internal == null) {
      throw (dartSDL.SDL_GetError());
    }
  }

  ///Use this function to create a window and default renderer.
  ///
  ///width=the width of the window
  ///height=the height of the window
  ///window_flags=the flags used to create the window (see SDL_CreateWindow())
  ///
  ///Returns 0 on success, or -1 on error; call SDL_GetError()

  Window.CreateWindowAndRender(int width, int height, int flag) {
    _sdllib = dartSDL.sdllib;
    final CreateWindowAndRender = _sdllib
        .lookup<NativeFunction<sdl_createwindowandrender_func>>(
            "SDL_CreateWindowAndRenderer")
        .asFunction<dart_SDL_CreateWindowAndRender>();
    Pointer<Uint64> window = calloc();
    Pointer<Uint64> renderer = calloc();
    int v = CreateWindowAndRender(width, height, flag, window, renderer);
    if (v != 0) {
      throw (dartSDL.SDL_GetError());
    }
    _window_internal = window;
    _renderer = Renderer.fromPointer(renderer);
  }

  ///Use this function to create an OpenGL context for use with an OpenGL window, and make it current.
  ///
  ///Returns the OpenGL context associated with window or NULL on error

  GL_Context GL_CreateContext() {
    final SDL_GL_CreateContext = _sdllib
        .lookup<NativeFunction<sdl_glcreatecontext_func>>(
            "SDL_GL_CreateContext")
        .asFunction<dart_SDL_GL_CreateContext>();
    Pointer<Uint64> _glContext = SDL_GL_CreateContext(_window_internal);
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
        .lookup<NativeFunction<sdl_gldeletecontext_func>>(
            "SDL_GL_DeleteContext")
        .asFunction<dart_SDL_GL_DeleteContext>();
    SDL_GL_DeleteContext(glContext.context);
  }

  ///Use this function to get the actual value for an attribute from the current context.
  ///

  int GL_GetAttibute(GL_Attr n) {
    final SDL_GL_GetAttr = _sdllib
        .lookup<NativeFunction<sdl_glgetattribute_func>>("SDL_GL_GetAttribute")
        .asFunction<dart_SDL_GL_GetAttribute>();
    Pointer<Int32> value = calloc();
    int v = SDL_GL_GetAttr(n.index, value);
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
        .lookup<NativeFunction<sdl_glgetcurrentcontext_func>>(
            "SDL_GL_GetCurrentContext")
        .asFunction<dart_SDL_GL_GetCurrentContext>();
    Pointer<Uint64> _glContext = SDL_GL_GetCurrentContext();
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
        .lookup<NativeFunction<sdl_glgetcurrentwindow_func>>(
            "SDL_GL_GetCurrentWindow")
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
        .lookup<NativeFunction<sdl_getdrawablesize_func>>(
            "SDL_GL_GetDrawableSize")
        .asFunction<dart_SDL_GetDrawableSize>();
    Pointer<Uint32> w = calloc();
    Pointer<Uint32> h = calloc();
    SDL_GetDrawableSize(_window_internal, w, h);
    return {"width": w.cast<Int32>().value, "heigth": h.cast<Int32>().value};
  }

  ///Use this function to get the swap interval for the current OpenGL context.
  ///
  ///Returns 0 if there is no vertical retrace synchronization,
  ///1 if the buffer swap is synchronized with the  vertical retrace,
  ///and -1 if late swaps happen immediately instead of waiting for the next retrace;

  int GL_GetSwapInterval() {
    final SDL_GL_GetSwapInterval = _sdllib
        .lookup<NativeFunction<sdl_glgetswapinterval_func>>(
            "SDL_GL_GetSwapInterval")
        .asFunction<dart_SDL_GL_GetSwapInterval>();
    int swap = SDL_GL_GetSwapInterval();
    if (swap < -1 && swap > 1) {
      throw (dartSDL.SDL_GetError());
    }
    return swap;
  }

  ///Use this function to set up an OpenGL context for rendering into an OpenGL window.
  ///
  ///Returns 0 on success or a negative error code on failure

  void GL_MakeCurrent(GL_Context context) {
    final SDL_GL_MakeCurrent = _sdllib
        .lookup<NativeFunction<sdl_glmakecurrent_func>>("SDL_GL_MakeCurrent")
        .asFunction<dart_SDL_GL_MakeCurrent>();
    int make = SDL_GL_MakeCurrent(_window_internal, context.context);
    if (make != 0) {
      throw (dartSDL.SDL_GetError());
    }
  }

  ///Use this function to reset all previously set OpenGL context attributes to their default values.
  ///

  Window.GL_ResetAttributes() {
    _sdllib = dartSDL.sdllib;
    final SDL_GL_ResetAttributes = _sdllib
        .lookup<NativeFunction<sdl_glresetattributes_func>>(
            "SDL_GL_ResetAttributes")
        .asFunction<dart_SDL_GL_ResetAttributes>();
    SDL_GL_ResetAttributes();
  }

  ///Use this function to set an OpenGL window attribute before window creation.
  ///
  ///attr=  the OpenGL attribute to set; see Remarks for details
  ///value= the desired value for the attribute
  ///

  Window.GL_SetAttribute(GL_Attr attr, int value) {
    _sdllib = dartSDL.sdllib;
    final SDL_GL_SetAttribute = _sdllib
        .lookup<NativeFunction<sdl_glsetattribute_func>>("SDL_GL_SetAttribute")
        .asFunction<dart_SDL_GL_SetAttribute>();
    print(attr.index);
    int v = SDL_GL_SetAttribute(attr.index, value);
    if (v != 0) {
      throw (dartSDL.SDL_GetError());
    }
  }

  ///Use this function to set the swap interval for the current OpenGL context.
  ///
  ///interval=0 for immediate updates, 1 for updates synchronized with the vertical retrace, -1 for adaptive vsync;
  ///

  Window.GL_SetSwapInterval(int interval) {
    final SDL_GL_SetSwapInterval = _sdllib
        .lookup<NativeFunction<sdl_glsetswapinterval_func>>(
            "SDL_GL_SetSwapInterval")
        .asFunction<dart_SDL_GL_SetSwapInterval>();
    int swap = SDL_GL_SetSwapInterval(interval);
    if (swap != 0) {
      throw (dartSDL.SDL_GetError());
    }
  }

  ///Use this function to update a window with OpenGL rendering.

  void GL_SwapWindow() {
    final SDL_GL_SwapWindow = _sdllib
        .lookup<NativeFunction<sdl_glswapwindow_func>>("SDL_GL_SwapWindow")
        .asFunction<dart_SDL_GL_SwapWindow>();
    SDL_GL_SwapWindow(_window_internal);
  }

  void DestroyWindow() {
    final SDL_DestroyWindow = _sdllib
        .lookup<NativeFunction<sdl_destroywindow_func>>('SDL_DestroyWindow')
        .asFunction<dart_SDL_DestroyWindow>();
    SDL_DestroyWindow(_window_internal);
  }

  ///Get the SDL surface associated with the window.
  Surface GetWindowSurface() {
    final SDL_GetWindowSurface = _sdllib
        .lookup<NativeFunction<sld_getwindowsurface_func>>(
            'SDL_GetWindowSurface')
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
        .lookup<NativeFunction<sld_getwindowbrightness_func>>(
            "SDL_GetWindowBrightness")
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
        .lookup<NativeFunction<sld_getwindowdisplayindex_func>>(
            "SDL_GetWindowDisplayIndex")
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
        .lookup<NativeFunction<sld_getwindowdisplaymode_func>>(
            "SDL_GetWindowDisplayMode")
        .asFunction<dart_SDL_GetWindowDisplayMode>();
    Pointer<DisplayModeStruct> displaymode = calloc<DisplayModeStruct>();
    final desktopdisplaymode =
        SDL_GetWindowDisplayMode(_window_internal, displaymode);
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
        .lookup<NativeFunction<sld_getwindowopacity_func>>(
            "SDL_GetWindowOpacity")
        .asFunction<dart_SDL_GetWindowOpacity>();
    Pointer<Float> op = calloc();
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
    Pointer<Utf8> namepointer = "testdatapointer".toNativeUtf8();
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
    final SDL_GetWindowId = _sdllib
        .lookup<NativeFunction<sdl_getwindowid_func>>("SDL_GetWindowID")
        .asFunction<dart_SDL_GetWindowId>();
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
    Pointer<Uint32> w = calloc();
    Pointer<Uint32> h = calloc();
    SDL_GetWindowSize(_window_internal, w, h);
    return {"width": w.cast<Int32>().value, "heigth": h.cast<Int32>().value};
  }

  ///Use this function to get the maximum size of a window's client area.
  ///
  ///may be 0

  Map<String, int> GetWindowMaximumSize() {
    final SDL_GetWindowMaxSize = _sdllib
        .lookup<NativeFunction<sdl_getwindowmaxsize_func>>(
            "SDL_GetWindowMaximumSize")
        .asFunction<dart_SDL_GetWindowMaxSize>();
    Pointer<Uint32> w = calloc();
    Pointer<Uint32> h = calloc();
    SDL_GetWindowMaxSize(_window_internal, w, h);
    return {"width": w.cast<Int32>().value, "heigth": h.cast<Int32>().value};
  }

  ///Use this function to get the minimun size of a window's client area.
  ///
  ///may be 0

  Map<String, int> GetWindowMinimumSize() {
    final SDL_GetWindowMinSize = _sdllib
        .lookup<NativeFunction<sdl_getwindowminsize_func>>(
            "SDL_GetWindowMinimumSize")
        .asFunction<dart_SDL_GetWindowMinSize>();
    Pointer<Uint32> w = calloc();
    Pointer<Uint32> h = calloc();
    SDL_GetWindowMinSize(_window_internal, w, h);
    return {"width": w.cast<Int32>().value, "heigth": h.cast<Int32>().value};
  }

  ///Use this function to get the pixel format associated with the window.
  ///
  ///Returns the pixel format of the window on success or SDL_PIXELFORMAT_UNKNOWN
  ///on failure; call SDL_GetError() for more information.

  int GetWindowPixelFormat() {
    final SDL_GetWindowPixelFormat = _sdllib
        .lookup<NativeFunction<sdl_getwindowpixelformat_func>>(
            "SDL_GetWindowPixelFormat")
        .asFunction<dart_SDL_GetWindowPixelFormat>();
    int pf = SDL_GetWindowPixelFormat(_window_internal);
    return pf;
  }

  ///Use this function to get the position of a window.
  ///
  ///

  Map<String, int> GetWindowPosition() {
    final SDL_GetWindowPosition = _sdllib
        .lookup<NativeFunction<sdl_getwindowposition_func>>(
            "SDL_GetWindowPosition")
        .asFunction<dart_SDL_GetWindowPosition>();
    Pointer<Uint32> x = calloc();
    Pointer<Uint32> y = calloc();
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
    return title.toDartString();
  }

  ///Use this function to hide a window.
  ///
  ///

  void HideWindow() {
    final SDL_HideWindow = _sdllib
        .lookup<NativeFunction<sdl_hidewindow_func>>("SDL_HideWindow")
        .asFunction<dart_SDL_HideWindow>();
    SDL_HideWindow(_window_internal);
  }

  ///Use this function to check whether the screensaver is currently enabled.
  ///
  ///Returns SDL_TRUE if the screensaver is enabled, SDL_FALSE if it is disabled.

  bool IsScreenSaverEnabled() {
    final SDL_IsScreenSaverEnabled = _sdllib
        .lookup<NativeFunction<sdl_isscreensaverenabled_func>>(
            "SDL_IsScreenSaverEnabled")
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
    final SDL_RaiseWindow = _sdllib
        .lookup<NativeFunction<sdl_raisewindow_func>>("SDL_RaiseWindow")
        .asFunction<dart_SDL_RaiseWindow>();
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
    SDL_SetWindowTitle(_window_internal, title.toNativeUtf8());
  }

  ///Use this function to set the border state of a window.
  ///
  ///bordered=FALSE to remove border, TRUE to add border
  ///
  ///This will add or remove the window's SDL_WINDOW_BORDERLESS flag and add or
  ///remove the border from the actual window. This is a no-op if the window's
  ///border already matches the requested state.
  ///You can't change the border state of a fullscreen window.

  void SetWindowBordered(bool bordered) {
    final SDL_SetWindowBordered = _sdllib
        .lookup<NativeFunction<sdl_setwindowbordered_func>>(
            "SDL_SetWindowBordered")
        .asFunction<dart_SDL_SetWindowBordered>();
    SDL_SetWindowBordered(_window_internal, bordered ? 1 : 0);
  }

  ///Use this function to set a window's fullscreen state
  ///
  ///flags=SDL_WINDOW_FULLSCREEN, SDL_WINDOW_FULLSCREEN_DESKTOP or 0
  ///
  ///flags may be SDL_WINDOW_FULLSCREEN, for "real" fullscreen with a videomode
  ///change; SDL_WINDOW_FULLSCREEN_DESKTOP for "fake" fullscreen that takes the
  ///size of the desktop; and 0 for windowed mode.

  void SetWindowFullscreen(int flags) {
    final SDL_SetWindowfullscreen = _sdllib
        .lookup<NativeFunction<sdl_setwindowfullscreen_func>>(
            "SDL_SetWindowFullscreen")
        .asFunction<dart_SDL_SetWindowFullscreen>();
    int v = SDL_SetWindowfullscreen(_window_internal, flags);
    if (v != 0) {
      throw dartSDL.SDL_GetError();
    }
  }

  ///Use this function to set the brightness (gamma multiplier) for the display that owns a given window.
  ///
  ///[double]brightness the brightness (gamma multiplier) value to set where 0.0 is completely dark and 1.0 is normal brightness
  ///
  void SetWindowBrightness(double brightness) {
    final SDL_SetWindowBrightness = _sdllib
        .lookup<NativeFunction<sld_setwindowbrightness_func>>(
            "SDL_SetWindowBrightness")
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
        .lookup<NativeFunction<sld_setwindowopacity_func>>(
            "SDL_SetWindowOpacity")
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

    Pointer<Utf8> namepointer = variable.toNativeUtf8();
    Pointer<Int32> datapointer = Pointer.fromAddress(data);
    SDL_SetWindowData(_window_internal, namepointer, datapointer);
    //return Utf8.fromUtf8(namepointer);
  }

  void SetWindowDisplayMode(DisplayMode dm) {
    final SDL_SetWindowDisplayMode = _sdllib
        .lookup<NativeFunction<sdl_setwindowdisplaymode_func>>(
            "SDL_SetWindowDisplayMode")
        .asFunction<dart_SDL_SetWindowDisplayMode>();

    DisplayModeStruct dps = DisplayModeStruct.calloc(
        dm.format, dm.width, dm.heigth, dm.refresh_rate, 0);
    SDL_SetWindowDisplayMode(_window_internal, dps.addressOf);
    //return Utf8.fromUtf8(namepointer);
  }

  ///Use this function to hide a window.
  ///
  ///

  void ShowWindow() {
    final SDL_ShowWindow = _sdllib
        .lookup<NativeFunction<sdl_showwindow_func>>("SDL_ShowWindow")
        .asFunction<dart_SDL_ShowWindow>();
    SDL_ShowWindow(_window_internal);
  }
}
