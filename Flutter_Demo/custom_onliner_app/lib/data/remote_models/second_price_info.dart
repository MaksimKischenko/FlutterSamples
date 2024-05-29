import 'package:json_annotation/json_annotation.dart';

part 'second_price_info.g.dart';

@JsonSerializable()
class SecondPriceInfo {

  @JsonKey(name: 'offers_count')
  final int offersCount;

  @JsonKey(name: 'min_price')
  final Map<String, dynamic>? minPrice;

  SecondPriceInfo({
    required this.offersCount,
    required this.minPrice,
  });
  

  

  factory SecondPriceInfo.fromJson(Map<String, dynamic> json) => _$SecondPriceInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SecondPriceInfoToJson(this);
}
