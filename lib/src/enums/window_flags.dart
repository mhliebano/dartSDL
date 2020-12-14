abstract class WindowFlags {
  static final SDL_WINDOW_FULLSCREEN = 0x00000001; /**< fullscreen window */
  static final SDL_WINDOW_OPENGL = 0x00000002; /**< window usable with OpenGL context */
  static final SDL_WINDOW_SHOWN = 0x00000004; /**< window is visible */
  static final SDL_WINDOW_HIDDEN = 0x00000008; /**< window is not visible */
  static final SDL_WINDOW_BORDERLESS = 0x00000010; /**< no window decoration */
  static final SDL_WINDOW_RESIZABLE = 0x00000020; /**< window can be resized */
  static final SDL_WINDOW_MINIMIZED = 0x00000040; /**< window is minimized */
  static final SDL_WINDOW_MAXIMIZED = 0x00000080; /**< window is maximized */
  static final SDL_WINDOW_INPUT_GRABBED = 0x00000100; /**< window has grabbed input focus */
  static final SDL_WINDOW_INPUT_FOCUS = 0x00000200; /**< window has input focus */
  static final SDL_WINDOW_MOUSE_FOCUS = 0x00000400; /**< window has mouse focus */
  static final SDL_WINDOW_FULLSCREEN_DESKTOP = 0x00000001 | 0x00001000;
  static final SDL_WINDOW_FOREIGN = 0x00000800; /**< window not created by SDL */
  static final SDL_WINDOW_ALLOW_HIGHDPI = 0x00002000; /**< window should be created in high-DPI mode if supported.**/
  static final SDL_WINDOW_MOUSE_CAPTURE = 0x00004000; /**< window has mouse captured (unrelated to INPUT_GRABBED) */
  static final SDL_WINDOW_ALWAYS_ON_TOP = 0x00008000; /**< window should always be above others */
  static final SDL_WINDOW_SKIP_TASKBAR = 0x00010000; /**< window should not be added to the taskbar */
  static final SDL_WINDOW_UTILITY = 0x00020000; /**< window should be treated as a utility window */
  static final SDL_WINDOW_TOOLTIP = 0x00040000; /**< window should be treated as a tooltip */
  static final SDL_WINDOW_POPUP_MENU = 0x00080000; /**< window should be treated as a popup menu */
  static final SDL_WINDOW_VULKAN = 0x10000000; /**< window usable for Vulkan surface */
  static final SDL_WINDOW_METAL = 0x20000000; /**< window usable for Metal view */
  static final SDL_WINDOW_FLAG = 0x00000000;
}
