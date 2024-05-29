
import 'package:json_annotation/json_annotation.dart';
import 'package:custom_onliner_app/data/remote_models/product_info.dart';

part 'get_goods_response.g.dart';

@JsonSerializable()
class GoodsInfo {

  @JsonKey(name: 'products')
  final List<ProductInfo>? products;

  GoodsInfo({
    this.products,
  });

  factory GoodsInfo.fromJson(Map<String, dynamic> json) => _$GoodsInfoFromJson(json);
  Map<String, dynamic> toJson() => _$GoodsInfoToJson(this);
}
