import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashNotifier extends StateNotifier<bool> {
  SplashNotifier(super.state) {
    /// Init splash
    start();
  }

  Future<void> start() async {
    state = true;

    /// Simulate api-fetch
    await Future.delayed(const Duration(seconds: 2));

    state = false;
  }
}
