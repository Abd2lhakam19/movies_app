import 'package:application/core/helper/app_strings.dart';
import 'package:application/core/theming/app_colors.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        selectedItemColor: AppColors.yellowColor,
        unselectedItemColor: AppColors.white,
        backgroundColor: AppColors.darkerGrey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: AppStrings.home,
            backgroundColor: AppColors.darkerGrey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: AppStrings.search,
            backgroundColor: AppColors.darkerGrey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.browse_gallery),
            label: AppStrings.browse,
            backgroundColor: AppColors.darkerGrey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.watch_later),
            label: AppStrings.watchList,
            backgroundColor: AppColors.darkerGrey,
          ),
        ]);
  }
}
