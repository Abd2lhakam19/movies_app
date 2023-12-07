import 'package:application/features/home/data/models/popular_response.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/api_constants.dart';
import 'slider_front_content.dart';

class SliderContent extends StatelessWidget {
  const SliderContent({super.key, this.results});
  final Results? results;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 190.h,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: ApiConstants.baseImage + results!.backdropPath!,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ],
        ),
        SLiderFrontContent(
          results: results,
        )
      ],
    );
  }
}
