import 'package:application/core/helper/app_assets.dart';
import 'package:application/core/helper/spacing.dart';
import 'package:application/core/theming/app_colors.dart';
import 'package:application/core/theming/text_styles.dart';
import 'package:application/features/home/data/models/movie_details_response.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helper/api_constants.dart';

class Details extends StatelessWidget {
  const Details({super.key, required this.movieDetails});
  final MovieDetailsResponse movieDetails;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.topStart,
          children: [
            SizedBox(
              height: 180.h,
              width: 130.w,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: ApiConstants.baseImage + movieDetails.posterPath!,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
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
        ),
        horizontalSpace(11),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Wrap(
                children: List.generate(
              movieDetails.genres!.length,
              (index) => Container(
                margin: const EdgeInsets.all(1.5),
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: AppColors.whiterGrey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  movieDetails.genres![index].name!,
                  style: TextStyles.font10WhiteRegular
                      .copyWith(color: AppColors.whiteGrey),
                  textAlign: TextAlign.center,
                ),
              ),
            )),
            verticalSpace(13),
            Text(
              movieDetails.overview!,
              style: TextStyles.font14WhiteRegular.copyWith(fontSize: 13.sp),
            ),
            verticalSpace(15),
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: AppColors.yellowColor,
                ),
                horizontalSpace(7),
                Text(
                  "${movieDetails.voteAverage!}",
                  style: TextStyles.font18WightRegular,
                ),
              ],
            )
          ]),
        ),
      ],
    );
  }
}
