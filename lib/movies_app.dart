import 'package:application/core/routing/app_router.dart';
import 'package:application/core/routing/routes.dart';
import 'package:application/core/theming/general_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/theming/app_colors.dart';
import 'core/theming/text_styles.dart';

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 792),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.appLayout,
        //theme: AppTheme.myTheme,
        onGenerateRoute: appRouter.generateRoute,
        theme: ThemeData(scaffoldBackgroundColor: AppColors.darkGrey),
      ),
    );
  }
}
