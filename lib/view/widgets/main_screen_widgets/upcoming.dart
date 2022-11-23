import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/api_client/src/movie_repository.dart';
import 'package:movie_app/bloc/bloc/movie_bloc_bloc.dart';

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
          return Container();
        },
      ),
    );
  }
}