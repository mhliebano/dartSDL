import 'src/dartSDL.dart';

void main() async {
  DartSDL sdl = DartSDL();

  Window w = Window(sdl.sdllib);
  w.setWindowFlag = w.SDL_WINDOW_OPENGL;
  w.setDimension(400, 300);
  sdl.SDL_Init();

  w.SDL_CreateWindow("Miwindow", 0);

  await Future.delayed(const Duration(seconds: 5), () => null);
  w.SDL_SetWindowSize(800, 600);
  await Future.delayed(const Duration(seconds: 5), () => null);
  w.SDL_DestroyWindow();
  sdl.SDL_Quit();
}
