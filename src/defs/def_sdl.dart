import 'dart:ffi';
import '../../lib-ffi/ffi.dart';

//SDL INITIALIZATION
typedef sdl_init_func = Int32 Function(Int32 a);
typedef dart_SDL_Init = int Function(int a);
typedef sdl_quit_func = Void Function();
typedef dart_SDL_Quit = void Function();
typedef sdl_geterror_func = Pointer<Utf8> Function();
typedef dart_SDL_GetError = Pointer<Utf8> Function();
//
//SDL Functions
typedef sdl_getnumdisplaymodes_func = Int32 Function(Int32 displayIndex);
typedef dart_SDL_GetNumDisplayModes = int Function(int displayIndex);
typedef sdl_getnumvideodisplays_func = Int32 Function();
typedef dart_SDL_GetNumVideoDisplays = int Function();

//SDL_DisableScreenSaver(void)
typedef sdl_disablescreensaver_func = Void Function();
typedef dart_SDL_DisableScreenSaver = void Function();
