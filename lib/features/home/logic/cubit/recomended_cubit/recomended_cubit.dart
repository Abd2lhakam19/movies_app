import 'package:application/features/home/data/api/api_manager.dart';
import 'package:application/features/home/logic/cubit/recomended_cubit/recomended_cubit_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecomendedCubit extends Cubit<RecomendedStates> {
  RecomendedCubit() : super(LoadingState());
  void getRecomendedMovies() async {
    emit(LoadingState());
    try {
      var response = await ApiManager.getRecomendedMovies();
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
