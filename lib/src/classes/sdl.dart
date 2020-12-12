import 'dart:ffi';
import 'dart:io';

import 'package:dartSDL/src/classes/window.dart';
import 'package:ffi/ffi.dart';

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

  int _sdl_internal;

  DartSDL() {
    String pathsdllib = Directory.current.path;
    _sdllib = DynamicLibrary.open("$pathsdllib/libsdl/libSDL2-2.0.so.0.9.0");
  }

  void SDL_Init({int flags}) {
    final SDL_Init = _sdllib.lookup<NativeFunction<sdl_init_func>>('SDL_Init').asFunction<dart_SDL_Init>();
    if (flags == null) {
      flags = 0;
    }
    _sdl_internal = SDL_Init(flags);
    if (_sdl_internal != 0) {
      throw ("No se pudo inicializar el SDL");
    }
  }

  void SDL_Quit() {
    final SDL_Quit = _sdllib.lookup<NativeFunction<sdl_quit_func>>('SDL_Quit').asFunction<dart_SDL_Quit>();
    SDL_Quit();
  }

  ///
  void SDL_InitSubSystem(int flag) {
    final SDL_InitSubSystem = _sdllib
        .lookup<NativeFunction<sdl_initsubsystem_func>>('SDL_InitSubSystem')
        .asFunction<dart_SDL_InitSubSystem>();
    _sdl_internal = SDL_InitSubSystem(flag);
    if (_sdl_internal != 0) {
      print(SDL_GetError());
    }
  }

  void SDL_QuitSubSystem(int flag) {
    final SDL_QuitSubSystem = _sdllib
        .lookup<NativeFunction<sdl_quitsubsystem_func>>('SDL_QuitSubSystem')
        .asFunction<dart_SDL_QuitSubSystem>();
    SDL_QuitSubSystem(flag);
  }

  ///Use this function to get a mask of the specified subsystems which have previously been initialized.
  ///
  ///If flags is 0 it returns a mask of all initialized subsystems, otherwise it returns the initialization status of the specified subsystems.
  ///
  int SDL_WasInit({int flag}) {
    final SDL_WasInit = _sdllib.lookup<NativeFunction<sdl_wasinit_func>>("SDL_WasInit").asFunction<dart_SDL_WasInit>();
    if (flag == null) {
      flag = 0;
    }
    int subsysteminit = SDL_WasInit(flag);
    return subsysteminit;
  }

  String SDL_GetError() {
    final SDL_GetError =
        _sdllib.lookup<NativeFunction<sdl_geterror_func>>('SDL_GetError').asFunction<dart_SDL_GetError>();
    final error = SDL_GetError();
    return (Utf8.fromUtf8(error));
  }

  Window SDL_GetWindowFromId(int id) {
    final SDL_GetWindowFromId = _sdllib
        .lookup<NativeFunction<sdl_getwindowfromid_func>>('SDL_GetWidnowFromId')
        .asFunction<dart_SDL_GetWindowFromId>();
    Pointer<Uint64> window = SDL_GetWindowFromId(id);
    if (window == null) {
      throw ("La ventana no existe");
    } else {
      return Window();
    }
  }
}
