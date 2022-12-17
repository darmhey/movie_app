// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'similar_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SimilarResponse _$SimilarResponseFromJson(Map<String, dynamic> json) =>
    SimilarResponse(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SimilarResponseToJson(SimilarResponse instance) =>
    <String, dynamic>{
      'results': instance.results?.map((e) => e.toJson()).toList(),
    };
