import 'package:flutter/material.dart';
import 'package:poke_app/app/features/pokedex/domain/entities/raw_pokemon.dart';

class PokemonSliverList extends StatelessWidget {
  const PokemonSliverList({
    super.key,
    required this.pokemons,
  });

  final List<RawPokemon> pokemons;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      delegate: SliverChildBuilderDelegate(
        childCount: pokemons.length,
        (context, index) {
          final pokemon = pokemons[index];
          return Text(
            pokemon.name,
            textAlign: TextAlign.center,
          );
        },
      ),
    );
  }
}
