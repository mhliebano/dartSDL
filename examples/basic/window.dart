import 'dart:io';
import 'package:dartSDL/dartSDL.dart';

void main() async {
  //Objetos

  Window window;
  Renderer renderer;

  dartSDL.SDL_Init(); //Se inicializa el SDL
  window = Window.CreateWindow("Ventana SDL 1", 0, 0, 800, 600, WindowFlags.SDL_WINDOW_OPENGL); //Creo la Ventana
  renderer = Renderer.CreateRenderer(window);

  sleep(Duration(seconds: 5));

  renderer.DestroyRenderer();
  window.DestroyWindow(); //Elimino la ventana

  dartSDL.SDL_Quit(); //Salgo del Programa
}
