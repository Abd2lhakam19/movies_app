import 'package:application/features/search/data/models/search_response.dart';

sealed class SearchStates {}

class LoadingSearchState extends SearchStates {}

class ErrorSearchState extends SearchStates {
  String errorMessage;
  ErrorSearchState(this.errorMessage);
}

class SuccessSearchState extends SearchStates {
  List<Results> result;
  SuccessSearchState(this.result);
}
