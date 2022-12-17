import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/api_client/src/movie_repository.dart';
import 'package:movie_app/bloc/bloc/movie_bloc_bloc.dart';
import 'package:movie_app/view/widgets/detail_screen_widgets/movie_details_screen.dart';

import '../loading_widget.dart';
import '../movies_list_widget.dart';
import 'description.dart';

class Popular extends StatelessWidget {
  const Popular({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieBlocBloc(
        movieRepository: RepositoryProvider.of<MovieRepository>(context),
      )..add(const FetchPopularEvent()),
      child: BlocBuilder<MovieBlocBloc, MovieBlocState>(
        builder: (context, state) {
          final bloc = BlocProvider.of<MovieBlocBloc>(context);

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
                          const Description(section: 'Popular Movies'),
                          Expanded(
                            child: ListView.builder(
                              itemCount: state.movie.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: ((context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute<MovieDetailsScreen>(
                                        builder: (context) {
                                          return BlocProvider.value(
                                            value: bloc,
                                            child: MovieDetailsScreen(
                                              releaseDate: state
                                                  .movie[index].releaseDate!,
                                              backdrop:
                                                  state.movie[index].backdrop!,
                                              movieId:
                                                  state.movie[index].movieId!,
                                              genres:
                                                  state.movie[index].genreIds!,
                                              overview:
                                                  state.movie[index].overview!,
                                              title: state.movie[index].title!,
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, top: 8),
                                    child: MoviesListWidget(
                                      imageBaseUrl:
                                          'https://image.tmdb.org/t/p/w300/',
                                      imageUrl: state.movie[index].posterPath!,
                                      movie: state.movie[index],
                                    ),
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
