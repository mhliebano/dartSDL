# dartSDL
binding a SDL libray using dart

## SDL APi by Category
http://wiki.libsdl.org/APIByCategory

### Category Implements

#### Initialization and Shutdown

Functions
```diff
+ SDL_Init                       class DartSDL.Init 
+ SDL_InitSubSystem              class DartSDL.InitSubSystem
+ SDL_Quit                       class DartSDL.Quit
+ SDL_QuitSubSystem              class DartSDL.QuitSubSystem
- SDL_SetMainReady
+ SDL_WasInit                    class DartSDL.WasInit
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
+SDL_GLattr                      enum GL_Attr
+SDL_GLcontextFlag               abstract class GLcontextFlag
+SDL_GLprofile                   abstract class GLProfile
+SDL_HitTestResult               enum Hit_Test_Result
-SDL_MessageBoxButtonFlags
-SDL_MessageBoxColorType
-SDL_MessageBoxFlags
-SDL_WindowEventID
+SDL_WindowFlags                 abstract class WindowFlags
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
+  SDL_CreateWindowAndRenderer   class Window.CreateWindowAndRenderer
-  SDL_CreateWindowFrom
+  SDL_DestroyWindow             class Window.DestroyWindow
+  SDL_DisableScreenSaver        class Display.DisableScreenSaver
+  SDL_EnableScreenSaver         class Display.EnableScreenSaver
+  SDL_GL_CreateContext          class Window.GL_CreateContext
+  SDL_GL_DeleteContext          class Display.GL_DeleteContext
-  SDL_GL_ExtensionSupported
+  SDL_GL_GetAttribute           class Window.GL_etAttribute
+  SDL_GL_GetCurrentContext      class Window.GL_GetCurrentContext
+  SDL_GL_GetCurrentWindow.......class Window.GL_GetCurrentWindow
+  SDL_GL_GetDrawableSize....... class Window.GL_GetDrawableSize
-  SDL_GL_GetProcAddress
+  SDL_GL_GetSwapInterval........class Window.GL_GetSwapInterval
-  SDL_GL_LoadLibrary
+  SDL_GL_MakeCurrent............class Window.GL_MakeCurrent
+  SDL_GL_ResetAttributes........class Window.GL_ResetAttributes
+  SDL_GL_SetAttribute           class Window.GL_SetAttribute
+  SDL_GL_SetSwapInterval........class Window.GL_SetSwapInterval
-  SDL_GL_SwapWindow
-  SDL_GL_UnloadLibrary
-  SDL_GetClosestDisplayMode
+  SDL_GetCurrentDisplayMode     class Display.GetCurrentDisplayMode
+  SDL_GetCurrentVideoDriver     class Display.GetCurrentVideoDriver
+  SDL_GetDesktopDisplayMode     class Display.GetDestktopDisplayMode
+  SDL_GetDisplayBounds          class Display.GetDisplayBounds
-  SDL_GetDisplayDPI
+  SDL_GetDisplayMode            class Display.GetDisplayMode
+  SDL_GetDisplayName            class Display.GetDisplayName
+  SDL_GetDisplayUsableBounds    class Display.GetDislayUsableBounds
-  SDL_GetGrabbedWindow
+  SDL_GetNumDisplayModes        class Display.GetNumDisplayModes
+  SDL_GetNumVideoDisplays       class Display.GetNumVideoDisplays
+  SDL_GetNumVideoDrivers        class Display.GetNumVideoDrivers
+  SDL_GetVideoDriver            class Display.GetVideoDriver
-  SDL_GetWindowBordersSize
+  SDL_GetWindowBrightness       class Window.GetWindowBrightness
-  SDL_GetWindowData
+  SDL_GetWindowDisplayIndex     class Window.GetWindowDisplayIndex
+  SDL_GetWindowDisplayMode      class Window.GetWindowDisplayMode
+  SDL_GetWindowFlags            class Window.GetWindowFlags
-  SDL_GetWindowFromID
-  SDL_GetWindowGammaRamp
-  SDL_GetWindowGrab
+  SDL_GetWindowID              class Window.GetWindowId
+  SDL_GetWindowMaximumSize     class Window.GetWindoMaximunSize
+  SDL_GetWindowMinimumSize     class Window.GetWindoMminimunSize
+  SDL_GetWindowOpacity         class Window.GetWindowOpacity
+  SDL_GetWindowPixelFormat     class Window.GetWindowPixelFormat
+  SDL_GetWindowPosition        class Window.GetWindowPosition
+  SDL_GetWindowSize            class Window.GetWindowSize
-  SDL_GetWindowSurface
+  SDL_GetWindowTitle           class Window.GetWindowTitle
-  SDL_GetWindowWMInfo
+  SDL_HideWindow               class Window.HideWindow
+  SDL_IsScreenSaverEnabled     class Window.IsScreenSaverEnabled
+  SDL_MaximizeWindow           class Window.MaximizeWindow
+  SDL_MinimizeWindow           class Window.MinimizeWindow
+  SDL_RaiseWindow              class Window.RaiseWindow
+  SDL_RestoreWindow            class Window.RestoreWindow
-  SDL_SetWindowBordered
+  SDL_SetWindowBrightness       class Window.GetWindowBrightness
-  SDL_SetWindowData
+  SDL_SetWindowDisplayMode      class Window.SetWindowDisplayMode
-  SDL_SetWindowFullscreen
-  SDL_SetWindowGammaRamp
-  SDL_SetWindowGrab
-  SDL_SetWindowHitTest
-  SDL_SetWindowIcon
-  SDL_SetWindowInputFocus
-  SDL_SetWindowMaximumSize
-  SDL_SetWindowMinimumSize
-  SDL_SetWindowModalFor
+  SDL_SetWindowOpacity          class Window.SetWindowOpacity
-  SDL_SetWindowPosition
-  SDL_SetWindowResizable
+  SDL_SetWindowSize             class Window.SetWindowSize
+  SDL_SetWindowTitle            class Window.SetWindowTitle
-  SDL_ShowMessageBox
-  SDL_ShowSimpleMessageBox
+  SDL_ShowWindow                class Window.ShowWindow
-  SDL_UpdateWindowSurface
-  SDL_UpdateWindowSurfaceRects
-  SDL_VideoInit
-  SDL_VideoQuit
```

