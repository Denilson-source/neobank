import 'package:flutter/material.dart';

import '../../../widgets/obscured_wallet_box.dart';

class HomeBalance extends StatelessWidget {
  const HomeBalance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '\$ ',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        ObscuredWalletBox(
          child: Text(
            '49.238,27',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ],
    );
  }
}
