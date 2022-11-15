import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../api_client/src/models/models.dart';

part 'movie_details.g.dart';

@JsonSerializable(explicitToJson: true)
class MovieDetails extends Equatable {
  final MovieResponse movie;
  final SimilarResponse similar;
  final CastResponse casts;

  const MovieDetails({
    required this.similar,
    required this.casts,
    required this.movie,
  });

  factory MovieDetails.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$MovieDetailsToJson(this);

  MovieDetails copyWith({
    MovieResponse? movie,
    SimilarResponse? similar,
    CastResponse? casts,
  }) {
    return MovieDetails(
      movie: movie ?? this.movie,
      similar: similar ?? this.similar,
      casts: casts ?? this.casts,
    );
  }

  static final empty = MovieDetails(
    similar: SimilarResponse(
        result: Movie(
            title: '',
            backdrop: '',
            overview: '',
            posterPath: '',
            movieId: 0,
            genreIds: [0],
            releaseDate: '')),
    casts: CastResponse(
      cast: [Cast(name: '', profilePath: '')],
    ),
    movie: MovieResponse(
        result: Movie(
            title: '',
            backdrop: '',
            overview: '',
            posterPath: '',
            movieId: 0,
            genreIds: [0],
            releaseDate: '')),
  );

  @override
  List<Object?> get props => [movie, similar, casts];
}
