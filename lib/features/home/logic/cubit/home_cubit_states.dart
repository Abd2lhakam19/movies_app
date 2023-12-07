import 'package:application/features/home/data/models/popular_response.dart';

sealed class HomeStates {}

class SuccessState extends HomeStates {
  List<Results> resultList;
  SuccessState(this.resultList);
}

class LodaingState extends HomeStates {}

class ErrorState extends HomeStates {
  String errorMessage;
  ErrorState(this.errorMessage);
}
