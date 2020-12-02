import 'dart:ffi';

//SDL INITIALIZATION
typedef sdl_init_func = Int32 Function(Int32 a);
typedef dart_SDL_Init = int Function(int a);
typedef sdl_quit_func = Void Function();
typedef dart_SDL_Quit = void Function();
//TODO SDL INITIALIZATION
//
// SDL_InitSubSystem
// SDL_QuitSubSystem
// SDL_SetMainReady
// SDL_WasInit
// SDL_WinRTRunApp
//
//SDL Functions
typedef sdl_getnumdisplaymodes_func = Int32 Function(Int32 displayIndex);
typedef dart_SDL_GetNumDisplayModes = int Function(int displayIndex);
typedef sdl_getnumvideodisplays_func = Int32 Function();
typedef dart_SDL_GetNumVideoDisplays = int Function();
