import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_app/app/core/styles/app_colors.dart';
import 'package:poke_app/app/core/styles/assets.dart';
import 'package:poke_app/app/features/pokedex/presentation/providers/pagination/pagination_notifier_provider.dart';
import 'package:poke_app/app/features/pokedex/presentation/pages/pokedex_list_page.dart';
import 'package:poke_app/app/features/pokedex/presentation/providers/list_pokemon/list_pokemon_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  static const routeName = 'home_page';
  static const routePath = '/home_page';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  ScrollController? _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    /// listen scrollController
    _scrollController!.addListener(() {
      // Listen when position is equal to [maxScrollExtent]
      if (_scrollController!.offset == _scrollController!.position.maxScrollExtent) {
        ref.read(paginationNotifierProvider.notifier).setMaxScroll(true);
      } else {
        ref.read(paginationNotifierProvider.notifier).setMaxScroll(false);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ///
    /// Listen changes when scroll is Max Position
    ///
    /// If scroll is maxPosition, call [nextPage] function to look new pokemons
    ref.listen(
      paginationNotifierProvider,
      (previous, next) {
        if (next) {
          print('Max scrollled');
          //TODO: Next page
        }
      },
    );

    return Scaffold(
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          controller: _scrollController,
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
