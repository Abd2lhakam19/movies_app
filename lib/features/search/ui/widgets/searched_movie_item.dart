import 'package:application/core/helper/spacing.dart';
import 'package:application/core/theming/app_colors.dart';
import 'package:application/core/theming/text_styles.dart';
import 'package:application/features/home/data/models/movie_details_response.dart';
import 'package:application/features/search/data/models/search_response.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/api_constants.dart';

class SearchedMovieItem extends StatelessWidget {
  SearchedMovieItem({super.key, required this.results});
  Results results;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
      child: Row(
        children: [
          Container(
            height: 90.h,
            width: 140.w,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: ApiConstants.baseImage + results.posterPath!,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          horizontalSpace(7),
          Expanded(
            child: Column(
              children: [
                Text(
                  results.title!,
                  style: TextStyles.font15WhiteRegular,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  results.releaseDate!,
                  style: TextStyles.font14WhiteRegular
                      .copyWith(color: AppColors.white.withOpacity(0.5)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
