import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/api_client/src/movie_repository.dart';
import 'package:movie_app/bloc/bloc/movie_bloc_bloc.dart';
import 'package:movie_app/view/widgets/loading_widget.dart';

class Upcoming extends StatelessWidget {
  const Upcoming({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieBlocBloc(
        movieRepository: RepositoryProvider.of<MovieRepository>(context),
      )..add(const FetchUpcomingEvent()),
      child: BlocBuilder<MovieBlocBloc, MovieBlocState>(
        builder: (context, state) {
          switch (state.status) {
            case MovieStatus.loading:
              return const LoadingWidget();
            case MovieStatus.success:
              return state.movie.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(68.0),
                        child: SizedBox(
                          width: 80,
                          child: Column(
                            children: [
                              Text('Page no: ${state.page}'),
                              const Center(child: Text('Empty List')),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Center(child: Text(state.movie[1].overview!));

            // return SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.7,
            //   child: ListView.builder(
            //     itemCount: 5, //state.movie.length,
            //     scrollDirection: Axis.horizontal,
            //     itemBuilder: ((context, index) {
            //       return AspectRatio(

            //         aspectRatio: 2 / 2.5,
            //         child: Image.network(
            //           'https://image.tmdb.org/t/p/original//bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg',
            //           fit: BoxFit.cover,
            //         ),
            //       );
            //     }),
            //   ),
            // );
            case MovieStatus.failure:
            default:
              return const Center(child: Text('Oops something went wrong!'));
          }
        },
      ),
    );
  }
}
