import 'package:application/features/search/cubit/search_states.dart';
import 'package:application/features/search/data/api/search_api_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(LoadingSearchState());
  void getSearchedMovies(String movieName) async {
    emit(LoadingSearchState());
    try {
      var response = await SearchApiManager.searchMovie(movieName);
      if (response.success == false) {
        emit(ErrorSearchState(response.status_message ?? ""));
      } else {
        emit(SuccessSearchState(response.results ?? []));
      }
    } catch (e) {
      emit(ErrorSearchState(e.toString()));
    }
  }
}
