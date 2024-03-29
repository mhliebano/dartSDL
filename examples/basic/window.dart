import 'dart:io';
import 'package:dartSDL/dartSDL.dart';

void main() async {
  //Objetos

  Window window;
  Renderer renderer;

  dartSDL.SDL_Init(flags: DartSDL.SDL_INIT_VIDEO); //Se inicializa el SDL

  window = Window.CreateWindow(
      "SDL",
      WINDOWPOS.SDL_WINDOWPOS_CENTERED_MASK,
      WINDOWPOS.SDL_WINDOWPOS_CENTERED_MASK,
      800,
      600,
      WindowFlags.SDL_WINDOW_OPENGL);

  renderer = Renderer.CreateRenderer(window);
  print(window.GetWindowPixelFormat());
  sleep(Duration(seconds: 5));
  renderer.DestroyRenderer();
  window.DestroyWindow(); //Elimino la ventana
  dartSDL.SDL_Quit(); //Salgo del Programa
}
