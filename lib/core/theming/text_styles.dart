import 'package:application/core/helper/font_wight.dart';
import 'package:application/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle font14WhiteRegular = TextStyle(
        color: AppColors.white,
        fontSize: 14.sp,
        fontWeight: FontWeightHelper.regular,
      ),
      font10LightergreyRegular = TextStyle(
          color: AppColors.lighterGrey,
          fontSize: 10.sp,
          fontWeight: FontWeightHelper.regular),
      font15WhiteRegular = TextStyle(
          color: AppColors.white,
          fontSize: 15.sp,
          fontWeight: FontWeightHelper.regular),
      font10WhiteRegular = TextStyle(
          color: AppColors.white,
          fontSize: 10.sp,
          fontWeight: FontWeightHelper.regular),
      font8LighterGreyRegular = TextStyle(
          color: AppColors.lighterGrey,
          fontSize: 8.sp,
          fontWeight: FontWeightHelper.regular),
      font10YellowRegular = TextStyle(
          color: AppColors.yellowColor,
          fontSize: 10.sp,
          fontWeight: FontWeightHelper.regular),
      font20WightRegular = TextStyle(
          color: AppColors.white,
          fontSize: 20.sp,
          fontWeight: FontWeightHelper.regular),
      font18WightRegular = TextStyle(
          color: AppColors.white,
          fontSize: 18.sp,
          fontWeight: FontWeightHelper.regular);
}
