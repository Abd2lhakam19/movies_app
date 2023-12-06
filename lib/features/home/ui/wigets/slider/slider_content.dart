import 'package:application/core/helper/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'slider_front_content.dart';

class SliderContent extends StatelessWidget {
  const SliderContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 190.h,
              child: Image.asset(
                AppAssets.doraSliderBack,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        const SLiderFrontContent()
      ],
    );
  }
}
