import 'package:flutter/material.dart';
import 'package:poke_app/app/core/assets.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static const routeName = 'splash_page';
  static const routePath = '/splash_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          Assets.pokeball,
        ),
      ),
    );
  }
}
