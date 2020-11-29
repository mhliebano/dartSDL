import 'dart:ffi' as ffi;

//SDL INITIALIZATION
typedef sdl_init_func = ffi.Int32 Function(ffi.Int32 a);
typedef dart_SDL_Init = int Function(int a);
typedef sdl_quit_func = ffi.Void Function();
typedef dart_SDL_Quit = void Function();
//TODO SDL INITIALIZATION
//
// SDL_InitSubSystem
// SDL_QuitSubSystem
// SDL_SetMainReady
// SDL_WasInit
// SDL_WinRTRunApp
//
