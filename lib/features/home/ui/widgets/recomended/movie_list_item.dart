import 'package:application/core/helper/app_assets.dart';
import 'package:application/core/helper/spacing.dart';
import 'package:application/core/theming/app_colors.dart';
import 'package:application/core/theming/text_styles.dart';
import 'package:application/features/home/data/models/recomended_response.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/api_constants.dart';

class MovieListItem extends StatelessWidget {
  const MovieListItem({super.key, this.results});
  final Results? results;

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
              CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: ApiConstants.baseImage + results!.posterPath!,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
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
                          "${results!.voteAverage!}",
                          style: TextStyles.font10WhiteRegular,
                        ),
                      ],
                    ),
                    verticalSpace(1),
                    Text(
                      results!.originalTitle!,
                      style: TextStyles.font10WhiteRegular,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    verticalSpace(1),
                    Text(
                      results!.releaseDate!,
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
