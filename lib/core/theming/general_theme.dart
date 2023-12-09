import 'package:application/core/theming/app_colors.dart';
import 'package:application/core/theming/text_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData myTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkGrey,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.yellowColor,
      unselectedItemColor: AppColors.white,
      backgroundColor: AppColors.darkerGrey,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyles.font10YellowRegular,
      unselectedLabelStyle: TextStyles.font10WhiteRegular,
      selectedIconTheme: const IconThemeData(size: 24),
      unselectedIconTheme: const IconThemeData(size: 24),
    ),
  );
}
