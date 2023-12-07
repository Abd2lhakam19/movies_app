import 'package:application/features/home/data/api/api_manager.dart';
import 'package:application/features/home/logic/cubit/slider_cubit/slider_cubit_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderCubit extends Cubit<SliderState> {
  SliderCubit() : super(LodaingState());
  void getPopularMovies() async {
    emit(LodaingState());
    try {
      var response = await ApiManager.getPopularMovies();
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
