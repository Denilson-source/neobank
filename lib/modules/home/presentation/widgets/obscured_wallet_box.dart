import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neobank_clone/modules/home/application/obscure_wallet.dart';

class ObscuredWalletBox extends ConsumerWidget {
  const ObscuredWalletBox({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final obscure = ref.watch(obscureWalletProvider);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          child,
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: obscure ? 7 : 0,
              sigmaY: obscure ? 7 : 0,
            ),
            child: Container(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
