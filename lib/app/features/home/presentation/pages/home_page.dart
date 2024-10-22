import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_app/app/core/styles/app_colors.dart';
import 'package:poke_app/app/core/styles/assets.dart';
import 'package:poke_app/app/features/pokedex/presentation/providers/pagination/pagination_notifier_provider.dart';
import 'package:poke_app/app/features/pokedex/presentation/widgets/pokedex.dart';
import 'package:poke_app/app/features/pokedex/presentation/providers/list_pokemon/list_pokemon_provider.dart';
import 'package:sizer/sizer.dart';

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
    ///
    /// If scroll is maxPosition, call [nextPage] function to look new pokemons
    ref.listen(
      paginationNotifierProvider,
      (previous, next) {
        if (next) {
          ref.read(listPokemonProvider.notifier).nextPage();
        }
      },
    );

    /// Listen changes when [nextPage] is called
    ///
    /// Auto move scroll to [maxScrollExtent] when next page loads
    ref.listen(listPokemonProvider, (previous, next) {
      if (next.isLoadedNextPage) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          /// Move to maxScrollExtent in 2 seconds
          _scrollController!.animateTo(
            _scrollController!.position.maxScrollExtent - 400,
            duration: const Duration(seconds: 2),
            curve: Curves.easeIn,
          );
        });
      }
    });

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                pinned: true,
                backgroundColor: AppColors.primary,
                title: Image.asset(Assets.pikachuIcon),
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
          const _PaginationLoader(),
        ],
      ),
    );
  }
}

class _PaginationLoader extends ConsumerWidget {
  const _PaginationLoader();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Watch changes when [nextPage] is loading
    final isLoadingNextPage = ref.watch(listPokemonProvider).isLoadingNextPage;

    if (!isLoadingNextPage) return const SizedBox.shrink();

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 20.h,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black87,
            ],
          ),
        ),
        child: const Center(
          child: CircularProgressIndicator(
            color: AppColors.white,
            strokeWidth: 2,
          ),
        ),
      ),
    );
  }
}
