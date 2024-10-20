import 'package:flutter/material.dart';

import 'package:poke_app/app/features/pokedex/domain/entities/raw_pokemon.dart';

class Pokedex {
  final String nextPage;
  final String? previousPage;
  final List<RawPokemon> results;

  Pokedex({
    required this.nextPage,
    required this.previousPage,
    this.results = const [],
  });

  Pokedex copyWith({
    String? nextPage,
    ValueGetter<String?>? previousPage,
    List<RawPokemon>? results,
  }) {
    return Pokedex(
      nextPage: nextPage ?? this.nextPage,
      previousPage: previousPage != null ? previousPage() : this.previousPage,
      results: results ?? this.results,
    );
  }
}
