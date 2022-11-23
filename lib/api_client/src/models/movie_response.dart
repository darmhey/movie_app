import 'package:json_annotation/json_annotation.dart';

import 'movie.dart';

part 'movie_response.g.dart';

@JsonSerializable(explicitToJson: true)
class MovieResponse {
  final List<Movie>? result;

  MovieResponse({required this.result});

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);
}
