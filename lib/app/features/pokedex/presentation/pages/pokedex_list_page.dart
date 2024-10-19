import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_app/app/features/pokedex/presentation/providers/list_pokemon_provider.dart';

class PokedexListPage extends ConsumerWidget {
  const PokedexListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listPokemonNotifier = ref.watch(listPokemonProvider);
    return Container(
      child: listPokemonNotifier.isLoading ? const Text('Si') : const Text('No'),
    );
  }
}
