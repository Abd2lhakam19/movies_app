import 'package:application/core/theming/app_colors.dart';
import 'package:application/core/theming/text_styles.dart';
import 'package:application/features/movie_details/cubit/movie_details_cubit.dart';
import 'package:application/features/movie_details/cubit/movie_details_states.dart';
import 'package:application/features/movie_details/widgets/movie_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SimilarMovieList extends StatefulWidget {
  const SimilarMovieList({super.key, required this.movieId});
  final String movieId;

  @override
  State<SimilarMovieList> createState() => _SimilarMovieListState();
}

class _SimilarMovieListState extends State<SimilarMovieList> {
  var similarCubit = SimilarMoviesCubit();
  @override
  void initState() {
    super.initState();
    print(widget.movieId);
    similarCubit.getSimilarMoviesById(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarMoviesCubit, SimilarMoviesState>(
      bloc: similarCubit,
      builder: (context, state) {
        switch (state) {
          case LoadingSimilarState():
            {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.yellowColor,
                ),
              );
            }
          case SuccessSimilarState():
            {
              var result = state.results;
              return Expanded(
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        MoviListSimilarItem(results: result[index]),
                    separatorBuilder: (context, index) => const VerticalDivider(
                          thickness: 2,
                          color: Colors.transparent,
                        ),
                    itemCount: result.length),
              );
            }
          case ErrorSimilarState():
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
