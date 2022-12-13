import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/bloc/movie_bloc_bloc.dart';

class MovieDetailsScreen extends StatelessWidget {
  final String overview;
  final String releaseDate;
  final String title;
  final int movieId;
  final String backdrop;
  final List<int> genres;

  const MovieDetailsScreen(
      {required this.overview,
      required this.releaseDate,
      required this.title,
      required this.movieId,
      required this.genres,
      required this.backdrop,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<MovieBlocBloc, MovieBlocState>(
        builder: ((context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 2.4 / 3,
                      child: Image.network(
                        'https://image.tmdb.org/t/p/original/$backdrop',
                        fit: BoxFit.cover,
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 2.4 / 3.0,
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
                              Colors.black.withOpacity(0.8),
                              Colors.black.withOpacity(0.0),
                              Colors.black.withOpacity(0.0),
                              Colors.black.withOpacity(0.3),
                            ]),
                      )),
                    ),
                    Positioned(
                      left: 60,
                      bottom: 10,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  'Release Date: $releaseDate',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'OVERVIEW',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        overview,
                        style: const TextStyle(
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
