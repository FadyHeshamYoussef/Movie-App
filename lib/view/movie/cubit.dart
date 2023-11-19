import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'model.dart';

part 'states.dart';
class MovieCubit extends Cubit<MovieState>
{
  MovieCubit():super(MovieState());
  final List<MovieModel> _list = [];
  int pageNumber = 1;
  
  getData({bool fromLoading = false}) async{
    if(fromLoading)
    {
      emit(GetMoviesFromPaginationLoadingState());
    }else
    {
      emit(GetMoviesLoadingState());
    }

    try{
      var response = await Dio().get("https://api.themoviedb.org/3/discover/movie?api_key=2001486a0f63e9e4ef9c4da157ef37cd&page$pageNumber");
      var model = MovieData.fromMap(response.data);
      pageNumber++;
      _list.addAll(model.list);

      emit(GetMoviesSuccessState(list: _list));
    }on DioException {
      emit(GetMoviesFailedState());
    }
    
  }
}