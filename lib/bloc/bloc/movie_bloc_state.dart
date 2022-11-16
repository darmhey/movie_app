part of 'movie_bloc_bloc.dart';

enum MovieStatus { initial, loading, success, failure }

class MovieBlocState extends Equatable {
  final MovieStatus status;
  final MovieDetails movie;
  MovieBlocState({
    this.status = MovieStatus.initial,
    MovieDetails? movie,
  }) : movie = movie ?? MovieDetails.empty;

  MovieBlocState copyWith({
    MovieStatus? status,
    MovieDetails? details,
  }) {
    return MovieBlocState(
      status: status ?? this.status,
      movie: movie,
    );
  }

  @override
  List<Object> get props => [status, movie];

  @override
  String toString() {
    return ''' status: $status, movie: $movie }''';
  }
}
