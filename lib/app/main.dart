import 'package:flutter/material.dart';
import 'package:poke_app/app/core/localization/strings.dart';
import 'package:poke_app/app/core/routes/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: Strings.appName,
      routerConfig: AppRouter.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
