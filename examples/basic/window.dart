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

  window.GL_CreateContext();
  print(window.GL_GetCurrentContext());

  print(window.GL_GetAttibute(GL_Attr.SDL_GL_BLUE_SIZE));

  Window.GL_ResetAttributes();
  //window = Window.CreateWindow("Ventana SDL 1", 0, 0, 800, 600, WindowFlags.SDL_WINDOW_OPENGL); //Creo la Ventana
  //renderer = Renderer.CreateRenderer(window);

  print(window.GL_GetSwapInterval());
  print(window.GL_GetAttibute(GL_Attr.SDL_GL_RED_SIZE));
  window.SetWindowBordered(false);
  sleep(Duration(seconds: 5));
  window.SetWindowBordered(true);
  sleep(Duration(seconds: 5));
  //renderer.DestroyRenderer();
  window.DestroyWindow(); //Elimino la ventana

  dartSDL.SDL_Quit(); //Salgo del Programa
}
