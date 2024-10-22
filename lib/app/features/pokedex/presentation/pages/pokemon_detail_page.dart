import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:poke_app/app/core/extensions/capitalize_extension.dart';
import 'package:poke_app/app/core/localization/strings.dart';
import 'package:poke_app/app/core/styles/app_colors.dart';
import 'package:poke_app/app/core/utils/utils.dart';
import 'package:poke_app/app/core/widgets/error_widget.dart';
import 'package:poke_app/app/features/pokedex/presentation/providers/pokemon/get_pokemon_provider.dart';
import 'package:poke_app/app/features/pokedex/presentation/widgets/pokemon_detail/stats_widget.dart';
import 'package:poke_app/app/features/pokedex/presentation/widgets/pokemon_image.dart';
import 'package:sizer/sizer.dart';

class PokemonDetailPage extends ConsumerStatefulWidget {
  final String id;

  const PokemonDetailPage({
    super.key,
    required this.id,
  });

  static const routeName = 'pokemon_detail_page';
  static const routePath = 'pokemon_detail_page/:id';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends ConsumerState<PokemonDetailPage> {
  @override
  void initState() {
    super.initState();

    /// Fetch pokemon data before render
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(getPokemonProvider.notifier).getPokemonById(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(getPokemonProvider).isLoading;
    final hasError = ref.watch(getPokemonProvider).hasError;
    final errorMessage = ref.read(getPokemonProvider).message;

    final pokemon = ref.read(getPokemonProvider).pokemon;

    const loaderWidget = Center(
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: AppColors.primary,
      ),
    );

    final errorWidget = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: CustomErrorWidget(
            message: errorMessage,
            retryCallback: () => ref.read(getPokemonProvider.notifier).getPokemonById(widget.id),
          ),
        ),
      ],
    );

    return Scaffold(
      backgroundColor: AppColors.white,
      body: isLoading
          ? loaderWidget
          : hasError
              ? errorWidget
              : (pokemon != null)
                  ? CustomScrollView(
                      physics: const ClampingScrollPhysics(),
                      slivers: [
                        SliverAppBar(
                          backgroundColor: Colors.transparent,
                          expandedHeight: 24.h,
                          leading: GestureDetector(
                            onTap: context.pop,
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: AppColors.white,
                            ),
                          ),
                          flexibleSpace: SafeArea(
                            top: false,
                            child: Container(
                              height: 30.h,
                              padding: EdgeInsets.all(14.sp),
                              decoration: BoxDecoration(
                                color: Utils.getColorByPokemonType(pokemon.types.first.name),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(
                                    18.w,
                                  ),
                                  bottomRight: Radius.circular(
                                    18.w,
                                  ),
                                ),
                              ),
                              child: SafeArea(
                                child: PokemonImage(
                                  index: pokemon.id,
                                  shadow: false,
                                  width: 50,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          pokemon.name.capitalize(),
                                          style: TextStyle(fontSize: 22.sp),
                                        ),
                                        Text(
                                          '#${pokemon.id}',
                                          style: TextStyle(
                                            fontSize: 20.sp,
                                            color: AppColors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),

                                    ///
                                    ///  Render Pokemon types
                                    ///
                                    Wrap(
                                      spacing: 2.w,
                                      children: pokemon.types
                                          .map(
                                            (type) => Chip(
                                              backgroundColor:
                                                  Utils.getColorByPokemonType(type.name),
                                              label: Text(
                                                type.name.capitalize(),
                                                style: const TextStyle(color: AppColors.white),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),

                                    SizedBox(
                                      height: 2.h,
                                    ),

                                    ///
                                    /// Render Pokemon Stats
                                    ///

                                    StatsWidget(
                                      pokemon: pokemon,
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),

                                    Text(
                                      Strings.abilities,
                                      style: TextStyle(fontSize: 18.sp),
                                    ),

                                    Wrap(
                                      spacing: 2.w,
                                      children: pokemon.abilities
                                          .map(
                                            (pokemon) => Chip(label: Text(pokemon.name)),
                                          )
                                          .toList(),
                                    )
                                  ],
                                ),
                              );
                            },
                            childCount: 1,
                          ),
                        )
                      ],
                    )
                  : SizedBox.shrink(),
    );
  }
}
