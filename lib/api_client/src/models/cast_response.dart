import 'package:json_annotation/json_annotation.dart';
import 'cast.dart';

part 'cast_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CastResponse {
  final List<Cast> cast;

  CastResponse({required this.cast});

  factory CastResponse.fromJson(Map<String, dynamic> json) =>
      _$CastResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CastResponseToJson(this);
}
