import 'dart:io';
import 'package:dartSDL/dartSDL.dart';

void main() async {
  //Objetos

  Window window = Window();
  window.setDimension(800, 600); //Seteo parametros de la ventana
  window.setWindowFlag = Window.SDL_WINDOW_OPENGL;

  dartSDL.SDL_Init(); //Se inicializa el SDL
  window.CreateWindow("Ventana SDL 1"); //Creo la Ventana

  GL_Context gl1 = window.GL_CreateContext();
  print(gl1.idContext);

  print(window.GL_GetDrawableSize());

  sleep(Duration(seconds: 3));

  window.GL_DeleteContext(gl1);

  window.DestroyWindow(); //Elimino la ventana

  dartSDL.SDL_Quit(); //Salgo del Programa
}
