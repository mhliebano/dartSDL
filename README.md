# dartSDL
binding a SDL libray using dart

## SDL APi by Category
http://wiki.libsdl.org/APIByCategory

### Category Implements

#### Initialization and Shutdown

Functions
```diff
+ SDL_Init                       class DartSDL.Init 
- SDL_InitSubSystem
+ SDL_Quit                       class DartSDL.Quit
- SDL_QuitSubSystem
- SDL_SetMainReady
- SDL_WasInit
- SDL_WinRTRunApp
```

#### Error Handling

Functions
```diff
- SDL_ClearError   
+ SDL_GetError                   class DartSDL.GetError
- SDL_SetError
```


#### Display and Window Management

Enumerations
```diff
-SDL_BlendMode
-SDL_GLattr
-SDL_GLcontextFlag
-SDL_GLprofile
-SDL_HitTestResult
-SDL_MessageBoxButtonFlags
-SDL_MessageBoxColorType
-SDL_MessageBoxFlags
-SDL_WindowEventID
+SDL_WindowFlags              class Window.[ENUM]
```
Structures
```diff
+SDL_DisplayMode              class DisplayMode
-SDL_MessageBoxButtonData
-SDL_MessageBoxColor
-SDL_MessageBoxColorScheme
-SDL_MessageBoxData
-SDL_WindowEvent
```

Functions
```diff
+  SDL_CreateWindow              class Window.CreateWindow
-  SDL_CreateWindowAndRenderer
-  SDL_CreateWindowFrom
+  SDL_DestroyWindow             class Window.DestroyWindow
+  SDL_DisableScreenSaver        class DartSDL.DisableScreenSaver
-  SDL_EnableScreenSaver
-  SDL_GL_CreateContext
-  SDL_GL_DeleteContext
-  SDL_GL_ExtensionSupported
-  SDL_GL_GetAttribute
-  SDL_GL_GetCurrentContext
-  SDL_GL_GetCurrentWindow
-  SDL_GL_GetDrawableSize
-  SDL_GL_GetProcAddress
-  SDL_GL_GetSwapInterval
-  SDL_GL_LoadLibrary
-  SDL_GL_MakeCurrent
-  SDL_GL_ResetAttributes
-  SDL_GL_SetAttribute
-  SDL_GL_SetSwapInterval
-  SDL_GL_SwapWindow
-  SDL_GL_UnloadLibrary
-  SDL_GetClosestDisplayMode
-  SDL_GetCurrentDisplayMode
-  SDL_GetCurrentVideoDriver
+  SDL_GetDesktopDisplayMode     class DartSDL.GetDestktopDisplayMode
-  SDL_GetDisplayBounds
-  SDL_GetDisplayDPI
-  SDL_GetDisplayMode
-  SDL_GetDisplayName
-  SDL_GetDisplayUsableBounds
-  SDL_GetGrabbedWindow
+  SDL_GetNumDisplayModes        class DartSDL.GetNumDisplayModes
+  SDL_GetNumVideoDisplays       class DartSDL.getNumVideoDisplays
-  SDL_GetNumVideoDrivers
-  SDL_GetVideoDriver
-  SDL_GetWindowBordersSize
-  SDL_GetWindowBrightness
-  SDL_GetWindowData
-  SDL_GetWindowDisplayIndex
-  SDL_GetWindowDisplayMode
-  SDL_GetWindowFlags
-  SDL_GetWindowFromID
-  SDL_GetWindowGammaRamp
-  SDL_GetWindowGrab
-  SDL_GetWindowID
-  SDL_GetWindowMaximumSize
-  SDL_GetWindowMinimumSize
-  SDL_GetWindowOpacity
-  SDL_GetWindowPixelFormat
-  SDL_GetWindowPosition
-  SDL_GetWindowSize
-  SDL_GetWindowSurface
-  SDL_GetWindowTitle
-  SDL_GetWindowWMInfo
-  SDL_HideWindow
-  SDL_IsScreenSaverEnabled
-  SDL_MaximizeWindow
-  SDL_MinimizeWindow
-  SDL_RaiseWindow
-  SDL_RestoreWindow
-  SDL_SetWindowBordered
-  SDL_SetWindowBrightness
-  SDL_SetWindowData
-  SDL_SetWindowDisplayMode
-  SDL_SetWindowFullscreen
-  SDL_SetWindowGammaRamp
-  SDL_SetWindowGrab
-  SDL_SetWindowHitTest
-  SDL_SetWindowIcon
-  SDL_SetWindowInputFocus
-  SDL_SetWindowMaximumSize
-  SDL_SetWindowMinimumSize
-  SDL_SetWindowModalFor
-  SDL_SetWindowOpacity
-  SDL_SetWindowPosition
-  SDL_SetWindowResizable
+  SDL_SetWindowSize             class Window.SetWindowSize
+  SDL_SetWindowTitle            class Window.SetWindowTitle
-  SDL_ShowMessageBox
-  SDL_ShowSimpleMessageBox
-  SDL_ShowWindow
-  SDL_UpdateWindowSurface
-  SDL_UpdateWindowSurfaceRects
-  SDL_VideoInit
-  SDL_VideoQuit
```


