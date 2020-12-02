import 'src/dartSDL.dart';
import 'src/display.dart';

void main() async {
  DartSDL sdl = DartSDL();
  bool run = true;
  Window w = Window(sdl.sdllib);
  w.setWindowFlag = w.SDL_WINDOW_FLAG;
  w.setDimension(400, 300);
  Renderer r = Renderer(sdl.sdllib);
  Display ds = Display(sdl.sdllib);

  Surface s = Surface.SDL_CreateRGBSurface(400, 300, 0, 0, 0, 0, sdl.sdllib);
  print(s.refcount);
  //s.SDL_CreateRGBSurface(0, 400, 300, 0, 0, 0, 255);

  sdl.SDL_Init();
  print(sdl.SDL_GetNumVideoDisplays());
  print(sdl.SDL_GetNumDisplayModes(1));
  w.SDL_CreateWindow("Mi Window", 0);
  r.SDL_CreateRenderer(w.window);

  // await Future.delayed(const Duration(seconds: 5), () => null);
  // w.SDL_SetWindowSize(800, 600);
  // w.SDL_SetWindowTitle("Mas Grande");
  DateTime start = DateTime.now();
  while (run) {
    if (DateTime.now().difference(start).inSeconds == 2) {
      print("fin");
      run = false;
    }
    r.SDL_SetRenderDrawColor(255, 0, 0, 0);
  }
  r.SDL_DestroyRenderer();
  w.SDL_DestroyWindow();
  sdl.SDL_Quit();
}
