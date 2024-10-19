class Assets {
  ///
  /// Local Assets
  ///
  static const _basePath = 'assets';
  static const _pokeballLogo = '$_basePath/pokeball.png';
  static const _pikachuIcon = '$_basePath/pikachu.png';

  static String get pokeballLogo => _pokeballLogo;
  static String get pikachuIcon => _pikachuIcon;

  ///
  /// Network Assets
  ///
  static String buildPokemonSpriteUrl(int index) =>
      'https://unpkg.com/pokeapi-sprites@2.0.2/sprites/pokemon/other/dream-world/$index.svg';
}
