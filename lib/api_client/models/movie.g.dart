// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      title: json['title'] as String,
      backdrop: json['backdrop_path'] as String,
      overview: json['overview'] as String,
      posterPath: json['bposter_path'] as String,
      movieId: json['id'] as int,
      genreIds:
          (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
      releaseDate: json['release_date'] as String,
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'title': instance.title,
      'backdrop_path': instance.backdrop,
      'overview': instance.overview,
      'bposter_path': instance.posterPath,
      'id': instance.movieId,
      'genre_ids': instance.genreIds,
      'release_date': instance.releaseDate,
    };
