import 'package:application/features/home/data/models/new_releases_response.dart';

sealed class NewReleasesStates {}

class LoadingState extends NewReleasesStates {}

class SuccessState extends NewReleasesStates {
  List<Results> resuletsList;
  SuccessState(this.resuletsList);
}

class ErrorState extends NewReleasesStates {
  String errorMessage;
  ErrorState(this.errorMessage);
}
