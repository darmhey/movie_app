// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'similar_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SimilarResponse _$SimilarResponseFromJson(Map<String, dynamic> json) =>
    SimilarResponse(
      result: Movie.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SimilarResponseToJson(SimilarResponse instance) =>
    <String, dynamic>{
      'result': instance.result.toJson(),
    };
