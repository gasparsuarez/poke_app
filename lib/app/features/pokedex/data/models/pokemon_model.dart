import 'package:poke_app/app/features/pokedex/domain/entities/pokemon.dart';

class PokemonModel extends Pokemon {
  PokemonModel({
    required super.height,
    required super.weight,
    required super.type,
    required super.name,
    required super.id,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        height: json['height'],
        weight: json['weight'],
        type: json['type'],
        name: json['name'],
        id: json['id'],
      );
}
