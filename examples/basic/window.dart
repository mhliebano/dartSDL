import 'dart:io';

import '../../src/dartSDL.dart';
import '../../src/defs/def_sdl.dart';

void main() async {
  //Objetos
  Window window = Window();
  window.setDimension(800, 600); //Seteo parametros de la ventana

  print(dartSDL.SDL_GetNumVideoDisplays());

  dartSDL.SDL_Init(); //Se inicializa el SDL
  window.SDL_CreateWindow("Ventana SDL"); //Creo la Ventana
  print(dartSDL.SDL_GetNumDisplayModes(0));
  sleep(Duration(seconds: 5));

  window.SDL_DestroyWindow(); //Elimino la ventana

  dartSDL.SDL_Quit(); //Salgo del Programa
}
