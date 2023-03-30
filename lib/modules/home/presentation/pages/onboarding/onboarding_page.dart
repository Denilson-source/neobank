import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../../core/config/routes.dart';
import '../../../../../core/config/theme.dart';
import '../../../../../core/constants/images.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

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
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Center(
              child: MaterialButton(
                height: 35,
                minWidth: 60,
                elevation: 0,
                color: kDarkPink.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(Routes.home);
                },
                child: const Text('Skip'),
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Center(
                    child: _buildCreditCard(),
                  ),
                ),
                Text(
                  'An exceptional offer',
                  style: textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'in a limitless world of credit cards',
                  style: textTheme.bodyMedium,
                ),
                const SizedBox(height: 30),
                Text(
                  'Visa Gold card with all applied\nrewards and benefits and more',
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium,
                ),
                const SizedBox(height: 40),
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(Routes.home);
                  },
                  child: const Text('Next'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCreditCard() {
    final width = MediaQuery.of(context).size.width * 0.7;
    return SizedBox(
      height: width,
      width: width,
      child: Stack(
        children: [
          Center(
            child: Transform.rotate(
              angle: -pi / 4,
              // angle: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    colors: [
                      kPink,
                      kOrange,
                    ],
                  ),
                ),
                child: const AspectRatio(
                  aspectRatio: 1.6,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: width / 2 + 30,
            width: 40,
            child: Image.asset(Images.visaLogoWhite),
          ),
        ],
      ),
    );
  }
}
