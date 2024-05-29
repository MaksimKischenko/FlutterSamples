
import 'package:json_annotation/json_annotation.dart';

import 'ads_item.dart';

part 'get_goods_response.g.dart';

@JsonSerializable()
class GoodsInfo {

  @JsonKey(name: 'ads')
  final List<AdsItem>? adsItemList;

  GoodsInfo({
    this.adsItemList,
  });

  factory GoodsInfo.fromJson(Map<String, dynamic> json) => _$GoodsInfoFromJson(json);
  Map<String, dynamic> toJson() => _$GoodsInfoToJson(this);
}
