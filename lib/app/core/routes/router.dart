import 'package:go_router/go_router.dart';
import 'package:poke_app/app/features/home/presentation/pages/home_page.dart';
import 'package:poke_app/app/features/splash/presentation/pages/splash_page.dart';

///
/// [AppRouter]
///
/// Routing configuration
class AppRouter {
  static final GoRouter _routes = GoRouter(
    initialLocation: '/splash_page',
    routes: [
      GoRoute(
        path: SplashPage.routePath,
        name: SplashPage.routeName,
        builder: (_, __) => const SplashPage(),
      ),
      GoRoute(
        path: HomePage.routePath,
        name: HomePage.routeName,
        builder: (_, __) => const HomePage(),
      ),
    ],
  );

  /// Router Getter
  static GoRouter get routes => _routes;
}
