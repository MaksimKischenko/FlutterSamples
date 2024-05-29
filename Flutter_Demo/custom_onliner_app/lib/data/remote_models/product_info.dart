import 'package:json_annotation/json_annotation.dart';

import 'package:custom_onliner_app/data/remote_models/images_info.dart';
import 'package:custom_onliner_app/data/remote_models/price_info.dart';
import 'package:custom_onliner_app/data/remote_models/second_price_info.dart';

part 'product_info.g.dart';

@JsonSerializable()
class ProductInfo {

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'full_name')
  final String? fullName;

  @JsonKey(name: 'extended_name')
  final String? extendedName;

  @JsonKey(name: 'status')
  final String? status;

  @JsonKey(name: 'images')
  final ImagesInfo? imagesInfo;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'prices')
  final PriceInfo? priceInfo;

  @JsonKey(name: 'second')
  final SecondPriceInfo? secondPriceInfo;
  
  ProductInfo({
    required this.id,
    this.name,
    this.fullName,
    this.extendedName,
    this.status,
    this.imagesInfo,
    this.description,
    this.priceInfo,
    this.secondPriceInfo,
  });


  factory ProductInfo.fromJson(Map<String, dynamic> json) => _$ProductInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductInfoToJson(this);
}
