import 'package:flutter/material.dart';

import '../config/theme.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final Widget icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 35,
      minWidth: 35,
      elevation: 0,
      color: kDarkPink.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: icon,
    );
  }
}
