import 'package:application/core/helper/app_strings.dart';
import 'package:application/core/helper/spacing.dart';
import 'package:application/core/theming/app_colors.dart';
import 'package:application/core/theming/text_styles.dart';
import 'package:application/features/home/cubit/new_releases_cubit/new_releases_cubit.dart';
import 'package:application/features/home/cubit/new_releases_cubit/new_releases_cubit_states.dart';
import 'package:application/features/home/ui/widgets/new_releases/movies_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewReleasesSection extends StatefulWidget {
  NewReleasesSection({super.key});

  @override
  State<NewReleasesSection> createState() => _NewReleasesSectionState();
}

class _NewReleasesSectionState extends State<NewReleasesSection> {
  var newReleasesCubit = NewReleasesCubit();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newReleasesCubit.getNewReleasesMovies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewReleasesCubit, NewReleasesStates>(
      bloc: newReleasesCubit,
      builder: (context, state) {
        switch (state) {
          case LoadingState():
            {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.yellowColor,
                ),
              );
            }
          case SuccessState():
            {
              var result = state.resuletsList;
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                height: 187.h,
                width: double.infinity.w,
                decoration: const BoxDecoration(color: AppColors.lightGrey),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.newReleases,
                      style: TextStyles.font15WhiteRegular,
                    ),
                    verticalSpace(14),
                    MoviesList(result),
                  ],
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
/* 
Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      height: 187.h,
      width: double.infinity.w,
      decoration: const BoxDecoration(color: AppColors.lightGrey),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.newReleases,
            style: TextStyles.font15WhiteRegular,
          ),
          verticalSpace(14),
           MoviesList()
        ],
      ),
    );
*/