import 'package:flutter/material.dart';
import 'package:neobank_clone/core/config/theme.dart';

import '../../../../../core/config/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initialize() async {
    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) return;
    Navigator.of(context).pushReplacementNamed(Routes.onboarding);
  }

  @override
  void initState() {
    super.initState();

    initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            kDarkerPink,
            kBlue,
          ],
        ),
      ),
      child: const Scaffold(
        body: Center(
          child: Text('Neobank'),
        ),
      ),
    );
  }
}
