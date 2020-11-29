import 'src/dartSDL.dart';

void main() async {
  DartSDL sdl = DartSDL();
  bool run = true;
  Window w = Window(sdl.sdllib);
  w.setWindowFlag = w.SDL_WINDOW_FLAG;
  w.setDimension(400, 300);
  Renderer r = Renderer(sdl.sdllib);

  sdl.SDL_Init();
  w.SDL_CreateWindow("Miwindow", 0);
  r.SDL_CreateRenderer(w.window);
  r.SDL_SetRenderDrawColor(255, 0, 0, 0);
  // await Future.delayed(const Duration(seconds: 5), () => null);
  // w.SDL_SetWindowSize(800, 600);
  // w.SDL_SetWindowTitle("Mas Grande");
  DateTime start = DateTime.now();
  while (run) {
    if (DateTime.now().difference(start).inSeconds == 10) {
      print("fin");
      run = false;
    }
  }
  r.SDL_DestroyRenderer();
  w.SDL_DestroyWindow();
  sdl.SDL_Quit();
}
