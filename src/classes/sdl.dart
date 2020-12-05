import 'dart:ffi';
import '../defs/def_sdl.dart';

class DartSDL {
  static const SDL_INIT_VIDEO = 0x00000020;
  static const SDL_INIT_AUDIO = 0x00000010;
  static const SDL_INIT_TIMER = 0x00000001;
  static const SDL_INIT_JOYSTICK = 0x00000200;
  static const SDL_INIT_HAPTIC = 0x00001000;
  static const SDL_INIT_GAMECONTROLLER = 0x00002000;
  static const SDL_INIT_EVENTS = 0x00004000;
  static const SDL_INIT_SENSOR = 0x00008000;
  static const SDL_INIT_NOPARACHUTE = 0x00100000;

  DynamicLibrary _sdllib;
  get sdllib => _sdllib;

  int _sdl_internal = 0;

  DartSDL() {
    // Abro la libreria
    String path = "./libs/libSDL2-2.0.so.0.9.0";
    _sdllib = DynamicLibrary.open(path);
  }

  void SDL_Init() {
    final SDL_Init = _sdllib.lookup<NativeFunction<sdl_init_func>>('SDL_Init').asFunction<dart_SDL_Init>();
    _sdl_internal = SDL_Init(SDL_INIT_VIDEO | SDL_INIT_AUDIO);
    if (_sdl_internal != 0) {
      throw ("No se pudo inicializar el SDL");
    }
  }

  void SDL_Quit() {
    final SDL_Quit = _sdllib.lookup<NativeFunction<sdl_quit_func>>('SDL_Quit').asFunction<dart_SDL_Quit>();
    SDL_Quit();
  }

  int SDL_GetNumDisplayModes(int index) {
    final SDL_GetNumDisplaysModes = _sdllib
        .lookup<NativeFunction<sdl_getnumdisplaymodes_func>>('SDL_GetNumDisplayModes')
        .asFunction<dart_SDL_GetNumDisplayModes>();
    return SDL_GetNumDisplaysModes(index);
  }

  int SDL_GetNumVideoDisplays() {
    final SDL_GetNumVideoDisplays = _sdllib
        .lookup<NativeFunction<sdl_getnumvideodisplays_func>>('SDL_GetNumVideoDisplays')
        .asFunction<dart_SDL_GetNumVideoDisplays>();
    return SDL_GetNumVideoDisplays();
  }
}
