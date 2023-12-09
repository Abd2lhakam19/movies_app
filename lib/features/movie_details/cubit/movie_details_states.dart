import 'package:application/features/home/data/models/similar_response.dart';

sealed class MovieDetailsStates {}

class LoadingState extends MovieDetailsStates {}

class SuccessState extends MovieDetailsStates {
  dynamic response;
  SuccessState(this.response);
}

class ErrorState extends MovieDetailsStates {
  String errorMessage;
  ErrorState(this.errorMessage);
}

sealed class SimilarMoviesState {}

class LoadingSimilarState extends SimilarMoviesState {}

class SuccessSimilarState extends SimilarMoviesState {
  List<Results> results;
  SuccessSimilarState(this.results);
}

class ErrorSimilarState extends SimilarMoviesState {
  String errorMessage;
  ErrorSimilarState(this.errorMessage);
}
