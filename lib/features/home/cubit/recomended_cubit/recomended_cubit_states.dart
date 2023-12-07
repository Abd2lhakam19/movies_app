import 'package:application/features/home/data/models/recomended_response.dart';

sealed class RecomendedStates {}

class LoadingState extends RecomendedStates {}

class SuccessState extends RecomendedStates {
  List<Results> resultList;
  SuccessState(this.resultList);
}

class ErrorState extends RecomendedStates {
  String errorMessage;
  ErrorState(this.errorMessage);
}
