import 'package:application/core/helper/spacing.dart';
import 'package:application/features/home/data/models/popular_response.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/api_constants.dart';
import '../../../../../core/helper/app_assets.dart';
import 'movie_title.dart';

class SLiderFrontContent extends StatelessWidget {
  SLiderFrontContent({super.key, this.results});
  Results? results;
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
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: ApiConstants.baseImage + results!.posterPath!,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
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
        MovieTitle(
          results: results,
        )
      ],
    );
  }
}
