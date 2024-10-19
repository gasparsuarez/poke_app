import 'package:poke_app/app/features/pokedex/domain/entities/raw_pokemon.dart';

class RawPokemonModel extends RawPokemon {
  RawPokemonModel({
    required super.name,
    required super.url,
  });

  factory RawPokemonModel.fromJson(Map<String, dynamic> json) => RawPokemonModel(
        name: json['name'],
        url: json['url'],
      );
}
