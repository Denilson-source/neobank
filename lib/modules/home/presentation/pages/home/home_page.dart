import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/widgets/circle_button.dart';
import '../../../application/obscure_wallet.dart';
import 'widgets/home_balance.dart';
import 'widgets/home_credit_cards.dart';
import 'widgets/home_summary.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        actions: [
          Center(
            child: CircleButton(
              icon: const Icon(Icons.more_horiz_rounded),
              onPressed: () {},
            ),
          ),
        ],
        title: GestureDetector(
          onTap: () {
            final obscure = ref.read(obscureWalletProvider);
            ref.read(obscureWalletProvider.notifier).state = !obscure;
          },
          child: Row(
            children: [
              const Icon(Icons.screen_rotation_outlined),
              const SizedBox(width: 12),
              Text(
                'Shake to reveal balance',
                style: textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: const [
          SizedBox(height: 40),
          HomeCreditCards(),
          SizedBox(height: 20),
          HomeBalance(),
          SizedBox(height: 40),
          HomeSummary(),
        ],
      ),
    );
  }
}
