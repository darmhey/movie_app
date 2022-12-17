import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/api_client/src/movie_repository.dart';
import 'package:movie_app/bloc/bloc/movie_bloc_bloc.dart';

class MovieCasts extends StatelessWidget {
  const MovieCasts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => MovieBlocBloc(
            movieRepository: RepositoryProvider.of<MovieRepository>(context),
          )..add(const FetchCastsEvent())),
      child: Container(),
    );
    // return BlocProvider(
    //   create: ((context) => MovieBlocBloc(
    //         movieRepository: RepositoryProvider.of<MovieRepository>(context),
    //       )..add(FetchCastsEvent(movieId: movieId))),
    //   child: BlocBuilder<MovieBlocBloc, MovieBlocState>(
    //     builder: (context, state) {
    //       switch (state.status) {
    //         case MovieStatus.loading:
    //           return const Padding(
    //             padding: EdgeInsets.all(8.0),
    //             child: CircularProgressIndicator(),
    //           );
    //         case MovieStatus.success:
    //           return SizedBox(
    //             child: ListView.builder(
    //               scrollDirection: Axis.horizontal,
    //               itemCount: state.cast.length,
    //               itemBuilder: (context, index) {
    //                 return AspectRatio(
    //                   aspectRatio: 2 / 3,
    //                   child: ClipRRect(
    //                     borderRadius: BorderRadius.circular(5.0),
    //                     child: Image.network(
    //                       "https://image.tmdb.org/t/p/w300/${state.cast[index].profilePath}",
    //                       fit: BoxFit.cover,
    //                     ),
    //                   ),
    //                 );
    //               },
    //             ),
    //           );
    //         case MovieStatus.failure:
    //         default:
    //           return const Center(child: Text('Oops something went wrong!'));
    //       }
    //     },
    //   ),
    // );
  }
}
