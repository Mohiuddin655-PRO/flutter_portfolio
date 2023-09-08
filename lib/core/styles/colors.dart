import 'package:app_color/app_color.dart';
import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static final raw = ThemeColor(
    light: KColors.light,
    dark: KColors.dark,
  );

  static final primary = ThemeColor(
    light: const Color(0xff4162ef),
    dark: const Color(0xff383e46),
  );

  static final secondary = ThemeColor(
    light: const Color(0xff5478f3),
    dark: const Color(0xff383e46),
  );

  static final ternary = ThemeColor(
    light: const Color(0xff6cabf3),
    dark: const Color(0xff114b72),
  );

  static final background = ThemeColor(
    light: Colors.white,
    dark: Colors.white,
  );

  static final error = ThemeColor(
    light: Colors.red,
    dark: Colors.red,
  );

  static final disable = ThemeColor(
    light: Colors.grey,
    dark: Colors.grey,
  );

  static final overlayColor = ThemeColor(
    light: Colors.white,
    dark: Colors.black,
  );

  static final bottomSheet = ThemeColor(
    light: Colors.white,
    dark: Colors.black,
  );

  static final iconColor = ThemeColor(
    light: Colors.black.t50,
    dark: Colors.white.t50,
  );

  static final titleColor = ThemeColor(
    light: Colors.black,
    dark: Colors.white,
  );

  static final textColor = ThemeColor(
    light: Colors.black,
    dark: Colors.white,
  );

  static final colorScheme = ThemeColorScheme.fromThemeColor(
    primary: primary,
    secondary: secondary,
    ternary: ternary,
    error: error,
    background: background,
  );
}
