import 'package:json_annotation/json_annotation.dart';

part 'price_min_info.g.dart';

@JsonSerializable()
class PriceMinInfo {

  @JsonKey(name: 'amount')
  final String? amount;

  PriceMinInfo({
    this.amount,
  });

  factory PriceMinInfo.fromJson(Map<String, dynamic> json) => _$PriceMinInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PriceMinInfoToJson(this);
}
