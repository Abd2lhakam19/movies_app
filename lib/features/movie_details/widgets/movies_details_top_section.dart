import 'package:application/core/helper/spacing.dart';
import 'package:application/core/theming/text_styles.dart';
import 'package:application/features/home/data/models/movie_details_response.dart';
import 'package:application/features/movie_details/widgets/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieDetailsTopSection extends StatelessWidget {
  const MovieDetailsTopSection({super.key, required this.movieDetails});
  final MovieDetailsResponse movieDetails;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 13.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movieDetails.originalTitle!,
            style: TextStyles.font18WightRegular,
          ),
          verticalSpace(8),
          Text(
            movieDetails.releaseDate!,
            style: TextStyles.font10LightergreyRegular,
          ),
          verticalSpace(20),
          Details(
            movieDetails: movieDetails,
          ),
        ],
      ),
    );
  }
}
