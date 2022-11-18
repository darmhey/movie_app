// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'similar_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SimilarResponse _$SimilarResponseFromJson(Map<String, dynamic> json) =>
    SimilarResponse(
      result: (json['result'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SimilarResponseToJson(SimilarResponse instance) =>
    <String, dynamic>{
      'result': instance.result.map((e) => e.toJson()).toList(),
    };
