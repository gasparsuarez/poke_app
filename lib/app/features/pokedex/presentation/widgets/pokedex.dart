import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_app/app/core/widgets/error_widget.dart';
import 'package:poke_app/app/core/widgets/shimmer_container.dart';
import 'package:poke_app/app/core/widgets/shimmer_loader.dart';
import 'package:poke_app/app/features/pokedex/presentation/providers/list_pokemon/list_pokemon_provider.dart';
import 'package:poke_app/app/features/pokedex/presentation/widgets/pokemon_sliver_list.dart';
import 'package:sizer/sizer.dart';

class Pokedex extends ConsumerWidget {
  const Pokedex({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listPokemonNotifier = ref.watch(listPokemonProvider);
    final isLoading = listPokemonNotifier.isLoading;
    final hasError = listPokemonNotifier.hasError;
    final pokedex = listPokemonNotifier.pokedex;

    // Return [_Loader] widget when API is called
    if (isLoading) return const _Loader();

    // Return [_Error] widget when API throws error
    if (hasError) return const _Error();

    return PokemonSliverList(
      pokemons: pokedex!.results,
    );
  }
}

class _Error extends ConsumerWidget {
  const _Error();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Read error message
    final listPokemonNotifier = ref.read(listPokemonProvider.notifier);
    return SliverToBoxAdapter(
      child: CustomErrorWidget(
        message: ref.read(listPokemonProvider).message,
        retryCallback: listPokemonNotifier.listAll,
      ),
    );
  }
}

class _Loader extends StatelessWidget {
  const _Loader();

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisExtent: 20.h,
      ),
      delegate: SliverChildBuilderDelegate(
        childCount: 20,
        (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 2.w,
              vertical: 2.w,
            ),
            child: const ShimmerLoader(
              child: ShimmerContainer(),
            ),
          );
        },
      ),
    );
  }
}
