import 'dart:ffi';
import 'dart:typed_data';
import 'package:dartSDL/src/class_struct/renderer_struct.dart';
import 'package:dartSDL/src/classes/render_info.dart';
import 'package:ffi/ffi.dart';

import '../../dartSDL.dart';
import '../defs/def_render.dart';

class Renderer {
  DynamicLibrary _sdllib;

  static final SDL_RENDERER_SOFTWARE =
      0x00000001; /**< The renderer is a software fallback */
  static final SDL_RENDERER_ACCELERATED =
      0x00000002; /**< The renderer uses hardwareacceleration> */
  static final SDL_RENDERER_PRESENTVSYNC =
      0x00000004; /**< Present is synchronized with the refresh rate */
  static final SDL_RENDERER_TARGETTEXTURE = 0x00000008;

  Pointer<Uint64> _render_internal = null;

  Renderer() {
    _sdllib = dartSDL.sdllib;
  }

  factory Renderer.fromPointer(Pointer<Uint64> r) {
    Renderer rd = Renderer();
    rd._render_internal = r;
    return rd;
  }

  ///Use this function to create a 2D rendering context for a window.
  ///
  ///window=the window where rendering is displayed
  ///index=the index of the rendering driver to initialize, or -1 to initialize the first one supporting the requested flags
  ///flags=0, or one or more SDL_RendererFlags OR'd together;
  ///
  ///Returns a valid rendering context or NULL if there was an error
  ///
  Renderer.CreateRenderer(Window window,
      {int indexDriver: -1, int flag_renderer: 0}) {
    _sdllib = dartSDL.sdllib;
    final SDL_CreateRenderer = _sdllib
        .lookup<NativeFunction<sdl_createrenderer_func>>('SDL_CreateRenderer')
        .asFunction<dart_SDL_CreateRenderer>();
    _render_internal =
        SDL_CreateRenderer(window.windowPointer, indexDriver, flag_renderer);
    if (_render_internal == null) {
      throw (dartSDL.SDL_GetError());
    }
  }

  RendererInfo GetRendererInfo() {
    final SDL_GetRendererInfo = _sdllib
        .lookup<NativeFunction<sdl_getrendererinfo_func>>("SDL_GetRendererInfo")
        .asFunction<dart_SDL_GetRendererInfo>();

    Pointer<RendererStruct> info = calloc<RendererStruct>(1024);
    int v = SDL_GetRendererInfo(_render_internal, info);
    if (v != 0) {
      throw dartSDL.SDL_GetError();
    } else {
      return RendererInfo(
          name: info.ref.name.toDartString(),
          flags: info.ref.flags,
          maxTextureHeight: info.ref.max_texture_height,
          maxTextureWidth: info.ref.max_texture_width,
          numTextureFormats: info.ref.num_texture_formats,
          textureFormats: info.ref.texture_formats
              .cast<Int32>()
              .asTypedList(16)
              .buffer
              .asInt32List(64)
              .toList());
    }
  }

  void DestroyRenderer() {
    final SDL_DestroyWindow = _sdllib
        .lookup<NativeFunction<sdl_destroyrenderer_func>>('SDL_DestroyRenderer')
        .asFunction<dart_SDL_DestroyRenderer>();
    SDL_DestroyWindow(_render_internal);
  }

  int SDL_SetRenderDrawColor(int r, int g, int b, int a) {
    final SDL_SetRenderDrawColor = _sdllib
        .lookup<NativeFunction<sdl_setrenderdrawcolor_func>>(
            'SDL_SetRenderDrawColor')
        .asFunction<dart_SDL_SetRenderDrawColor>();
    return SDL_SetRenderDrawColor(_render_internal, r, g, b, a);
  }
}
