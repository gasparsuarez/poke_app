import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_app/app/core/localization/strings.dart';
import 'package:poke_app/app/core/routes/router.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (_, __, ___) => MaterialApp.router(
        title: Strings.appName,
        routerConfig: AppRouter.routes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
