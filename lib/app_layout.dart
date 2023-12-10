import 'package:flutter/material.dart';

import 'core/helper/app_strings.dart';
import 'core/theming/app_colors.dart';
import 'core/theming/text_styles.dart';
import 'features/browse/ui/browse_screen.dart';
import 'features/home/ui/home_screen.dart';
import 'features/search/ui/search_screen.dart';
import 'features/watch_list/ui/watch_list_screen.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[index],
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: AppColors.yellowColor,
            unselectedItemColor: AppColors.white,
            backgroundColor: AppColors.darkerGrey,
            type: BottomNavigationBarType.shifting,
            selectedLabelStyle: TextStyles.font10YellowRegular,
            unselectedLabelStyle: TextStyles.font10WhiteRegular,
            selectedIconTheme: const IconThemeData(size: 24),
            unselectedIconTheme: const IconThemeData(size: 24),
            elevation: 7,
            onTap: (value) {
              index = value;
              setState(() {});
            },
            currentIndex: index,
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
                icon: Icon(Icons.movie),
                label: AppStrings.browse,
                backgroundColor: AppColors.darkerGrey,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.watch_later_rounded),
                label: AppStrings.watchList,
                backgroundColor: AppColors.darkerGrey,
              ),
            ]),
      ),
    );
  }

  List<Widget> screens = const [
    HomeScreen(),
    SearchScreen(),
    BrowseScreen(),
    WatchListScreen()
  ];
}
