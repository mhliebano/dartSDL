import 'dart:ffi';
import 'def_display.dart';

class Display {
  DynamicLibrary _sdllib;

  Display(DynamicLibrary lib) {
    _sdllib = lib;
  }
}
