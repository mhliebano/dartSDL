import 'package:dartSDL/dartSDL.dart';

void main() {
  dartSDL.SDL_Init();
  if (dartSDL.SDL_WasInit() == 0) {
    print("No hay subsistemas Inicializados");
  }
  dartSDL.SDL_InitSubSystem(DartSDL.SDL_INIT_VIDEO);
  int subsystem = DartSDL.SDL_INIT_VIDEO | DartSDL.SDL_INIT_EVENTS;
  if (dartSDL.SDL_WasInit() != 0) {
    print("Se Inicializo un subsistemas");
  }
  if (dartSDL.SDL_WasInit() == subsystem) {
    print("Se Inicializo el subsistema de video (incluye events)");
  }

  dartSDL.SDL_QuitSubSystem(DartSDL.SDL_INIT_VIDEO);
  dartSDL.SDL_Quit();
}
