class RawPokemon {
  final String name;
  final String url;

  RawPokemon({
    required this.name,
    required this.url,
  });

  ///
  /// Get pokemonId from URL
  ///
  String get getPokemonId {
    final splittedUrl = url.split('/');
    final indexId = splittedUrl.length - 2;
    return splittedUrl[indexId];
  }
}
