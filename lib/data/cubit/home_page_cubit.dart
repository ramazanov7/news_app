import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/models/movies_model.dart';
import 'package:news_app/services/movies_service.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageEmpty());
  int _currentMovie = 1;
  List<Movies> _movies = [];

  Future<void> onRefresh() async {
    try {
      emit(HomePageLoading());
      _currentMovie = 1;
      final data = await MovieService().getMovies(_currentMovie);
      _movies = data;
      _currentMovie++;
      emit(HomePageLoaded(movies: _movies));
    } catch (e) {
      emit(HomePageError(message: '$e'));
    }
  }

  Future<void> onLoading() async {
    try {
      final data = await MovieService().getMovies(_currentMovie);
      _currentMovie++;
      _movies.addAll(data);
      emit(HomePageLoaded(movies: _movies));
    } catch (e) {
      emit(HomePageError(message: '$e'));
    }
  }
}
