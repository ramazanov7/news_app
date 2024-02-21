part of 'home_page_cubit.dart';

abstract class HomePageState {}

class HomePageEmpty extends HomePageState {}

class HomePageLoading extends HomePageState {}

class HomePageLoaded extends HomePageState {
  List<Movies> movies;
  HomePageLoaded({required this.movies});
}

class HomePageError extends HomePageState {
  String message;
  HomePageError({required this.message});
}
