import 'dart:ffi' as ffi;
import 'dart:convert';

typedef sdl_init_func = ffi.Int32 Function(ffi.Int32 a);
typedef SDL_Init = int Function(int a);
typedef sdl_quit_func=ffi.Void Function();
typedef SDL_Quit = void Function();
typedef sdl_createwindow_func = ffi.Int64 Function(ffi.Pointer<ffi.Uint8> title, ffi.Int32 x, ffi.Int32 y, ffi.Int32 w, ffi.Int32 h, ffi.Uint32 flags); 
typedef SDL_CreateWindow = int Function(ffi.Pointer<ffi.Uint8> title, int x, int y, int w, int h, int flags); 
typedef sdl_destroywindow_func=ffi.Void Function(ffi.Int64 window);
typedef SDL_DestroyWindow = void Function(int window);

const SDL_INIT_VIDEO=2;
const SDL_INIT_AUDIO=10;
void main() async{
 // Abro la libreria
  var path = "./libSDL2-2.0.so.0.9.0";
  final sdllib = ffi.DynamicLibrary.open(path);
  
  final dart_SDL_Init = sdllib.lookup<ffi.NativeFunction<sdl_init_func>>('SDL_Init').asFunction<SDL_Init>();
  final dart_SDL_Quit = sdllib.lookup<ffi.NativeFunction<sdl_quit_func>>('SDL_Quit').asFunction<SDL_Quit>();
  final dart_SDL_CreateWindow = sdllib.lookup<ffi.NativeFunction<sdl_createwindow_func>>('SDL_CreateWindow').asFunction<SDL_CreateWindow>();
  final dart_SDL_DestroyWindow=sdllib.lookup<ffi.NativeFunction<sdl_destroywindow_func>>('SDL_DestroyWindow').asFunction<SDL_DestroyWindow>();
  int w;
  if (dart_SDL_Init(SDL_INIT_VIDEO|SDL_INIT_AUDIO) != 0) {
        print("Unable to initialize SDL");//: %s", SDL_GetError());
        
  }else{
		ffi.Pointer<ffi.Uint8> a=ffi.Pointer<ffi.Uint8>.fromAddress(0);
		
        w =dart_SDL_CreateWindow(a,20,20,640,480,0);
        if (w == null) {
			// In the case that the window could not be made...
			print("Could not create window:");// %s\n", SDL_GetError());
        }else{
			print(" create window:");
			print(w);
        }
  }
   await Future.delayed(const Duration(seconds: 5), () => print("1"));
   dart_SDL_DestroyWindow(w);
   dart_SDL_Quit();

 
}
