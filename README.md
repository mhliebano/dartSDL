# dartSDL
binding a SDL libray using dart

## SDL APi by Category
http://wiki.libsdl.org/APIByCategory

### Functions Implements
Initialization and Shutdown

```diff
+ SDL_Init
- SDL_InitSubSystem
+ SDL_Quit
- SDL_QuitSubSystem
- SDL_SetMainReady
- SDL_WasInit
- SDL_WinRTRunApp
```
Display and Window Management

```diff
+  SDL_CreateWindow
-  SDL_CreateWindowAndRenderer
-  SDL_CreateWindowFrom
+  SDL_DestroyWindow
-  SDL_DisableScreenSaver
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
-  SDL_GetDesktopDisplayMode
-  SDL_GetDisplayBounds
-  SDL_GetDisplayDPI
-  SDL_GetDisplayMode
-  SDL_GetDisplayName
-  SDL_GetDisplayUsableBounds
-  SDL_GetGrabbedWindow
-  SDL_GetNumDisplayModes
-  SDL_GetNumVideoDisplays
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
+  SDL_SetWindowSize
+  SDL_SetWindowTitle
-  SDL_ShowMessageBox
-  SDL_ShowSimpleMessageBox
-  SDL_ShowWindow
-  SDL_UpdateWindowSurface
-  SDL_UpdateWindowSurfaceRects
-  SDL_VideoInit
-  SDL_VideoQuit
```
2D Accelerated Rendering

```diff
- SDL_ComposeCustomBlendMode
+ SDL_CreateRenderer
- SDL_CreateSoftwareRenderer
- SDL_CreateTexture
- SDL_CreateTextureFromSurface
- SDL_CreateWindowAndRenderer
+ SDL_DestroyRenderer
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
+ SDL_SetRenderDrawColor
- SDL_SetRenderTarget
- SDL_SetTextureAlphaMod
- SDL_SetTextureBlendMode
- SDL_SetTextureColorMod
- SDL_UnlockTexture
- SDL_UpdateTexture
- SDL_UpdateYUVTexture
```
