import 'package:poke_app/app/features/pokedex/domain/entities/pokemon.dart';

class PokemonModel extends Pokemon {
  PokemonModel({
    required super.height,
    required super.weight,
    required super.types,
    required super.name,
    required super.id,
    required super.abilities,
    required super.stats,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        height: json['height'],
        weight: json['weight'],
        types: (json['types'] as List).map((type) => TypeModel.fromJson(type)).toList(),
        abilities:
            (json['abilities'] as List).map((ability) => AbilityModel.fromJson(ability)).toList(),
        stats: (json['stats'] as List).map((stat) => StatModel.fromJson(stat)).toList(),
        name: json['name'],
        id: json['id'],
      );
}

class StatModel extends Stat {
  StatModel({required super.base, required super.name});

  factory StatModel.fromJson(Map<String, dynamic> json) => StatModel(
        base: json['base_stat'],
        name: json['stat']['name'],
      );
}

class AbilityModel extends Ability {
  AbilityModel({required super.name});

  factory AbilityModel.fromJson(Map<String, dynamic> json) => AbilityModel(
        name: json['ability']['name'],
      );
}

class TypeModel extends Type {
  TypeModel({required super.name});

  factory TypeModel.fromJson(Map<String, dynamic> json) => TypeModel(
        name: json['type']['name'],
      );
}
