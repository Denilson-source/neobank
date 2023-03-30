import 'package:flutter/material.dart';

import '../../modules/home/presentation/pages/main_navigation/main_navigation_page.dart';
import '../../modules/home/presentation/pages/onboarding/onboarding_page.dart';
import '../widgets/unknown_page.dart';

abstract class Routes {
  static const home = '/home';
  static const onboarding = 'onboarding';

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (context) => const MainNavigationPage(),
        );
      case onboarding:
        return MaterialPageRoute(
          builder: (context) => const OnboardingPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const UnknownPage(),
        );
    }
  }
}
