import 'dart:ffi';
import 'package:ffi/ffi.dart';

//SDL INITIALIZATION
typedef sdl_init_func = Int32 Function(Int32 a);
typedef dart_SDL_Init = int Function(int a);
typedef sdl_quit_func = Void Function();
typedef dart_SDL_Quit = void Function();
typedef sdl_geterror_func = Pointer<Utf8> Function();
typedef dart_SDL_GetError = Pointer<Utf8> Function();

//int SDL_InitSubSystem(Uint32 flags)
typedef sdl_initsubsystem_func = Int32 Function(Int32 flag);
typedef dart_SDL_InitSubSystem = int Function(int flag);

//void SDL_QuitSubSystem(Uint32 flags)
typedef sdl_quitsubsystem_func = Void Function(Int32 flag);
typedef dart_SDL_QuitSubSystem = void Function(int flag);

//Uint32 SDL_WasInit(Uint32 flags)
typedef sdl_wasinit_func = Int32 Function(Int32 flags);
typedef dart_SDL_WasInit = int Function(int flags);

//SDL_Window* SDL_GetWindowFromID(Uint32 id)
typedef sdl_getwindowfromid_func = Pointer<Uint64> Function(Int32 id);
typedef dart_SDL_GetWindowFromId = Pointer<Uint64> Function(int id);
