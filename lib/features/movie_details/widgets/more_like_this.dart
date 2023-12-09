import 'package:application/features/movie_details/widgets/similar_movie_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helper/app_strings.dart';
import '../../../core/helper/spacing.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/theming/text_styles.dart';

class MoreLikeThis extends StatelessWidget {
  const MoreLikeThis({super.key, required this.movieId});
  final String movieId;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      height: 246.h,
      width: double.infinity,
      color: AppColors.lightGrey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.moreLikeThis,
            style: TextStyles.font15WhiteRegular,
          ),
          verticalSpace(15),
          SimilarMovieList(
            movieId: movieId,
          )
        ],
      ),
    );
  }
}
