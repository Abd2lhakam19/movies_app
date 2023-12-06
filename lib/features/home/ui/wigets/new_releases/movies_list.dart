import 'package:application/core/helper/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                Image.asset(
                  AppAssets.doraSliderFront,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                    height: 36.h,
                    width: 27.w,
                    child: Image.asset(
                      AppAssets.bookMark,
                      fit: BoxFit.cover,
                    ))
              ],
            );
          },
          separatorBuilder: (context, index) => const VerticalDivider(
                thickness: 2,
                color: Colors.transparent,
              ),
          itemCount: 10),
    );
  }
}
