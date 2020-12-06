import 'dart:io';
import '../../src/dartSDL.dart';

void main() async {
  //Objetos
  int display_in_use = 0; /* Only using first display */

  int num_video_displays, display_mode_count;
  //SDL_DisplayMode mode;
  //Uint32 f;
  dartSDL.SDL_Init();

  num_video_displays = dartSDL.SDL_GetNumVideoDisplays();
  print("SDL_GetNumVideoDisplays: ${num_video_displays}");

  display_mode_count = dartSDL.SDL_GetNumDisplayModes(display_in_use);
  if (display_mode_count < 1) {
    print("SDL_GetNumDisplayModes failed: ${dartSDL.SDL_GetError()}");
    exit(1);
  }
  print("SDL_GetNumDisplayModes: ${display_mode_count}");

  for (int i = 0; i < display_mode_count; ++i) {
    DisplayMode displayMode = dartSDL.SDL_GetDisplayMode(display_in_use, i);
    print("Mode:$i, ${displayMode.width},${displayMode.heigth}");
    //f = mode.format;

    //SDL_Log("Mode %i\tbpp %i\t%s\t%i x %i", i, SDL_BITSPERPIXEL(f), SDL_GetPixelFormatName(f), mode.w, mode.h);
  }
  dartSDL.SDL_Quit();
}
