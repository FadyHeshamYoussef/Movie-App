import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/view/movie/cubit.dart';
import 'package:movie_app/view/movie/model.dart';
import 'package:movie_app/view/movie_details/view.dart';
part 'item.dart';
class MovieView extends StatelessWidget {
  const MovieView({super.key});

@override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCubit()..getData(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Movie App"),
        ),
        body: BlocBuilder<MovieCubit,MovieState> (
          buildWhen: (previous, current) => current is!GetMoviesFromPaginationLoadingState,
          builder:(context, state) {
            if(state is GetMoviesLoadingState)
            {
              return const Center(child:CircularProgressIndicator());
            }else if (state is GetMoviesFailedState)
            {
              return const Center(child: Text("Please check the network"),);
            }else if(state is GetMoviesSuccessState)
            {
              return NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  if(notification.metrics.pixels == notification.metrics.maxScrollExtent && notification is ScrollUpdateNotification)
                  {
                    print("Fadyyyyyyyy");
                    MovieCubit cubit = BlocProvider.of(context);
                    cubit.getData(fromLoading: true);
                  }
                  return true;
                 // print("notification");
                },
                child: ListView.separated(
                    padding: const EdgeInsetsDirectional.all(16),
                    itemBuilder: (context, index) => _Item(model: state.list[index]),
                    separatorBuilder: (context, index) => const SizedBox(height: 20,),
                    itemCount: state.list.length,
                ),
              );
            } else
            {
              return const Text("Un Handeld Exception");
            }
          },
        ),
        bottomNavigationBar: SizedBox(
          height: 70,
          child: BlocBuilder<MovieCubit,MovieState>(
            buildWhen: (previous, current) => current is GetMoviesFromPaginationLoadingState || current is GetMoviesSuccessState || current is GetMovieFromPaginationFailedState ,
            builder: (context, state) {
            if(state is GetMoviesFromPaginationLoadingState)
            {
              return const Center(child: CircularProgressIndicator(),);
            }else
            {
              return const SizedBox.shrink();
            }
          },

          ),
        ),

        ),
      );
  }
}





