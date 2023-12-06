import 'package:application/core/helper/spacing.dart';
import 'package:application/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/app_assets.dart';
import 'movie_title.dart';

class SLiderFrontContent extends StatelessWidget {
  const SLiderFrontContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10.w),
                height: 180.h,
                width: 130.w,
                child: Image.asset(
                  AppAssets.doraSliderFront,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 10.w),
                  height: 36.h,
                  width: 27.w,
                  child: Image.asset(
                    AppAssets.bookMark,
                    fit: BoxFit.cover,
                  ))
            ],
          ),
        ),
        horizontalSpace(7),
        const MovieTitle()
      ],
    );
  }
}
