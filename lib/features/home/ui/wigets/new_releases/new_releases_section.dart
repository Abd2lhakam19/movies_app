import 'package:application/core/helper/app_strings.dart';
import 'package:application/core/helper/spacing.dart';
import 'package:application/core/theming/app_colors.dart';
import 'package:application/core/theming/text_styles.dart';
import 'package:application/features/home/ui/wigets/new_releases/movies_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewReleasesSection extends StatelessWidget {
  const NewReleasesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      height: 187.h,
      width: double.infinity.w,
      decoration: const BoxDecoration(color: AppColors.lightGrey),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.newReleases,
            style: TextStyles.font15WhiteRegular,
          ),
          verticalSpace(14),
          const MoviesList()
        ],
      ),
    );
  }
}
