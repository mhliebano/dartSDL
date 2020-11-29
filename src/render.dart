import 'dart:ffi';
import 'def_render.dart';

class Renderer {
  DynamicLibrary _sdllib;
  Pointer<Uint64> _render_internal = null;
  static const int SDL_RENDERER_SOFTWARE = 0x00000001; /**< The renderer is a software fallback */
  static const int SDL_RENDERER_ACCELERATED = 0x00000002; /**< The renderer uses hardwareacceleration */
  static const int SDL_RENDERER_PRESENTVSYNC = 0x00000004; /**< Present is synchronized with the refresh rate */
  static const int SDL_RENDERER_TARGETTEXTURE = 0x00000008;

  int _sdl_renderer_flag = 1;
  set setRendererFlag(int f) {
    _sdl_renderer_flag = f;
  }

  Renderer(DynamicLibrary lib) {
    _sdllib = lib;
  }
  SDL_CreateRenderer(Pointer<Uint64> window) {
    final SDL_CreateRenderer = _sdllib
        .lookup<NativeFunction<sdl_createrenderer_func>>('SDL_CreateRenderer')
        .asFunction<dart_SDL_CreateRenderer>();
    _render_internal = SDL_CreateRenderer(window, 0, _sdl_renderer_flag);
    if (_render_internal == null) {
      throw ("No se pudo crear el render");
    }
  }

  void SDL_DestroyRenderer() {
    final SDL_DestroyWindow = _sdllib
        .lookup<NativeFunction<sdl_destroyrenderer_func>>('SDL_DestroyRenderer')
        .asFunction<dart_SDL_DestroyRenderer>();
    SDL_DestroyWindow(_render_internal);
  }
}
