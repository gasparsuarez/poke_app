import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_app/app/features/splash/presentation/providers/splash_notifier.dart';

final splashNotifierProvider = StateNotifierProvider<SplashNotifier, bool>(
  (ref) => SplashNotifier(false),
);
