import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  final String? title;
  @JsonKey(name: 'backdrop_path')
  final String? backdrop;
  final String? overview;
  @JsonKey(name: 'bposter_path')
  final String? posterPath;
  @JsonKey(name: 'id')
  final int? movieId;
  @JsonKey(name: 'genre_ids')
  final List<int>? genreIds;
  @JsonKey(name: 'release_date')
  final String? releaseDate;

  Movie(
      {required this.title,
      required this.backdrop,
      required this.overview,
      required this.posterPath,
      required this.movieId,
      required this.genreIds,
      required this.releaseDate});

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
