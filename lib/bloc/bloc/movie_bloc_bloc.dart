import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/api_client/api_client.dart';

part 'movie_bloc_event.dart';
part 'movie_bloc_state.dart';

class MovieBlocBloc extends Bloc<MovieBlocEvent, MovieBlocState> {
  final MovieRepository movieRepository;

  MovieBlocBloc({required this.movieRepository})
      : super(const MovieBlocState()) {
    on<FetchPopularEvent>((event, emit) async {
      emit(state.copyWith(status: MovieStatus.loading));
      try {
        final movie = await movieRepository.getMovie('popular');
        emit(state.copyWith(
          status: MovieStatus.success,
          movie: movie.results,
        ));
      } on Exception {
        emit(state.copyWith(status: MovieStatus.failure));
      }
    });
    on<FetchNowPlayingEvent>((event, emit) async {
      emit(state.copyWith(status: MovieStatus.loading));
      try {
        final movie = await movieRepository.getMovie('now_playing');
        emit(state.copyWith(
          status: MovieStatus.success,
          movie: movie.results,
        ));
      } on Exception {
        emit(state.copyWith(status: MovieStatus.failure));
      }
    });
    on<FetchTopRatedEvent>((event, emit) async {
      emit(state.copyWith(status: MovieStatus.loading));

      try {
        final movie = await movieRepository.getMovie('top_rated');
        emit(state.copyWith(
          status: MovieStatus.success,
          movie: movie.results,
        ));
      } on Exception {
        emit(state.copyWith(status: MovieStatus.failure));
      }
    });
    on<FetchUpcomingEvent>((event, emit) async {
      emit(state.copyWith(status: MovieStatus.loading));
      try {
        final movie = await movieRepository.getMovie('upcoming');
        emit(state.copyWith(
          status: MovieStatus.success,
          movie: movie.results,
        ));
      } on Exception {
        emit(state.copyWith(status: MovieStatus.failure));
      }
    });

    on<FetchCastsEvent>((event, emit) async {
      emit(state.copyWith(status: MovieStatus.loading));

      try {
        final casts = await movieRepository.getCasts(724495);
        emit(state.copyWith(
          status: MovieStatus.success,
          cast: casts.cast,
        ));
      } on Exception {
        emit(state.copyWith(status: MovieStatus.failure));
      }
    });
  }
}
