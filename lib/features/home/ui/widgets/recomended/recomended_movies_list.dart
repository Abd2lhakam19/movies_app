import 'package:application/core/theming/app_colors.dart';
import 'package:application/core/theming/text_styles.dart';
import 'package:application/features/home/logic/cubit/recomended_cubit/recomended_cubit.dart';
import 'package:application/features/home/logic/cubit/recomended_cubit/recomended_cubit_states.dart';
import 'package:application/features/home/ui/widgets/recomended/movie_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecomendedMoviesList extends StatefulWidget {
  const RecomendedMoviesList({super.key});

  @override
  State<RecomendedMoviesList> createState() => _RecomendedMoviesListState();
}

class _RecomendedMoviesListState extends State<RecomendedMoviesList> {
  var recomendedCubit = RecomendedCubit();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    recomendedCubit.getRecomendedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecomendedCubit, RecomendedStates>(
      bloc: recomendedCubit,
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
              var result = state.resultList;
              return Expanded(
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => MovieListItem(
                          results: result[index],
                        ),
                    separatorBuilder: (context, index) => const VerticalDivider(
                          thickness: 2,
                          color: Colors.transparent,
                        ),
                    itemCount: result.length),
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
Expanded(
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => const MovieListItem(),
          separatorBuilder: (context, index) => const VerticalDivider(
                thickness: 2,
                color: Colors.transparent,
              ),
          itemCount: 10),
    );
*/ 