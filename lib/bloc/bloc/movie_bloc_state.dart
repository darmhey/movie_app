part of 'movie_bloc_bloc.dart';

enum MovieStatus { loading, success, failure }

class MovieBlocState extends Equatable {
  final MovieStatus status;
  final List<Movie> movie;
  final List<Cast> cast;
  final List<Movie> similar;
  const MovieBlocState({
    this.status = MovieStatus.loading,
    this.cast = const <Cast>[],
    this.similar = const <Movie>[],
    this.movie = const <Movie>[],
  });

  MovieBlocState copyWith({
    MovieStatus? status,
    List<Movie>? movie,
    List<Movie>? similar,
    List<Cast>? cast,
  }) {
    return MovieBlocState(
      status: status ?? this.status,
      cast: cast ?? this.cast,
      similar: similar ?? this.similar,
      movie: movie ?? this.movie,
    );
  }

  @override
  List<Object> get props => [status, movie];

  @override
  String toString() {
    return ''' status: $status, movie: $movie }''';
  }
}
