import 'package:json_annotation/json_annotation.dart';

part 'ad_params.g.dart';

@JsonSerializable()
class AdParam {

  @JsonKey(name: 'p1')
  final String? categoryP1;

  @JsonKey(name: 'v1')
  final String? categoryV1;

  @JsonKey(name: 'p')
  final String? categoryP;

  @JsonKey(name: 'v')
  final dynamic categoryV;


  AdParam({
    required this.categoryP1,
    required this.categoryV1,
    required this.categoryP,
    required this.categoryV,
  });

  factory AdParam.fromJson(Map<String, dynamic> json) => _$AdParamFromJson(json);
  Map<String, dynamic> toJson() => _$AdParamToJson(this);
}
