import 'package:application/core/helper/app_assets.dart';
import 'package:application/core/helper/spacing.dart';
import 'package:application/core/theming/app_colors.dart';
import 'package:application/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieListItem extends StatelessWidget {
  const MovieListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 185.h,
          width: 98.w,
          color: AppColors.moreLightGrey,
          child: Column(
            children: [
              Image.asset(AppAssets.doraSliderFront),
              verticalSpace(6),
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: AppColors.yellowColor,
                          size: 12,
                        ),
                        horizontalSpace(4),
                        Text(
                          "7.7",
                          style: TextStyles.font10WhiteRegular,
                        ),
                      ],
                    ),
                    verticalSpace(2),
                    Text(
                      "Dora anf the lost city of goal",
                      style: TextStyles.font10WhiteRegular,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    verticalSpace(2),
                    Text(
                      "2018  R  1h 59m",
                      style: TextStyles.font8LighterGreyRegular,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 36.h,
          width: 27.w,
          child: Image.asset(
            AppAssets.bookMark,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
