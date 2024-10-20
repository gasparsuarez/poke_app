import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_app/app/core/styles/app_colors.dart';
import 'package:poke_app/app/core/styles/assets.dart';
import 'package:poke_app/app/features/pokedex/presentation/providers/pagination/pagination_notifier_provider.dart';
import 'package:poke_app/app/features/pokedex/presentation/widgets/pokedex.dart';
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
      // Listen when current position is equal to [maxScrollExtent] and notify provider
      final isMaxScroll = _scrollController!.offset == _scrollController!.position.maxScrollExtent;
      ref.read(paginationNotifierProvider.notifier).setMaxScroll(isMaxScroll);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// Listen changes when provider setMaxPosition
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
              title: Image.asset(Assets.pikachuIcon),
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

            ///
            /// Render Pokedex
            ///
            const Pokedex()
          ],
        ),
      ),
    );
  }
}
