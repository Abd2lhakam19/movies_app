import 'package:application/core/theming/app_colors.dart';
import 'package:application/core/theming/text_styles.dart';
import 'package:application/features/home/logic/cubit/slider_cubit/slider_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../logic/cubit/slider_cubit/slider_cubit_states.dart';
import 'slider_content.dart';

class TopHomeSlider extends StatefulWidget {
  const TopHomeSlider({super.key});

  @override
  State<TopHomeSlider> createState() => _TopHomeSliderState();
}

class _TopHomeSliderState extends State<TopHomeSlider> {
  var sliderCubit = SliderCubit();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sliderCubit.getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SliderCubit, SliderState>(
      bloc: sliderCubit,
      builder: (context, state) {
        switch (state) {
          case LodaingState():
            {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.yellowColor,
                ),
              );
            }
          case SuccessState():
            {
              var result = state.resultList;
              return CarouselSlider.builder(
                itemCount: result.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  return SliderContent(
                    results: result[itemIndex],
                  );
                },
                options: CarouselOptions(
                  height: 250,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: false,
                  autoPlayInterval: const Duration(seconds: 2),
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  onPageChanged: (index, reason) {},
                  scrollDirection: Axis.horizontal,
                ),
              );
            }
          case ErrorState():
            {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: Center(
                  child: Text(
                    state.errorMessage,
                    style: TextStyles.font15WhiteRegular,
                  ),
                ),
              );
            }
        }
      },
    );
  }
}
