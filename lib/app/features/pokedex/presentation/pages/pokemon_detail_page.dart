import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:poke_app/app/core/extensions/capitalize_extension.dart';
import 'package:poke_app/app/core/localization/strings.dart';
import 'package:poke_app/app/core/styles/app_colors.dart';
import 'package:poke_app/app/core/utils/utils.dart';
import 'package:poke_app/app/core/widgets/error_widget.dart';
import 'package:poke_app/app/features/pokedex/presentation/providers/pokemon/get_pokemon_provider.dart';
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
              : CustomScrollView(
                  physics: const ClampingScrollPhysics(),
                  slivers: [
                    SliverAppBar(
                      backgroundColor: Utils.getColorByPokemonType(pokemon!.types.first.name),
                      expandedHeight: 30.h,
                      leading: GestureDetector(
                        onTap: context.pop,
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.white,
                        ),
                      ),
                      flexibleSpace: SafeArea(
                        child: PokemonImage(
                          index: pokemon.id,
                          shadow: false,
                          width: 60,
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
                                Text(
                                  pokemon.name.capitalize(),
                                  style: TextStyle(fontSize: 22.sp),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),

                                ///
                                ///  Render Pokemon types
                                ///
                                SizedBox(
                                  height: 4.h,
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: pokemon.types.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (_, idx) {
                                      final type = pokemon.types[idx];
                                      return Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                                        child: Chip(
                                          backgroundColor: Utils.getColorByPokemonType(type.name),
                                          label: Text(
                                            type.name.capitalize(),
                                            style: const TextStyle(color: AppColors.white),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),

                                ///
                                /// Render Pokemon Stats
                                ///
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _Stat(
                                      name: Strings.weight,
                                      value: pokemon.weight.toString(),
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    _Stat(
                                      name: Strings.height,
                                      value: pokemon.height.toString(),
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                        childCount: 1,
                      ),
                    )
                  ],
                ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({
    required this.name,
    required this.value,
  });

  final String name;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          value.toString(),
          style: TextStyle(
            fontSize: 18.sp,
          ),
        )
      ],
    );
  }
}
