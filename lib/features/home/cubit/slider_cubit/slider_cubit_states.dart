import 'package:application/features/home/data/models/popular_response.dart';

sealed class SliderState {}

class SuccessState extends SliderState {
  List<Results> resultList;
  SuccessState(this.resultList);
}

class LodaingState extends SliderState {}

class ErrorState extends SliderState {
  String errorMessage;
  ErrorState(this.errorMessage);
}
