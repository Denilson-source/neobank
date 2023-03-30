import 'package:flutter/material.dart';

const kDarkerPink = Color(0xff331324);
const kDarkPink = Color(0xff5a2a52);
const kPink = Color(0xffef6aa4);
const kOrange = Color(0xffffa44f);
const kBlue = Color(0xff132f59);

final theme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: kPink,
  canvasColor: Colors.transparent,
  fontFamily: 'ClashGrotesk',
  appBarTheme: const AppBarTheme(
    elevation: 0,
    color: Colors.transparent,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(
        color: Colors.white,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      foregroundColor: Colors.white,
      fixedSize: const Size(140, 56),
    ),
  ),
);
