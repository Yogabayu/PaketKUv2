import 'package:flutter/material.dart';
import 'package:tracking/constants/color_constants.dart';

class Themes {
  static final lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Color.fromARGB(255, 243, 237, 68),
      onPrimary: Colors.black,
      secondary: AppColors.spaceBlue,
      onSecondary: AppColors.spaceCadet,
      background: AppColors.babyPink,
    ),
  );

  static final darkTheme = ThemeData(
      colorScheme: const ColorScheme.dark(
    primary: AppColors.spaceBlue,
    secondary: AppColors.burgundy,
    onSecondary: AppColors.spaceCadet,
    background: AppColors.spaceCadet,
  ));
}
