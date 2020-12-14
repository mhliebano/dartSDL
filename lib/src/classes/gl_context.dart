import 'dart:ffi';

class GL_Context {
  Pointer _context;
  get context => _context;
  get idContext => _context.address;
  GL_Context.fromPointer(Pointer p) {
    _context = p;
  }
}
