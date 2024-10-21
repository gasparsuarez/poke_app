class ApiPaths {
  static const _baseUrl = 'https://pokeapi.co/api/v2/';

  /// Api Paths
  static const _getAllPokemon = 'pokemon?';
  static const _getPokemonById = 'pokemon/';

  /// Path Getters
  static get baseUrl => _baseUrl;
  static get getAllPokemon => _getAllPokemon;
  static get getPokemonById => _getPokemonById;
}
