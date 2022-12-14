import 'package:json_annotation/json_annotation.dart';

import 'movie.dart';

part 'similar_response.g.dart';

@JsonSerializable(explicitToJson: true)
class SimilarResponse {
  final List<Movie>? results;

  SimilarResponse({required this.results});

  factory SimilarResponse.fromJson(Map<String, dynamic> json) =>
      _$SimilarResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SimilarResponseToJson(this);
}
