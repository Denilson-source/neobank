import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/config/routes.dart';
import 'core/config/theme.dart';
import 'modules/home/presentation/pages/splash_screen/splash_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        onGenerateRoute: Routes.onGenerateRoute,
        home: const SplashScreen(),
        theme: theme,
      ),
    );
  }
}
