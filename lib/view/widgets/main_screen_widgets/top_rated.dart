import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/api_client/src/movie_repository.dart';
import 'package:movie_app/bloc/bloc/movie_bloc_bloc.dart';

import '../loading_widget.dart';
import '../movies_list_widget.dart';
import 'description.dart';

class TopRated extends StatelessWidget {
  const TopRated({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieBlocBloc(
        movieRepository: RepositoryProvider.of<MovieRepository>(context),
      )..add(const FetchTopRatedEvent()),
      child: BlocBuilder<MovieBlocBloc, MovieBlocState>(
        builder: (context, state) {
          switch (state.status) {
            case MovieStatus.loading:
              return const LoadingWidget();
            case MovieStatus.success:
              return state.movie.isEmpty
                  ? const Center(child: Text('Empty List'))
                  : SizedBox(
                      height: MediaQuery.of(context).size.height * 0.23,
                      child: Column(
                        children: [
                          const Description(
                              section: 'All-Time Top Rated Movies'),
                          Expanded(
                            child: ListView.builder(
                              itemCount: state.movie.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: ((context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8.0, top: 8),
                                  child: MoviesListWidget(
                                    imageBaseUrl:
                                        'https://image.tmdb.org/t/p/w300/',
                                    imageUrl: state.movie[index].posterPath!,
                                    //myHeight: 0.2,
                                    movie: state.movie[index],
                                  ),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    );
            case MovieStatus.failure:
            default:
              return const Center(child: Text('Oops something went wrong!'));
          }
        },
      ),
    );
  }
}
