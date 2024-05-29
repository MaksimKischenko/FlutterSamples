import 'package:json_annotation/json_annotation.dart';

import 'package:custom_onliner_app/data/remote_models/price_min_info.dart';

part 'price_info.g.dart';

@JsonSerializable()
class PriceInfo {

  @JsonKey(name: 'price_min')
  final PriceMinInfo? priceMin;

  @JsonKey(name: 'price_max')
  final PriceMinInfo? priceMax;
  
  PriceInfo({
    required this.priceMin,
    required this.priceMax,
  });

  factory PriceInfo.fromJson(Map<String, dynamic> json) => _$PriceInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PriceInfoToJson(this);
}
