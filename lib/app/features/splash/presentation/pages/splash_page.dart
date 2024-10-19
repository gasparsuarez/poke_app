import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:poke_app/app/core/styles/assets.dart';
import 'package:poke_app/app/features/home/presentation/pages/home_page.dart';
import 'package:poke_app/app/features/splash/presentation/providers/splash_notifier_provider.dart';
import 'package:sizer/sizer.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  static const routeName = 'splash_page';
  static const routePath = '/splash_page';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      splashNotifierProvider,
      (previous, next) {
        /// Redirect to [HomePage] when splash finished
        if (!next) {
          context.goNamed(HomePage.routeName);
        }
      },
    );

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: FadeInDown(
              from: 200,
              child: Image.asset(
                Assets.pokeball,
              ),
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
        ],
      ),
    );
  }
}
