import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_app/app/core/styles/app_colors.dart';
import 'package:poke_app/app/core/styles/assets.dart';
import 'package:poke_app/app/features/pokedex/presentation/pages/pokedex_list_page.dart';
import 'package:poke_app/app/features/pokedex/presentation/providers/list_pokemon_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  static const routeName = 'home_page';
  static const routePath = '/home_page';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: AppColors.primary,
              title: Pulse(
                infinite: true,
                duration: const Duration(seconds: 3),
                child: Image.asset(Assets.pikachuIcon),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),

            ///
            /// Refresh indicator
            ///
            CupertinoSliverRefreshControl(
              onRefresh: () async => ref.read(listPokemonProvider.notifier).listAll(),
            ),
            const PokedexListPage()
          ],
        ),
      ),
    );
  }
}
