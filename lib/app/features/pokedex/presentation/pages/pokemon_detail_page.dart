import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_app/app/core/styles/app_colors.dart';

class PokemonDetailPage extends ConsumerWidget {
  final String pokemonId;
  const PokemonDetailPage({
    super.key,
    required this.pokemonId,
  });

  static const routeName = 'pokemon_detail_page';
  static const routePath = 'pokemon_detail_page/:id';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print(pokemonId);

    return const Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.primary,
            title: Text('PRUEBA'),
          ),
        ],
      ),
    );
  }
}
