import 'package:poke_app/app/features/pokedex/data/models/raw_pokemon_model.dart';
import 'package:poke_app/app/features/pokedex/domain/entities/pokedex.dart';

class PokedexModel extends Pokedex {
  PokedexModel({
    required super.nextPage,
    required super.previousPage,
    required super.results,
  });

  factory PokedexModel.fromJson(Map<String, dynamic> json) => PokedexModel(
        nextPage: json['next'],
        previousPage: json['previous'],
        results: (json['results'] as List)
            .map((rawPokemon) => RawPokemonModel.fromJson(rawPokemon))
            .toList(),
      );
}
