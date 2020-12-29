import 'dart:ffi';

class GL_Context {
  Pointer<Uint64> _context;
  get context => _context;
  get idContext => _context.address;
  GL_Context.fromPointer(Pointer<Uint64> p) {
    _context = p;
  }
}
