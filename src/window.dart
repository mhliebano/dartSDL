import 'dart:ffi';
import '../lib-ffi/ffi.dart';
import 'def_window.dart';

class Window {
  DynamicLibrary _sdllib;
  Pointer<Uint64> _window_internal = null;
  get window => _window_internal;

  int SDL_WINDOW_FULLSCREEN = 0x00000001; /**< fullscreen window */
  int SDL_WINDOW_OPENGL = 0x00000002; /**< window usable with OpenGL context */
  int SDL_WINDOW_SHOWN = 0x00000004; /**< window is visible */
  int SDL_WINDOW_HIDDEN = 0x00000008; /**< window is not visible */
  int SDL_WINDOW_BORDERLESS = 0x00000010; /**< no window decoration */
  int SDL_WINDOW_RESIZABLE = 0x00000020; /**< window can be resized */
  int SDL_WINDOW_MINIMIZED = 0x00000040; /**< window is minimized */
  int SDL_WINDOW_MAXIMIZED = 0x00000080; /**< window is maximized */
  int SDL_WINDOW_INPUT_GRABBED = 0x00000100; /**< window has grabbed input focus */
  int SDL_WINDOW_INPUT_FOCUS = 0x00000200; /**< window has input focus */
  int SDL_WINDOW_MOUSE_FOCUS = 0x00000400; /**< window has mouse focus */
  int SDL_WINDOW_FULLSCREEN_DESKTOP = 0x00000001 | 0x00001000;
  int SDL_WINDOW_FOREIGN = 0x00000800; /**< window not created by SDL */
  int SDL_WINDOW_ALLOW_HIGHDPI = 0x00002000; /**< window should be created in high-DPI mode if supported.**/
  int SDL_WINDOW_MOUSE_CAPTURE = 0x00004000; /**< window has mouse captured (unrelated to INPUT_GRABBED) */
  int SDL_WINDOW_ALWAYS_ON_TOP = 0x00008000; /**< window should always be above others */
  int SDL_WINDOW_SKIP_TASKBAR = 0x00010000; /**< window should not be added to the taskbar */
  int SDL_WINDOW_UTILITY = 0x00020000; /**< window should be treated as a utility window */
  int SDL_WINDOW_TOOLTIP = 0x00040000; /**< window should be treated as a tooltip */
  int SDL_WINDOW_POPUP_MENU = 0x00080000; /**< window should be treated as a popup menu */
  int SDL_WINDOW_VULKAN = 0x10000000; /**< window usable for Vulkan surface */
  int SDL_WINDOW_METAL = 0x20000000; /**< window usable for Metal view */
  int SDL_WINDOW_FLAG = 0x00000000;

  int _sdl_window_flag = 0;
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

  int _w = 0;
  get width => _w;
  set width(int v) {
    _w = v;
  }

  int _h = 0;
  get height => _h;
  set height(int v) {
    _h = v;
  }

  void setPosition(int x, int y) {
    _x = x;
    _y = y;
  }

  void setDimension(int width, int heigth) {
    _w = width;
    _h = heigth;
  }

  Window(DynamicLibrary lib) {
    _sdllib = lib;
  }

  SDL_CreateWindow(String title, int flags) {
    final SDL_CreateWindow =
        _sdllib.lookup<NativeFunction<sdl_createwindow_func>>('SDL_CreateWindow').asFunction<dart_SDL_CreateWindow>();
    _window_internal = SDL_CreateWindow(Utf8.toUtf8(title), _x, _y, _w, _h, _sdl_window_flag);
    if (_window_internal == null) {
      throw ("No se pudo crear la ventana");
    }
  }

  void SDL_DestroyWindow() {
    final SDL_DestroyWindow = _sdllib
        .lookup<NativeFunction<sdl_destroywindow_func>>('SDL_DestroyWindow')
        .asFunction<dart_SDL_DestroyWindow>();
    SDL_DestroyWindow(_window_internal);
  }

  void SDL_SetWindowSize(int width, int heigth) {
    final SDL_SetWindowSize = _sdllib
        .lookup<NativeFunction<sdl_setwindow_size_func>>('SDL_SetWindowSize')
        .asFunction<dart_SDL_SetWindowSize>();
    SDL_SetWindowSize(_window_internal, width, heigth);
  }

  void SDL_SetWindowTitle(String title) {
    final SDL_SetWindowTitle = _sdllib
        .lookup<NativeFunction<sdl_setwindowtitle_func>>('SDL_SetWindowTitle')
        .asFunction<dart_SDL_SetWindowTitle>();
    SDL_SetWindowTitle(_window_internal, Utf8.toUtf8(title));
  }
}
