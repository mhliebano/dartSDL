import 'dart:io';
import 'package:dartSDL/dartSDL.dart';

void main() async {
  //Objetos
  int display_in_use = 0; /* Only using first display */

  int num_video_displays, display_mode_count;
  //SDL_DisplayMode mode;
  //Uint32 f;
  dartSDL.SDL_Init(flags: DartSDL.SDL_INIT_VIDEO);
  Display display = Display();
  num_video_displays = display.GetNumVideoDisplays();
  print("SDL_GetNumVideoDisplays: ${num_video_displays}");

  display_mode_count = display.GetNumDisplayModes(display_in_use);
  if (display_mode_count < 1) {
    print("SDL_GetNumDisplayModes failed: ${dartSDL.SDL_GetError()}");
    exit(1);
  }
  print("SDL_GetNumDisplayModes: ${display_mode_count}");

  // for (int i = 0; i < display_mode_count; ++i) {
  //   DisplayMode displayMode = display.SDL_GetDisplayMode(display_in_use, i);
  //   print("Mode:$i, ${displayMode.format},${displayMode.width},${displayMode.heigth}");
  //   //f = mode.format;

  //   //SDL_Log("Mode %i\tbpp %i\t%s\t%i x %i", i, SDL_BITSPERPIXEL(f), SDL_GetPixelFormatName(f), mode.w, mode.h);
  // }

  String displayname = display.GetDisplayName(0);
  print("Displayname:, $displayname");

  String drivername = display.GetCurrentVideoDriver();
  print("Driver:  $drivername");

  int numdriver = display.GetNumVideoDrivers();
  print("Number Drivers:  $numdriver");

  print("Drivers Avaibles");
  for (int i = 0; i < numdriver; i++) {
    print("$i) ${display.GetVideoDriver(i)}");
  }

  DisplayMode current_display = display.GetCurrentDisplayMode(0);
  print(current_display.driverdata);
  print("Mode Current:, ${current_display.format},${current_display.width},${current_display.heigth}");

  Rect rect = display.GetDisplayBounds(0);
  print("DisplayBounds:, ${rect.x},${rect.y},${rect.width},${rect.heigth}");

  Rect rectusable = display.GetDisplayUsableBounds(0);
  print("DisplayUsableBounds:, ${rectusable.x},${rectusable.y},${rectusable.width},${rectusable.heigth}");

  dartSDL.SDL_Quit();
}
