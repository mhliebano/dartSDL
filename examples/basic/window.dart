import 'dart:io';
import 'package:dartSDL/dartSDL.dart';

void main() async {
  //Objetos

  Window window = Window();
  window.setDimension(800, 600); //Seteo parametros de la ventana
  window.setWindowFlag = Window.SDL_WINDOW_FLAG;

  dartSDL.SDL_Init(); //Se inicializa el SDL
  window.CreateWindow("Ventana SDL"); //Creo la Ventana
  print(window.GetWindowId());
  sleep(Duration(seconds: 5));

  print(window.GetWindowFlags());
  print(window.GetWindowPosition());

  // window.SDL_SetWindowData("testdatapointer", 1234);
  // print(window.SDL_GetWindowData());

  //print(window.SDL_GetWindowDisplayIndex());
  //DisplayMode dm = window.SDL_GetWindowDisplayMode();
  //print(dm.width);
  DisplayMode initDM = window.GetWindowDisplayMode();
  print("initDM ${initDM.format},${initDM.width}");
  sleep(Duration(seconds: 5));
  Display vdo = Display();
  DisplayMode displayMode = vdo.GetDisplayMode(0, 40);
  window.SetWindowDisplayMode(displayMode);
  initDM = window.GetWindowDisplayMode();
  print("newDM ${initDM.format} ${initDM.width}");
  sleep(Duration(seconds: 5));
  window.DestroyWindow(); //Elimino la ventana
  dartSDL.SDL_Quit(); //Salgo del Programa
}
