// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:poke_app/app/features/pokedex/presentation/pages/pokemon_detail_page.dart';
import 'package:poke_app/app/features/pokedex/presentation/providers/pokemon/get_pokemon_provider.dart';
import 'package:poke_app/app/features/pokedex/presentation/widgets/pokemon_image.dart';
import 'package:sizer/sizer.dart';

import 'package:poke_app/app/core/styles/app_colors.dart';
import 'package:poke_app/app/features/pokedex/domain/entities/raw_pokemon.dart';

class PokemonSliverList extends ConsumerWidget {
  const PokemonSliverList({
    super.key,
    required this.pokemons,
  });

  final List<RawPokemon> pokemons;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisExtent: 22.h,
      ),
      delegate: SliverChildBuilderDelegate(
        childCount: pokemons.length,
        (context, index) {
          final pokemon = pokemons[index];
          return GestureDetector(
            onTap: () {
              /// Fetch pokemon data by ID
              ref.read(getPokemonProvider.notifier).getPokemonById(pokemon.getPokemonId);

              /// Push to [PokemonDetailPage]
              context.pushNamed(
                PokemonDetailPage.routeName,
              );
            },
            child: _PokemonCard(
              index: index,
              pokemon: pokemon,
            ),
          );
        },
      ),
    );
  }
}

class _PokemonCard extends StatelessWidget {
  const _PokemonCard({
    required this.index,
    required this.pokemon,
  });
  final int index;
  final RawPokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 2.w,
                vertical: 2.w,
              ),
              height: 12.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.sp),
                border: Border.all(
                  color: AppColors.brown,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.shadow,
                    blurRadius: 6,
                    spreadRadius: 2,
                    offset: Offset(0, 4),
                  ),
                ],
                color: AppColors.orange,
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  pokemon.name.toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 171, 115, 30),
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 14.w / 2,
          top: 4.h,
          child: PokemonImage(
            index: index + 1,
            width: 20,
          ),
        ),
      ],
    );
  }
}
