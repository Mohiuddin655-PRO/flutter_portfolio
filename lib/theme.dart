library theme;

import 'package:app_color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_androssy/core.dart';

import 'index.dart';

AndrossyTheme theme = AndrossyTheme(_light, _dark);

ThemeData _light = ThemeData.from(
  useMaterial3: true,
  colorScheme: AppColors.colorScheme.light,
).copyWith(
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.overlayColor.light,
    systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
      systemNavigationBarColor: AppColors.background.light,
    ),
    iconTheme: IconThemeData(
      color: AppColors.iconColor.light,
    ),
    titleTextStyle: TextStyle(
      color: AppColors.titleColor.light,
    ),
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: AppColors.overlayColor.light,
    surfaceTintColor: AppColors.overlayColor.light,
  ),
  textTheme: TextTheme(
    titleLarge: const TextStyle(
      fontSize: 24,
      color: Colors.black,
    ),
    titleMedium: const TextStyle(
      fontSize: 18,
      color: Colors.black,
    ),
    titleSmall: TextStyle(
      fontSize: 12,
      color: Colors.black.t50,
    ),
    bodyLarge: const TextStyle(
      fontSize: 16,
      color: Colors.black,
    ),
    bodyMedium: const TextStyle(
      fontSize: 14,
      color: Colors.black,
    ),
    bodySmall: const TextStyle(
      fontSize: 12,
      color: Colors.black,
    ),
    labelLarge: const TextStyle(
      fontSize: 16,
      color: Colors.black,
    ),
    labelMedium: const TextStyle(
      fontSize: 14,
      color: Colors.black,
    ),
    labelSmall: const TextStyle(
      fontSize: 12,
      color: Colors.black,
    ),
  ),
);

ThemeData _dark = ThemeData.from(
  useMaterial3: true,
  colorScheme: AppColors.colorScheme.dark,
).copyWith(
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.overlayColor.dark,
    systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: AppColors.background.dark,
    ),
    iconTheme: IconThemeData(
      color: AppColors.iconColor.dark,
    ),
    titleTextStyle: TextStyle(
      color: AppColors.titleColor.dark,
    ),
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: AppColors.overlayColor.dark,
    surfaceTintColor: AppColors.overlayColor.dark,
  ),
  textTheme: TextTheme(
    titleLarge: const TextStyle(
      fontSize: 24,
      color: Colors.white,
    ),
    titleMedium: const TextStyle(
      fontSize: 18,
      color: Colors.white,
    ),
    titleSmall: TextStyle(
      fontSize: 12,
      color: Colors.white.t50,
    ),
    bodyLarge: const TextStyle(
      fontSize: 16,
      color: Colors.white,
    ),
    bodyMedium: const TextStyle(
      fontSize: 14,
      color: Colors.white,
    ),
    bodySmall: const TextStyle(
      fontSize: 12,
      color: Colors.white,
    ),
    labelLarge: const TextStyle(
      fontSize: 16,
      color: Colors.white,
    ),
    labelMedium: const TextStyle(
      fontSize: 14,
      color: Colors.white,
    ),
    labelSmall: const TextStyle(
      fontSize: 12,
      color: Colors.white,
    ),
  ),
);
