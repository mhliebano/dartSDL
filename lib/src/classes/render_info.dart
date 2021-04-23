class RendererInfo {
  String _name;
  int _numTextureFormats;
  int _maxTextureHeight;
  int _maxTextureWidth;
  int _flags;
  List<int> _textureFormats = [];

  String get name => _name;
  int get numTextureFormats => _numTextureFormats;
  int get maxTextureHeight => _maxTextureHeight;
  int get maxTextureWidth => _maxTextureWidth;
  int get flags => _flags;
  List<int> get textureFormats => _textureFormats;

  RendererInfo(
      {String name,
      int numTextureFormats,
      int maxTextureHeight,
      int maxTextureWidth,
      int flags,
      List<int> textureFormats}) {
    _name = name;
    _numTextureFormats = numTextureFormats;
    _maxTextureHeight = maxTextureHeight;
    _maxTextureWidth = maxTextureWidth;
    _flags = flags;
    _textureFormats = textureFormats;
  }
}
