import 'package:application/features/home/cubit/new_releases_cubit/new_releases_cubit_states.dart';
import 'package:application/features/home/data/api/api_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewReleasesCubit extends Cubit<NewReleasesStates> {
  NewReleasesCubit() : super(LoadingState());
  void getNewReleasesMovies() async {
    emit(LoadingState());
    try {
      var response = await ApiManager.getNewReleasesMovies();
      if (response.status_code == 7 || response.status_code == 34) {
        emit(ErrorState(response.status_message ?? ""));
      } else {
        emit(SuccessState(response.results ?? []));
      }
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
