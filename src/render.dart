import 'dart:ffi';
import 'def_render.dart';

class Renderer {
  DynamicLibrary _sdllib;
  Pointer<Uint64> _render_internal = null;
  int SDL_RENDERER_SOFTWARE = 0x00000001; /**< The renderer is a software fallback */
  int SDL_RENDERER_ACCELERATED = 0x00000002; /**< The renderer uses hardwareacceleration> */
  int SDL_RENDERER_PRESENTVSYNC = 0x00000004; /**< Present is synchronized with the refresh rate */
  int SDL_RENDERER_TARGETTEXTURE = 0x00000008;

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

  int SDL_SetRenderDrawColor(int r, int g, int b, int a) {
    final SDL_SetRenderDrawColor = _sdllib
        .lookup<NativeFunction<sdl_setrenderdrawcolor_func>>('SDL_SetRenderDrawColor')
        .asFunction<dart_SDL_SetRenderDrawColor>();
    SDL_SetRenderDrawColor(_render_internal, r, g, b, a);
  }
}