#### 2D Accelerated Rendering

Enumerations
```diff
- SDL_BlendFactor
- SDL_BlendOperation
- SDL_RendererFlags
- SDL_RendererFlip
- SDL_TextureAccess
- SDL_TextureModulate
```

Structures
```diff
- SDL_Renderer
- SDL_RendererInfo
- SDL_Texture
``` 

Functions
```diff
- SDL_ComposeCustomBlendMode
+ SDL_CreateRenderer             class Renderer.CreateRenderer
- SDL_CreateSoftwareRenderer
- SDL_CreateTexture
- SDL_CreateTextureFromSurface
- SDL_CreateWindowAndRenderer
+ SDL_DestroyRenderer            class Renderer.DestroyRenderer
- SDL_DestroyTexture
- SDL_GL_BindTexture
- SDL_GL_UnbindTexture
- SDL_GetNumRenderDrivers
- SDL_GetRenderDrawBlendMode
- SDL_GetRenderDrawColor
- SDL_GetRenderDriverInfo
- SDL_GetRenderTarget
- SDL_GetRenderer
- SDL_GetRendererInfo
- SDL_GetRendererOutputSize
- SDL_GetTextureAlphaMod
- SDL_GetTextureBlendMode
- SDL_GetTextureColorMod
- SDL_LockTexture
- SDL_QueryTexture
- SDL_RenderClear
- SDL_RenderCopy
- SDL_RenderCopyEx
- SDL_RenderDrawLine
- SDL_RenderDrawLines
- SDL_RenderDrawPoint
- SDL_RenderDrawPoints
- SDL_RenderDrawRect
- SDL_RenderDrawRects
- SDL_RenderFillRect
- SDL_RenderFillRects
- SDL_RenderGetClipRect
- SDL_RenderGetIntegerScale
- SDL_RenderGetLogicalSize
- SDL_RenderGetScale
- SDL_RenderGetViewport
- SDL_RenderIsClipEnabled
- SDL_RenderPresent
- SDL_RenderReadPixels
- SDL_RenderSetClipRect
- SDL_RenderSetIntegerScale
- SDL_RenderSetLogicalSize
- SDL_RenderSetScale
- SDL_RenderSetViewport
- SDL_RenderTargetSupported
- SDL_SetRenderDrawBlendMode
- SDL_SetRenderDrawColor
- SDL_SetRenderTarget
- SDL_SetTextureAlphaMod
- SDL_SetTextureBlendMode
- SDL_SetTextureColorMod
- SDL_UnlockTexture
- SDL_UpdateTexture
- SDL_UpdateYUVTexture
```