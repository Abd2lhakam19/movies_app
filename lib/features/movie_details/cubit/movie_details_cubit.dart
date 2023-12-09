import 'package:application/features/home/data/api/api_manager.dart';
import 'package:application/features/movie_details/cubit/movie_details_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsStates> {
  MovieDetailsCubit() : super(LoadingState());
  void getMovieDetailsById(String movieId) async {
    emit(LoadingState());
    try {
      var response = await ApiManager.getMovieDetails(movieId);
      if (response.status_code == 7 || response.status_code == 34) {
        emit(ErrorState(response.status_message ?? ""));
      } else {
        emit(SuccessState(response));
      }
    } catch (e) {
      emit(
        ErrorState(e.toString()),
      );
    }
  }
}

class SimilarMoviesCubit extends Cubit<SimilarMoviesState> {
  SimilarMoviesCubit() : super(LoadingSimilarState());
  void getSimilarMoviesById(String movieId) async {
    emit(LoadingSimilarState());
    try {
      var response = await ApiManager.getSimilarMovieDetails(movieId);
      if (response.status_code == 7 || response.status_code == 34) {
        emit(ErrorSimilarState(response.status_message ?? ""));
      } else {
        emit(SuccessSimilarState(response.results ?? []));
      }
    } catch (e) {
      emit(ErrorSimilarState(e.toString()));
    }
  }
}
