part of'cubit.dart';
class MovieState{}


class GetMoviesLoadingState extends MovieState {}

class GetMoviesSuccessState extends MovieState {
  final List<MovieModel> list ;

  GetMoviesSuccessState({required this.list});
}

class GetMoviesFailedState extends MovieState {}

class GetMoviesFromPaginationLoadingState extends MovieState {}

class GetMovieFromPaginationFailedState extends MovieState {}