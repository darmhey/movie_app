import 'package:json_annotation/json_annotation.dart';

part 'cast.g.dart';

@JsonSerializable()
class Cast {
  final String? name;
  @JsonKey(name: 'profile_path')
  final String? profilePath;

  Cast({required this.name, required this.profilePath});

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);
  Map<String, dynamic> toJson() => _$CastToJson(this);
}
