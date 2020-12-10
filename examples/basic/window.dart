import 'dart:io';
import 'package:dartSDL/dartSDL.dart';

void main() async {
  //Objetos

  Window window = Window();
  window.setDimension(800, 600); //Seteo parametros de la ventana
  window.setWindowFlag = Window.SDL_WINDOW_FLAG;

  dartSDL.SDL_Init(); //Se inicializa el SDL
  window.SDL_CreateWindow("Ventana SDL"); //Creo la Ventana
  print(window.SDL_GetWindowId());
  sleep(Duration(seconds: 5));

  print(window.SDL_GetWindowFlags());
  // window.SDL_SetWindowData("testdatapointer", 1234);
  // print(window.SDL_GetWindowData());

  //print(window.SDL_GetWindowDisplayIndex());
  //DisplayMode dm = window.SDL_GetWindowDisplayMode();
  //print(dm.width);
  DisplayMode initDM = window.SDL_GetWindowDisplayMode();
  print("initDM ${initDM.format},${initDM.width}");
  sleep(Duration(seconds: 5));
  Display vdo = Display();
  DisplayMode displayMode = vdo.SDL_GetDisplayMode(0, 40);
  window.SDL_SetWindowDisplayMode(displayMode);
  initDM = window.SDL_GetWindowDisplayMode();
  print("newDM ${initDM.format} ${initDM.width}");
  sleep(Duration(seconds: 5));
  window.SDL_DestroyWindow(); //Elimino la ventana
  dartSDL.SDL_Quit(); //Salgo del Programa
}
