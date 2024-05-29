import 'package:json_annotation/json_annotation.dart';

part 'price_max_info.g.dart';

@JsonSerializable()
class PriceMaxInfo {

  @JsonKey(name: 'amount')
  final String? amount;

  PriceMaxInfo({
    this.amount,
  });

  factory PriceMaxInfo.fromJson(Map<String, dynamic> json) => _$PriceMaxInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PriceMaxInfoToJson(this);
}
