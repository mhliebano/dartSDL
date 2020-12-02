import 'dart:ffi';
import 'class_struct/pixel_format_struct.dart';
import 'class_struct/rect_struct.dart';
import 'class_struct/surface_struct.dart';
import 'defs/def_surface.dart';

class Surface {
  //TODO implementar resto de las propiedades

  get heigth => _s.ref.h;
  get width => _s.ref.w;

  get refcount => _s.ref.refcount;
  set refcount(int r) {
    _s.ref.refcount = r;
  }

  //Rect _r;
  Pointer<RectStruct> get rect => _s.ref.SDL_Rect;
  Pointer<PixelFormatStruct> get pixelFormat => _s.ref.SDL_PixelFormat;

  Pointer<SurfaceStruct> _s;
  Surface._default(Pointer<SurfaceStruct> s) {
    _s = s;
  }

  factory Surface.SDL_CreateRGBSurface(int width, int height, int r, int g, int b, int a, DynamicLibrary sdllib) {
    final SDL_CreateRGBSurface = sdllib
        .lookup<NativeFunction<sdl_creatergbsurface_func>>('SDL_CreateRGBSurface')
        .asFunction<dart_SDL_CreateRGBSurface>();
    Pointer<SurfaceStruct> _surface_internal = SDL_CreateRGBSurface(0, width, height, 32, r, g, b, a);
    if (_surface_internal == null) {
      throw ("No se pudo crear la Surface");
    }
    return Surface._default(_surface_internal);
  }

  factory Surface.SDL_CreateRGBSurfaceFrom(Pointer<SurfaceStruct> surface, DynamicLibrary sdllib) {
    final SDL_CreateRGBSurfaceFrom = sdllib
        .lookup<NativeFunction<sdl_creatergbsurfacefrom_func>>('SDL_CreateRGBSurfaceFrom')
        .asFunction<dart_SDL_CreateRGBSurfaceFrom>();
    Pointer<SurfaceStruct> _surface_internal =
        SDL_CreateRGBSurfaceFrom(surface.ref.pixels, surface.ref.w, surface.ref.h, 32, surface.ref.pitch, 0, 0, 0, 0);
    if (_surface_internal == null) {
      throw ("No se pudo crear la Surface");
    }
    return Surface._default(_surface_internal);
  }
}
