import 'src/dartSDL.dart';

void main() async {
  DartSDL sdl = DartSDL();

  Window w = Window(sdl.sdllib);
  w.setWindowFlag = w.SDL_WINDOW_OPENGL;
  w.setDimension(400, 300);
  Renderer r = Renderer(sdl.sdllib);

  sdl.SDL_Init();

  w.SDL_CreateWindow("Miwindow", 0);
  r.SDL_CreateRenderer(w.window);

  await Future.delayed(const Duration(seconds: 5), () => null);
  w.SDL_SetWindowSize(800, 600);
  w.SDL_SetWindowTitle("Mas Grande");
  await Future.delayed(const Duration(seconds: 5), () => null);
  r.SDL_DestroyRenderer();
  w.SDL_DestroyWindow();
  sdl.SDL_Quit();
}
