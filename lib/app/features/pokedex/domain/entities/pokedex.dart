import 'package:poke_app/app/features/pokedex/domain/entities/raw_pokemon.dart';

class Pokedex {
  final String nextPage;
  final String? previousPage;
  final List<RawPokemon> results;

  Pokedex({
    required this.nextPage,
    required this.previousPage,
    required this.results,
  });
}
