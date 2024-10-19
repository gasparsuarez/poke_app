import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:poke_app/app/core/styles/app_colors.dart';
import 'package:poke_app/app/core/styles/assets.dart';
import 'package:poke_app/app/features/pokedex/presentation/pages/pokedex_list_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = 'home_page';
  static const routePath = '/home_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.primary,
            pinned: true,
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return PokedexListPage();
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
