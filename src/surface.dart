import 'dart:ffi';
import 'def_surface.dart';

class Surface {
  int _heigth;
  int _width;
  int _refcount;
  get heigth => _heigth;
  get width => _width;

  get refcount => _refcount;
  set refcount(int r) {
    _refcount = r;
  }

  Surface._default(this._width, this._heigth, this._refcount);

  factory Surface.SDL_CreateRGBSurface(int width, int height, int r, int g, int b, int a, DynamicLibrary sdllib) {
    final SDL_CreateRGBSurface = sdllib
        .lookup<NativeFunction<sdl_creatergbsurface_func>>('SDL_CreateRGBSurface')
        .asFunction<dart_SDL_CreateRGBSurface>();
    Pointer<SurfaceStruct> _surface_internal = SDL_CreateRGBSurface(0, width, height, 32, r, g, b, a);
    return Surface._default(_surface_internal.ref.w, _surface_internal.ref.h, _surface_internal.ref.refcount);
  }
}
