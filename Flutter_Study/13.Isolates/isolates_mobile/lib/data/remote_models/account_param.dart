import 'package:json_annotation/json_annotation.dart';

part 'account_param.g.dart';

@JsonSerializable()
class AccountParam {

  @JsonKey(name: 'p1')
  final String? categoryP1;

  @JsonKey(name: 'v1')
  final String? categoryV1;
  
  @JsonKey(name: 'p')
  final String? categoryP;

  @JsonKey(name: 'v')
  final dynamic categoryV;

  
  AccountParam({
    required this.categoryP1,
    required this.categoryV1,
    required this.categoryP,
    required this.categoryV,
  });
  
  
  

  factory AccountParam.fromJson(Map<String, dynamic> json) => _$AccountParamFromJson(json);
  Map<String, dynamic> toJson() => _$AccountParamToJson(this);
}
