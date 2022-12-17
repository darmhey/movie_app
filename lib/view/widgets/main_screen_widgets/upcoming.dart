import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/api_client/src/movie_repository.dart';
import 'package:movie_app/bloc/bloc/movie_bloc_bloc.dart';
import 'package:movie_app/view/widgets/detail_screen_widgets/movie_details_screen.dart';
import 'package:movie_app/view/widgets/loading_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
          final bloc = BlocProvider.of<MovieBlocBloc>(context);

          switch (state.status) {
            case MovieStatus.loading:
              return const LoadingWidget();
            case MovieStatus.success:
              return state.movie.isEmpty
                  ? const Center(child: Text('Empty List'))
                  : CarouselSlider(
                      options: CarouselOptions(
                        aspectRatio: 2 / 3,
                        autoPlay: false,
                        viewportFraction: 1.0,
                        enlargeCenterPage: true,
                      ),
                      items: state.movie.map(
                        (movie) {
                          return Stack(
                            children: [
                              AspectRatio(
                                aspectRatio: 2 / 3.0,
                                child: Image.network(
                                  'https://image.tmdb.org/t/p/original/${movie.posterPath}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              AspectRatio(
                                aspectRatio: 2 / 3.0,
                                child: Container(
                                    decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      stops: const [
                                        0.0,
                                        0.4,
                                        0.4,
                                        1.0,
                                      ],
                                      colors: [
                                        Colors.black.withOpacity(1.0),
                                        Colors.black.withOpacity(0.0),
                                        Colors.black.withOpacity(0.0),
                                        Colors.black.withOpacity(0.7),
                                      ]),
                                )),
                              ),
                              Positioned(
                                left: 10,
                                top: 40,
                                right: 10,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: const [
                                        Text(
                                          'Upcoming movie',
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        const Text(
                                          'Release Date:',
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text(
                                          movie.releaseDate!,
                                          style: const TextStyle(
                                            color: Colors.white70,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute<MovieDetailsScreen>(
                                      builder: (context) {
                                        return BlocProvider.value(
                                          value: bloc,
                                          child: MovieDetailsScreen(
                                            releaseDate: movie.releaseDate!,
                                            backdrop: movie.backdrop!,
                                            movieId: movie.movieId!,
                                            genres: movie.genreIds!,
                                            overview: movie.overview!,
                                            title: movie.title!,
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              )
                            ],
                          );
                        },
                      ).toList(),
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


// BlocProvider(
//                                           create: (context) => MovieBlocBloc(
//                                             movieRepository: RepositoryProvider
//                                                 .of<MovieRepository>(context),
//                                           )..add(const FetchCastsEvent(
//                                               movieId: 724495)),
//                                           child: MovieDetailsScreen(
//                                             releaseDate: movie.releaseDate!,
//                                             backdrop: movie.backdrop!,
//                                             movieId: movie.movieId!,
//                                             genres: movie.genreIds!,
//                                             overview: movie.overview!,
//                                             title: movie.title!,
//                                           ),
//                                         );

