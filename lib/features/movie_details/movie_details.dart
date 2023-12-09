import 'package:application/core/helper/spacing.dart';
import 'package:application/core/theming/app_colors.dart';
import 'package:application/core/theming/text_styles.dart';
import 'package:application/features/home/data/models/movie_details_response.dart';
import 'package:application/features/home/ui/home_screen.dart';
import 'package:application/features/movie_details/cubit/movie_details_cubit.dart';
import 'package:application/features/movie_details/cubit/movie_details_states.dart';
import 'package:application/features/movie_details/widgets/more_like_this.dart';
import 'package:application/features/movie_details/widgets/movies_details_top_section.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/helper/api_constants.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({super.key, required this.movieId});
  final String movieId;
  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  late MovieDetailsResponse movieDetails;
  var movieDetailsCubit = MovieDetailsCubit();
  @override
  void initState() {
    super.initState();
    movieDetailsCubit.getMovieDetailsById(widget.movieId);
  }

  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsStates>(
      bloc: movieDetailsCubit,
      builder: (context, state) {
        switch (state) {
          case LoadingState():
            {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    backgroundColor: AppColors.yellowColor,
                  ),
                ),
              );
            }
          case ErrorState():
            {
              return Scaffold(
                body: Center(
                  child: Text(
                    state.errorMessage,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            }
          case SuccessState():
            {
              movieDetails = state.response;
              return Scaffold(
                appBar: AppBar(
                  title: Text(
                    movieDetails.title!,
                    style: TextStyles.font20WightRegular,
                  ),
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ));
                    },
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.white,
                  ),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl:
                            ApiConstants.baseImage + movieDetails.backdropPath!,
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                      MovieDetailsTopSection(movieDetails: movieDetails),
                      verticalSpace(18),
                      //MoreLikeThis(movieId: movieDetails.id.toString()),
                    ],
                  ),
                ),
              );
            }
        }
      },
    );
  }
}
