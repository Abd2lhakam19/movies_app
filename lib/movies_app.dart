import 'package:application/core/routing/app_router.dart';
import 'package:application/core/routing/routes.dart';
import 'package:application/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        initialRoute: Routes.home,
        theme: ThemeData(scaffoldBackgroundColor: AppColors.darkGrey),
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
