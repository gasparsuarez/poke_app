import 'package:poke_app/app/features/pokedex/domain/entities/pokemon.dart';

class PokemonModel extends Pokemon {
  PokemonModel({
    required super.height,
    required super.weight,
    required super.types,
    required super.name,
    required super.id,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        height: json['height'],
        weight: json['weight'],
        types: (json['types'] as List).map((type) => TypeModel.fromJson(type)).toList(),
        name: json['name'],
        id: json['id'],
      );
}

class TypeModel extends Type {
  TypeModel({required super.name});

  factory TypeModel.fromJson(Map<String, dynamic> json) => TypeModel(
        name: json['type']['name'],
      );
}
