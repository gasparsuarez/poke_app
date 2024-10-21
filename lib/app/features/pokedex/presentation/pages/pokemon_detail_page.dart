import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:poke_app/app/core/styles/app_colors.dart';

class PokemonDetailPage extends ConsumerWidget {
  final String id;
  const PokemonDetailPage({
    super.key,
    required this.id,
  });

  static const routeName = 'pokemon_detail_page';
  static const routePath = 'pokemon_detail_page/:id';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.primary,
            leading: GestureDetector(
              onTap: context.pop,
              child: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.white,
              ),
            ),
            title: const Text(
              'name',
              style: TextStyle(
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
