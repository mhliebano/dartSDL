import 'package:dartSDL/dartSDL.dart';

void main() async {
  DartSDL sdl = DartSDL();
  bool run = true;
  Window w = Window();
  w.setWindowFlag = Window.SDL_WINDOW_OPENGL;
  w.setDimension(400, 300);
  w.setPosition(50, 50);

  //Renderer r = Renderer(sdl.sdllib);

  Surface s = Surface.SDL_CreateRGBSurface(200, 150, 0, 0, 0, 0, sdl.sdllib);
  print("${s.width},${s.pixelFormat.rmask}");
  s.pixelFormat.rmask = 125;
  print("${s.width},${s.pixelFormat.rmask}");
  sdl.SDL_Init();
  print(sdl.SDL_GetNumVideoDisplays());
  print(sdl.SDL_GetNumDisplayModes(1));
  w.SDL_CreateWindow("Mi Window");
  //Surface sw = w.SDL_GetWindowSurface();
  //print("${sw.width},${sw.heigth}");
  //r.SDL_CreateRenderer(w.window);

  // await Future.delayed(const Duration(seconds: 5), () => null);
  // w.SDL_SetWindowSize(800, 600);
  // w.SDL_SetWindowTitle("Mas Grande");
  DateTime start = DateTime.now();
  while (run) {
    if (DateTime.now().difference(start).inSeconds == 2) {
      print("fin");
      run = false;
    }
    //r.SDL_SetRenderDrawColor(255, 0, 0, 0);
  }
  //r.SDL_DestroyRenderer();
  w.SDL_DestroyWindow();
  sdl.SDL_Quit();
}
