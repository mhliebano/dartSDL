import 'dart:ffi';

import '../class_struct/pixel_format_struct.dart';
import 'palette.dart';

class PixelFormat {
  int _format;
  get format => _format;
  set format(int f) {
    _format = f;
  }

  int _bitsperpixel;
  get bitsperpixel => _bitsperpixel;
  set bitsperpixel(int f) {
    _bitsperpixel = f;
  }

  int _bytesperpixel;
  get bytesperpixel => _bytesperpixel;
  set bytesperpixel(int f) {
    _bytesperpixel = f;
  }

  int _rmask;
  get rmask => _rmask;
  set rmask(int f) {
    _rmask = f;
  }

  int _gmask;
  get gmask => _gmask;
  set gmask(int f) {
    _gmask = f;
  }

  int _bmask;
  get bmask => _bmask;
  set bmask(int f) {
    _bmask = f;
  }

  int _amask;
  get amask => _amask;
  set amask(int f) {
    _amask = f;
  }

  Palette _palette;
  get palette => _palette;
  set palette(Palette p) {
    _palette = p;
  }

  //Constructor
  PixelFormat._default(Pointer<PixelFormatStruct> p) {
    _format = p.ref.format;
    _bitsperpixel = p.ref.bitsPerPixel;
    _bytesperpixel = p.ref.bytesPerPixel;
    _rmask = p.ref.rmask;
    _gmask = p.ref.gmask;
    _bmask = p.ref.bmask;
    _amask = p.ref.amask;
    _palette = Palette.fromPointer(p.ref.palette);
  }
  factory PixelFormat.fromStruct(Pointer<PixelFormatStruct> pf) {
    return PixelFormat._default(pf);
  }
}
