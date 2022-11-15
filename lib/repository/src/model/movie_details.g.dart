// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetails _$MovieDetailsFromJson(Map<String, dynamic> json) => MovieDetails(
      similar:
          SimilarResponse.fromJson(json['similar'] as Map<String, dynamic>),
      casts: CastResponse.fromJson(json['casts'] as Map<String, dynamic>),
      movie: MovieResponse.fromJson(json['movie'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieDetailsToJson(MovieDetails instance) =>
    <String, dynamic>{
      'movie': instance.movie.toJson(),
      'similar': instance.similar.toJson(),
      'casts': instance.casts.toJson(),
    };
